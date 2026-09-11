import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/core/utils/open_daily_limit.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/daily_result/presentation/server_daily_result_page.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_state_views.dart';

class ServerDailyResultFlow extends ConsumerStatefulWidget {
  const ServerDailyResultFlow({super.key});

  @override
  ConsumerState<ServerDailyResultFlow> createState() =>
      _ServerDailyResultFlowState();
}

class _ServerDailyResultFlowState extends ConsumerState<ServerDailyResultFlow> {
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
    if (state case DailyEditionSummaryState(resumeContinuation: true)) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!context.mounted) return;
        await ref
            .read(dailyEditionProvider.notifier)
            .resumeAcknowledgedSummary();
        if (!context.mounted) return;
        final resumed = ref.read(dailyEditionProvider);
        if (resumed is! DailyEditionActiveState) {
          openDailyLimit(context);
        }
      });
    }

    return PopScope(
      canPop: false,
      child: switch (state) {
        DailyEditionSummaryState(:final summary)
            when summary.summaryAcknowledged =>
          const Scaffold(body: SafeArea(child: QuizLoading())),
        DailyEditionSummaryState(:final summary) => ServerDailyResultPage(
            summary: summary,
            onContinue: () => _continueFrom(summary.continuation),
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

  Future<void> _continueFrom(DailyContinuationEntity continuation) async {
    final acknowledged =
        await ref.read(dailyEditionProvider.notifier).acknowledgeSummary();
    if (!acknowledged || !mounted) return;
    final current = ref.read(dailyEditionProvider);
    final nextAction = current is DailyEditionSummaryState
        ? current.summary.continuation.nextAction
        : continuation.nextAction;

    switch (nextAction) {
      case DailyContinuationAction.playQuestion:
        ref.read(dailyEditionProvider.notifier).continueEdition();
      case DailyContinuationAction.watchRewarded:
      case DailyContinuationAction.waitForRewarded:
      case DailyContinuationAction.limitReached:
        openDailyLimit(context);
      case DailyContinuationAction.completeMain:
      case DailyContinuationAction.closed:
      case DailyContinuationAction.unknown:
        context.goNamed('home');
    }
  }
}
