import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_body.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/entity/topic_entity.dart';
import 'package:quiz/features/question/presentation/question_answer_state.dart';
import 'package:quiz/gen/strings.g.dart';

void main() {
  testWidgets('marks a question requested for topic practice', (tester) async {
    await tester.pumpWidget(_app(isTopicPractice: true));

    expect(
      find.text(t.question.meta.practice_marker),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('topic-practice-badge')),
      findsOneWidget,
    );
  });

  testWidgets('does not mark a regular daily question', (tester) async {
    await tester.pumpWidget(_app(isTopicPractice: false));

    expect(
      find.text(t.question.meta.practice_marker),
      findsNothing,
    );
    expect(
      find.byKey(const ValueKey('topic-practice-badge')),
      findsNothing,
    );
  });

  testWidgets('pads both values in the regular question counter',
      (tester) async {
    await tester.pumpWidget(
      _app(
        isTopicPractice: false,
        questionNumber: 1,
        totalQuestions: 3,
      ),
    );

    expect(
      find.text(
        t.question.meta.counter(current: '01', total: '03'),
      ),
      findsOneWidget,
    );
  });
}

Widget _app({
  required bool isTopicPractice,
  int questionNumber = 11,
  int totalQuestions = 10,
}) =>
    TranslationProvider(
      child: MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: QuizBody(
            question: const QuestionEntity(
              id: 'question-1',
              question: 'Question?',
              topic: TopicEntity(
                id: 'topic-1',
                name: 'History',
                description: '',
              ),
              hint: '',
              answers: [
                AnswerEntity(id: 'answer-1', text: 'Answer'),
              ],
            ),
            answerState: const QuestionAnswerState.wait(),
            questionNumber: questionNumber,
            totalQuestions: totalQuestions,
            onSelect: null,
            isTopicPractice: isTopicPractice,
          ),
        ),
      ),
    );
