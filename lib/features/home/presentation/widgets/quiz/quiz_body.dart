import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_answers_list.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_motion.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({
    super.key,
    required this.question,
    required this.answerState,
    required this.questionNumber,
    required this.totalQuestions,
    required this.onSelect,
  });

  final QuestionEntity question;
  final QuestionAnswerState answerState;
  final int questionNumber;
  final int totalQuestions;
  final void Function(AnswerEntity)? onSelect;

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
          Expanded(
            child: AnimatedAlign(
              duration: answerRevealTransitionDuration,
              curve: answerRevealTransitionCurve,
              alignment: isAnswerReveal ? Alignment.topCenter : Alignment.bottomCenter,
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
  });

  final int questionNumber;
  final int totalQuestions;
  final String topicName;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final t = context.t.question.meta;
    final formattedQuestionNumber = questionNumber.toString().padLeft(2, '0');

    return Row(
      children: [
        Text(
          t.counter(
            current: formattedQuestionNumber,
            total: totalQuestions,
          ),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 11,
            letterSpacing: 1.5,
            color: palette.text.primary,
          ),
        ),
        const Spacer(),
        Text(
          t.topic(topic: topicName.toUpperCase()),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 11,
            letterSpacing: 1.5,
            color: palette.text.accent,
          ),
        ),
      ],
    );
  }
}
