import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class QuizAnswersList extends StatelessWidget {
  const QuizAnswersList({
    super.key,
    required this.answers,
    required this.answerState,
    required this.onSelect,
  });

  final List<AnswerEntity> answers;
  final QuestionAnswerState answerState;
  final void Function(AnswerEntity)? onSelect;

  @override
  Widget build(BuildContext context) {
    final sentState = answerState is QuestionAnswerSentState ? answerState as QuestionAnswerSentState : null;
    final selectedState =
        answerState is QuestionAnswerSelectedState ? answerState as QuestionAnswerSelectedState : null;
    final answerLetters = context.t.question.answer_letters;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(answers.length, (index) {
        final answer = answers[index];
        final letter = answerLetters[index];
        final isSelected = answerState.answer?.id == answer.id;
        final isCorrect = sentState != null && answer.id == sentState.correctAnswerId;
        final isWrongSelected = sentState != null && isSelected && !sentState.isCorrect;
        final isDimmed = sentState != null && !isCorrect && !isWrongSelected;

        return _QuizAnswerItem(
          answer: answer,
          letter: letter,
          isFirst: index == 0,
          isLast: index == answers.length - 1,
          isCorrect: isCorrect,
          isWrongSelected: isWrongSelected,
          isDimmed: isDimmed,
          isSelected: isSelected && sentState == null,
          timerState: selectedState?.answer.id == answer.id ? selectedState?.timerState : null,
          showResultStripe: sentState != null && isSelected,
          onTap: onSelect != null
              ? () {
                  HapticFeedback.lightImpact();
                  onSelect!(answer);
                }
              : null,
        );
      }),
    );
  }
}

class _QuizAnswerItem extends StatelessWidget {
  const _QuizAnswerItem({
    required this.answer,
    required this.letter,
    required this.isFirst,
    required this.isLast,
    required this.isCorrect,
    required this.isWrongSelected,
    required this.isDimmed,
    required this.isSelected,
    required this.timerState,
    required this.showResultStripe,
    required this.onTap,
  });

  final AnswerEntity answer;
  final String letter;
  final bool isFirst;
  final bool isLast;
  final bool isCorrect;
  final bool isWrongSelected;
  final bool isDimmed;
  final bool isSelected;
  final AnswerTimerState? timerState;
  final bool showResultStripe;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    final topBorderColor = isFirst ? palette.text.primary : palette.divider;
    final topBorderWidth = isFirst ? 1.5 : 1.0;
    final bottomBorderWidth = isLast ? 1.0 : 0.0;

    Color badgeBg;
    Color badgeBorder;
    Color badgeText;

    if (isCorrect) {
      badgeBg = palette.answer.success;
      badgeBorder = palette.answer.success;
      badgeText = palette.background.static;
    } else if (isWrongSelected) {
      badgeBg = Colors.transparent;
      badgeBorder = palette.answer.failure;
      badgeText = palette.answer.failure;
    } else if (isSelected) {
      badgeBg = Colors.transparent;
      badgeBorder = palette.text.accent;
      badgeText = palette.text.accent;
    } else {
      badgeBg = Colors.transparent;
      badgeBorder = palette.text.primary;
      badgeText = palette.text.primary;
    }

    final stripeValue = timerState != null
        ? (1 - timerState!.progress).clamp(0.0, 1.0).toDouble()
        : showResultStripe
            ? 1.0
            : null;
    final stripeColor = timerState != null
        ? palette.text.accent
        : isCorrect
            ? palette.answer.success
            : palette.answer.failure;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedOpacity(
        opacity: isDimmed ? 0.5 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: topBorderColor, width: topBorderWidth),
                  bottom: isLast
                      ? BorderSide(
                          color: palette.divider,
                          width: bottomBorderWidth,
                        )
                      : BorderSide.none,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: badgeBg,
                      border: Border.all(color: badgeBorder, width: 1.5),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      letter,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isCorrect ? badgeText : (isDimmed ? palette.text.secondary : badgeText),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      answer.text,
                      style: GoogleFonts.spectral(
                        fontSize: 18,
                        color: isDimmed ? palette.text.secondary : palette.text.primary,
                      ),
                    ),
                  ),
                  if (isCorrect) ...[
                    const SizedBox(width: 8),
                    Text(
                      context.t.question.answer_reveal.correct,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 10,
                        letterSpacing: 1,
                        color: palette.answer.success,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (stripeValue case double stripeValue)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: stripeValue,
                    child: SizedBox(
                      height: 2,
                      child: ColoredBox(color: stripeColor),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
