import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';
import 'package:quiz/features/home/presentation/home_page_actions.dart';
import 'package:quiz/features/home/presentation/provider/daily_question_progress_provider.dart';
import 'package:quiz/features/home/presentation/provider/start_day_config_provider.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/answer_reveal_bottom_sheet.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_body.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_motion.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_state_views.dart';
import 'package:quiz/features/home/presentation/widgets/start_day_header.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = HomePageActionsScope.of(context);
    final gamification = ref.watch(gamificationProvider);
    final streak = gamification.whenOrNull(data: (d) => d.streakDays) ?? 0;
    final level = gamification.whenOrNull(data: (d) => d.level);
    final config = ref.watch(startDayConfigProvider);
    final dailyProgress = ref.watch(dailyQuestionProgressProvider);
    final totalQuestions = config.questionCount;
    final answeredQuestionCount = dailyProgress.whenOrNull(
          data: (progress) => progress.answeredQuestionCount,
        ) ??
        0;
    final nextQuestionNumber = answeredQuestionCount + 1;
    final questionNumber = nextQuestionNumber > totalQuestions ? totalQuestions : nextQuestionNumber;
    final isLastOfIssue = nextQuestionNumber == totalQuestions;
    final questionState = ref.watch(questionProvider);
    final palette = context.palette;

    _listenAnswerSent(
      context,
      ref,
      onNext: isLastOfIssue ? actions.onIssueComplete : actions.onNext,
    );

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: palette.background.static,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StartDayHeader(
                streak: streak,
                level: level,
                subtitle: context.t.onboarding.daily_issue,
              ),
              AppDivider(indent: 22, endIndent: 22),
              Expanded(
                child: questionState.when(
                  loading: () => const QuizLoading(),
                  empty: () => const QuizEmpty(),
                  failed: (failure) => QuizError(failure: failure),
                  data: (question, answerState) => QuizBody(
                    question: question,
                    answerState: answerState,
                    questionNumber: questionNumber,
                    totalQuestions: totalQuestions,
                    onSelect: answerState is QuestionAnswerWaitingState || answerState is QuestionAnswerSelectedState
                        ? actions.onSelect
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listenAnswerSent(
    BuildContext context,
    WidgetRef ref, {
    required VoidCallback onNext,
  }) {
    ref.listen(
      questionProvider.select((s) => s.maybeWhen(
            data: (question, ans) => ans is QuestionAnswerSentState ? (question, ans) : null,
            orElse: () => null,
          )),
      (_, sent) {
        if (sent == null) return;
        final (question, sentState) = sent;
        _showAnswerRevealSheet(
          context,
          question: question,
          sentState: sentState,
          onNext: onNext,
        );
      },
    );
  }

  Future<void> _showAnswerRevealSheet(
    BuildContext context, {
    required QuestionEntity question,
    required QuestionAnswerSentState sentState,
    required VoidCallback onNext,
  }) async {
    final palette = context.palette;

    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      barrierColor: palette.bottomSheet.scrim,
      backgroundColor: palette.bottomSheet.background,
      shape: const RoundedRectangleBorder(),
      sheetAnimationStyle: const AnimationStyle(
        duration: answerRevealTransitionDuration,
        reverseDuration: answerRevealTransitionDuration,
      ),
      builder: (sheetContext) => SafeArea(
        top: false,
        child: AnswerRevealBottomSheet(
          question: question,
          sentState: sentState,
          onNext: () {
            Navigator.of(sheetContext).pop();
            onNext();
          },
        ),
      ),
    );
  }
}
