import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
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

    return PopScope(
      canPop: false,
      child: switch (state) {
        DailyEditionSummaryState(:final summary) => ServerDailyResultPage(
            summary: summary,
            onContinue: () => context.goNamed('home'),
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
