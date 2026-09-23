import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_answers_list.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_motion.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/presentation/question_answer_state.dart';
import 'package:quiz/gen/strings.g.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({
    super.key,
    required this.question,
    required this.answerState,
    required this.questionNumber,
    required this.totalQuestions,
    required this.onSelect,
    this.isTopicPractice = false,
    this.questionSupplement,
  });

  final QuestionEntity question;
  final QuestionAnswerState answerState;
  final int questionNumber;
  final int totalQuestions;
  final void Function(AnswerEntity)? onSelect;
  final bool isTopicPractice;
  final Widget? questionSupplement;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isAnswerReveal = answerState is QuestionAnswerSentState;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          _QuestionMetaRow(
            questionNumber: questionNumber,
            totalQuestions: totalQuestions,
            topicName: question.topic.name,
            isTopicPractice: isTopicPractice,
          ),
          const SizedBox(height: 16),
          Text(
            question.question,
            style: GoogleFonts.spectral(
              fontSize: 27,
              height: 1.28,
              color: palette.text.primary,
            ),
          ),
          if (questionSupplement case final supplement?) ...[
            const SizedBox(height: 12),
            supplement,
          ],
          Expanded(
            child: AnimatedAlign(
              duration: answerRevealTransitionDuration,
              curve: answerRevealTransitionCurve,
              alignment:
                  isAnswerReveal ? Alignment.topCenter : Alignment.bottomCenter,
              child: AnimatedPadding(
                duration: answerRevealTransitionDuration,
                curve: answerRevealTransitionCurve,
                padding: EdgeInsets.only(
                  top: isAnswerReveal ? 22 : 0,
                  bottom: isAnswerReveal ? 0 : 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: QuizAnswersList(
                    key: ValueKey(question.id),
                    answers: question.answers,
                    answerState: answerState,
                    onSelect: onSelect,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestionMetaRow extends StatelessWidget {
  const _QuestionMetaRow({
    required this.questionNumber,
    required this.totalQuestions,
    required this.topicName,
    required this.isTopicPractice,
  });

  final int questionNumber;
  final int totalQuestions;
  final String topicName;
  final bool isTopicPractice;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final t = context.t.question.meta;
    final isExtra = questionNumber > totalQuestions;
    final counterLabel = isExtra
        ? t.extra_counter(n: questionNumber - totalQuestions)
        : t.counter(
            current: questionNumber.toString().padLeft(2, '0'),
            total: totalQuestions,
          );

    return Row(
      children: [
        Text(
          counterLabel,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 11,
            letterSpacing: 1.5,
            color: palette.text.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    t.topic(topic: topicName.toUpperCase()),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 11,
                      letterSpacing: 1.5,
                      color: palette.text.accent,
                    ),
                  ),
                  if (isTopicPractice) ...[
                    const SizedBox(width: 8),
                    Container(
                      key: const ValueKey('topic-practice-badge'),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      color: palette.text.accent,
                      child: Text(
                        t.practice_marker,
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                          height: 1,
                          letterSpacing: 1,
                          color: palette.background.static,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
