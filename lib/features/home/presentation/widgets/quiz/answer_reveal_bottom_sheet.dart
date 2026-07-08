import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class AnswerRevealBottomSheet extends StatelessWidget {
  const AnswerRevealBottomSheet({
    super.key,
    required this.question,
    required this.sentState,
    required this.onNext,
  });

  final QuestionEntity question;
  final QuestionAnswerSentState sentState;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final sheetColors = palette.bottomSheet;
    final correctAnswer = _correctAnswerText();

    return ColoredBox(
      color: sheetColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _AnswerRevealHeader(
            isCorrect: sentState.isCorrect,
            xp: sentState.xp,
            streakDelta: sentState.streakDelta,
          ),
          _AnswerExplanationPanel(
            correctAnswer: correctAnswer,
            description: sentState.description,
            onNext: onNext,
          ),
        ],
      ),
    );
  }

  String _correctAnswerText() {
    for (final answer in question.answers) {
      if (answer.id == sentState.correctAnswerId) {
        return answer.text;
      }
    }
    return sentState.answer.text;
  }
}

class _AnswerRevealHeader extends StatelessWidget {
  const _AnswerRevealHeader({
    required this.isCorrect,
    required this.xp,
    required this.streakDelta,
  });

  final bool isCorrect;
  final int xp;
  final int streakDelta;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final sheetColors = palette.bottomSheet;
    final t = context.t.question.answer_reveal;
    final rewardParts = [
      if (xp > 0) t.xp_bonus(xp: xp),
      if (streakDelta > 0) t.streak_bonus(n: streakDelta),
    ];
    final rewardText = rewardParts.isEmpty ? null : rewardParts.join(' · ');

    return Container(
      color: sheetColors.headerBackground,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isCorrect ? t.correct : t.incorrect,
            style: GoogleFonts.unbounded(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: sheetColors.headerForeground,
              letterSpacing: 0.5,
            ),
          ),
          if (rewardText != null) ...[
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                rewardText,
                textAlign: TextAlign.end,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12,
                  letterSpacing: 1,
                  color: palette.answer.successMint,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _AnswerExplanationPanel extends StatelessWidget {
  const _AnswerExplanationPanel({
    required this.correctAnswer,
    required this.description,
    required this.onNext,
  });

  final String correctAnswer;
  final String? description;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final sheetColors = palette.bottomSheet;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            correctAnswer.toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 10,
              letterSpacing: 2,
              color: palette.text.accent,
            ),
          ),
          if (description case String description?) ...[
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.spectral(
                fontSize: 16,
                height: 1.5,
                color: sheetColors.foreground,
              ),
            ),
          ],
          const SizedBox(height: 18),
          AppButtonV2(
            label: context.t.question.answer_reveal.next_question,
            backgroundColor: sheetColors.buttonBackground,
            foregroundColor: sheetColors.buttonForeground,
            onTap: (complete) {
              complete();
              onNext();
              return null;
            },
          ),
        ],
      ),
    );
  }
}
