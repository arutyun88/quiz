import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/ads/domain/rewarded_ads_gateway.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/daily_limit/presentation/daily_limit_page.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_state_views.dart';
import 'package:quiz/gen/strings.g.dart';
import 'package:uuid/uuid.dart';

class DailyLimitFlow extends ConsumerStatefulWidget {
  const DailyLimitFlow({super.key});

  @override
  ConsumerState<DailyLimitFlow> createState() => _DailyLimitFlowState();
}

class _DailyLimitFlowState extends ConsumerState<DailyLimitFlow> {
  late final RewardedAdsGateway _ads = getIt<RewardedAdsGateway>();
  late final ProductAnalytics _analytics = getIt<ProductAnalytics>();
  bool _adBusy = false;
  String? _adStatus;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final timezoneId = ref.read(authenticationProvider).mapOrNull(
            authenticated: (state) => state.user?.timezoneId,
          );
      ref.read(dailyEditionProvider.notifier).bootstrap(
            timezoneId: timezoneId,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dailyEditionProvider);
    if (state is DailyEditionActiveState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.goNamed('quiz');
      });
    }

    return PopScope(
      canPop: false,
      child: switch (state) {
        DailyEditionSummaryState(:final summary, :final isBusy) =>
          DailyLimitPage(
            continuation: summary.continuation,
            isBusy: isBusy || _adBusy,
            onKeepPlaying: () =>
                ref.read(dailyEditionProvider.notifier).continueEdition(),
            onRefresh: () =>
                ref.read(dailyEditionProvider.notifier).refreshContinuation(),
            onClose: () => context.goNamed('home'),
            onWatchAd: _ads.available ? _watchAd : null,
            adStatus: _adStatus,
          ),
        DailyEditionFailedState(:final failure) => Scaffold(
            body: SafeArea(child: QuizError(failure: failure)),
          ),
        _ => const Scaffold(
            body: SafeArea(child: QuizLoading()),
          ),
      },
    );
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
    final outcome = await _ads.showRewarded(
      userId: userId,
      runId: edition.run.runId,
      clientEventId: const Uuid().v4(),
    );
    if (!mounted) return;

    switch (outcome) {
      case RewardedAdShowOutcome.earned:
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
          _adStatus = context.t.daily_limit.ad_failed;
        });
        _trackAd(outcome);
      case RewardedAdShowOutcome.unavailable:
        setState(() {
          _adBusy = false;
          _adStatus = context.t.daily_limit.ad_unavailable;
        });
        _trackAd(outcome);
    }
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
