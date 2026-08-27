import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/presentation/daily_quiz_page.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';

class DailyQuizFlow extends ConsumerStatefulWidget {
  const DailyQuizFlow({super.key, this.reviewSourceAttemptId});

  final String? reviewSourceAttemptId;

  @override
  ConsumerState<DailyQuizFlow> createState() => _DailyQuizFlowState();
}

class _DailyQuizFlowState extends ConsumerState<DailyQuizFlow> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final timezoneId = ref.read(authenticationProvider).mapOrNull(
            authenticated: (state) => state.user?.timezoneId,
          );
      final notifier = ref.read(dailyEditionProvider.notifier);
      final sourceAttemptId = widget.reviewSourceAttemptId;
      if (sourceAttemptId == null) {
        notifier.bootstrap(timezoneId: timezoneId);
      } else {
        notifier.bootstrapReviewReplacement(
          sourceAttemptId: sourceAttemptId,
          timezoneId: timezoneId,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) => const DailyQuizPage();
}
