import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_question_provider.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/answer_reveal_bottom_sheet.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_body.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_motion.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_state_views.dart';
import 'package:quiz/features/home/presentation/widgets/start_day_header.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class DailyQuizPage extends ConsumerWidget {
  const DailyQuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editionState = ref.watch(dailyEditionProvider);
    final answerState = ref.watch(dailyQuestionProvider);
    final gamification = ref.watch(gamificationProvider);
    final palette = context.palette;

    ref.listen(dailyEditionProvider, (_, next) {
      if (next is DailyEditionSummaryState) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) context.goNamed('daily-result');
        });
      }
    });
    _listenForReveal(context, ref);
    _listenForAttemptFailure(context, ref);

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: palette.background.static,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StartDayHeader(
                streak: gamification.whenOrNull(
                      data: (data) => data.streakDays,
                    ) ??
                    0,
                level: gamification.whenOrNull(data: (data) => data.level),
                subtitle: context.t.onboarding.daily_issue,
              ),
              AppDivider(indent: 22, endIndent: 22),
              Expanded(
                child: _buildBody(
                  ref,
                  editionState: editionState,
                  answerState: answerState,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(
    WidgetRef ref, {
    required DailyEditionState editionState,
    required QuestionAnswerState answerState,
  }) {
    return switch (editionState) {
      DailyEditionInitialState() ||
      DailyEditionLoadingState() =>
        const QuizLoading(),
      DailyEditionFailedState(:final failure) => QuizError(failure: failure),
      DailyEditionSummaryState() => const QuizLoading(),
      DailyEditionActiveState(:final run, :final assignment) => switch (
            assignment.toQuestionEntity()) {
          final QuestionEntity question => QuizBody(
              question: question,
              answerState: answerState,
              questionNumber: assignment.position,
              totalQuestions: run.requiredCount,
              onSelect: answerState is QuestionAnswerWaitingState ||
                      answerState is QuestionAnswerSelectedState
                  ? ref.read(dailyQuestionProvider.notifier).select
                  : null,
            ),
          null => QuizError(
              failure: Failure.unknown(
                StateError('Daily assignment content is unavailable'),
              ),
            ),
        },
    };
  }

  void _listenForReveal(BuildContext context, WidgetRef ref) {
    ref.listen(
      dailyQuestionProvider.select(
        (state) => state is QuestionAnswerSentState ? state : null,
      ),
      (_, sentState) {
        final editionState = ref.read(dailyEditionProvider);
        if (sentState == null || editionState is! DailyEditionActiveState) {
          return;
        }
        final question = editionState.assignment.toQuestionEntity();
        if (question == null) return;
        _showAnswerRevealSheet(
          context,
          question: question,
          sentState: sentState,
          onNext: ref.read(dailyEditionProvider.notifier).advance,
        );
      },
    );
  }

  void _listenForAttemptFailure(BuildContext context, WidgetRef ref) {
    ref.listen(
      dailyQuestionProvider.select(
        (state) => state is QuestionAnswerFailedState ? state : null,
      ),
      (_, failedState) {
        if (failedState == null) return;
        final t = context.t.question.error_snackbar.save_failed_retry_later;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.text),
            action: SnackBarAction(
              label: t.button,
              onPressed:
                  ref.read(dailyEditionProvider.notifier).retryPendingAttempt,
              textColor: context.palette.text.primary,
            ),
            backgroundColor: context.palette.background.danger,
          ),
        );
      },
    );
  }

  Future<void> _showAnswerRevealSheet(
    BuildContext context, {
    required QuestionEntity question,
    required QuestionAnswerSentState sentState,
    required Future<void> Function() onNext,
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
