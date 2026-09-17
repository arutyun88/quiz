import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/app/core/widgets/app_snack_bar.dart';
import 'package:quiz/features/ads/domain/rewarded_ads_gateway.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/daily_limit/presentation/daily_limit_page.dart';
import 'package:quiz/features/daily_limit/presentation/debug_rewarded_ad_page.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_state_views.dart';
import 'package:quiz/features/settings/presentation/subscription_page.dart';
import 'package:quiz/gen/strings.g.dart';
import 'package:uuid/uuid.dart';

class DailyLimitFlow extends ConsumerStatefulWidget {
  const DailyLimitFlow({super.key, this.reviewSourceAttemptId});

  final String? reviewSourceAttemptId;

  @override
  ConsumerState<DailyLimitFlow> createState() => _DailyLimitFlowState();
}

class _DailyLimitFlowState extends ConsumerState<DailyLimitFlow>
    with WidgetsBindingObserver {
  late final RewardedAdsGateway _ads = getIt<RewardedAdsGateway>();
  late final ProductAnalytics _analytics = getIt<ProductAnalytics>();
  bool _adBusy = false;
  String? _adStatus;
  bool _openingReview = false;
  bool _resumingQuizPlus = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _openingReview = widget.reviewSourceAttemptId != null;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      if (widget.reviewSourceAttemptId case final String source) {
        await ref
            .read(dailyEditionProvider.notifier)
            .bootstrapReviewReplacement(sourceAttemptId: source);
        if (mounted) setState(() => _openingReview = false);
        return;
      }
      if (ref.read(dailyEditionProvider) is! DailyEditionInitialState) return;
      final timezoneId = ref.read(authenticationProvider).mapOrNull(
            authenticated: (state) => state.user?.timezoneId,
          );
      ref.read(dailyEditionProvider.notifier).bootstrap(
            timezoneId: timezoneId,
          );
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(dailyEditionProvider.notifier).refreshContinuation();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_openingReview) {
      return const Scaffold(body: SafeArea(child: QuizLoading()));
    }
    final state = ref.watch(dailyEditionProvider);
    if (state case DailyEditionSummaryState(:final summary)
        when summary.continuation.quizPlus) {
      _resumeQuizPlus();
      return const Scaffold(body: SafeArea(child: QuizLoading()));
    }
    if (state is DailyEditionActiveState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.goNamed(state.run.startedAt == null ? 'home' : 'quiz');
        }
      });
    }

    return switch (state) {
      DailyEditionSummaryState(:final summary, :final isBusy) => DailyLimitPage(
          continuation: summary.continuation,
          isBusy: isBusy || _adBusy,
          isAdBusy: _adBusy,
          onKeepPlaying: () =>
              ref.read(dailyEditionProvider.notifier).continueEdition(),
          onQuizPlus: _openQuizPlus,
          onRefresh: () =>
              ref.read(dailyEditionProvider.notifier).refreshContinuation(),
          onClose: () => context.pop(),
          onWatchAd: _ads.available ? _watchAd : null,
          adStatus: _adStatus,
        ),
      DailyEditionFailedState(:final failure) => Scaffold(
          body: SafeArea(child: QuizError(failure: failure)),
        ),
      _ => const Scaffold(
          body: SafeArea(child: QuizLoading()),
        ),
    };
  }

  void _resumeQuizPlus() {
    if (_resumingQuizPlus) return;
    _resumingQuizPlus = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(dailyEditionProvider.notifier).continueEdition();
      if (mounted) _resumingQuizPlus = false;
    });
  }

  Future<void> _watchAd() async {
    final edition = ref.read(dailyEditionProvider);
    final userId = ref.read(authenticationProvider).mapOrNull(
          authenticated: (state) => state.user?.id,
        );
    if (_adBusy || edition is! DailyEditionSummaryState || userId == null) {
      return;
    }

    final previousRewardedVideosUsed =
        edition.summary.continuation.rewardedVideosUsed;
    setState(() {
      _adBusy = true;
      _adStatus = context.t.daily_limit.ad_loading;
    });
    final clientEventId = const Uuid().v4();
    var outcome = await _ads.showRewarded(
      userId: userId,
      runId: edition.run.runId,
      clientEventId: clientEventId,
    );
    if (!mounted) return;
    if (kDebugMode && outcome == RewardedAdShowOutcome.failed) {
      final earned =
          await Navigator.of(context, rootNavigator: true).push<bool>(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => DebugRewardedAdPage(
            rewardQuestions: edition.summary.continuation.questionsPerReward,
          ),
        ),
      );
      if (!mounted) return;
      outcome = earned == true
          ? RewardedAdShowOutcome.earned
          : RewardedAdShowOutcome.dismissed;
    }

    switch (outcome) {
      case RewardedAdShowOutcome.earned:
        if (kDebugMode) {
          await ref
              .read(dailyEditionProvider.notifier)
              .confirmDebugRewardedAd(clientEventId: clientEventId);
          if (!mounted) return;
        }
        setState(() {
          _adStatus = context.t.daily_limit.ad_awaiting_confirmation;
        });
        final confirmed = await ref
            .read(dailyEditionProvider.notifier)
            .waitForRewardedAdConfirmation(
              previousRewardedVideosUsed: previousRewardedVideosUsed,
            );
        if (!mounted) return;
        setState(() {
          _adBusy = false;
          _adStatus =
              confirmed ? null : context.t.daily_limit.ad_confirmation_delayed;
        });
        _trackAd(outcome, serverConfirmed: confirmed);
      case RewardedAdShowOutcome.dismissed:
        setState(() {
          _adBusy = false;
          _adStatus = null;
        });
        _trackAd(outcome);
      case RewardedAdShowOutcome.failed:
        setState(() {
          _adBusy = false;
          _adStatus = null;
        });
        AppSnackBar.showError(
          context,
          title: context.t.daily_limit.ad_failed_title,
          message: context.t.daily_limit.ad_failed_hint,
        );
        _trackAd(outcome);
      case RewardedAdShowOutcome.unavailable:
        setState(() {
          _adBusy = false;
          _adStatus = context.t.daily_limit.ad_unavailable;
        });
        _trackAd(outcome);
    }
  }

  Future<void> _openQuizPlus() async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        builder: (_) => const SubscriptionPage(),
      ),
    );
    if (!mounted) return;
    await ref.read(dailyEditionProvider.notifier).refreshContinuation();
  }

  void _trackAd(
    RewardedAdShowOutcome outcome, {
    bool serverConfirmed = false,
  }) {
    unawaited(
      _analytics.capture(
        ProductAnalyticsEvent.rewardedAdFinished,
        properties: {
          'sdk_outcome': outcome.name,
          'server_confirmed': serverConfirmed,
        },
      ),
    );
  }
}
