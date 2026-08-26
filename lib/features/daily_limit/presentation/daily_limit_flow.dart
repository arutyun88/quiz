import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/daily_limit/presentation/daily_limit_page.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_state_views.dart';

class DailyLimitFlow extends ConsumerStatefulWidget {
  const DailyLimitFlow({super.key});

  @override
  ConsumerState<DailyLimitFlow> createState() => _DailyLimitFlowState();
}

class _DailyLimitFlowState extends ConsumerState<DailyLimitFlow> {
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
            isBusy: isBusy,
            onKeepPlaying: () =>
                ref.read(dailyEditionProvider.notifier).continueEdition(),
            onRefresh: () =>
                ref.read(dailyEditionProvider.notifier).refreshContinuation(),
            onClose: () => context.goNamed('home'),
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
}
