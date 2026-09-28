import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/answer_reveal_bottom_sheet.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/entity/topic_entity.dart';
import 'package:quiz/features/question/presentation/question_answer_state.dart';
import 'package:quiz/features/question_report/domain/entity/question_report_status.dart';
import 'package:quiz/gen/strings.g.dart';

void main() {
  setUpAll(() async => LocaleSettings.setLocale(AppLocale.ru));

  testWidgets('keeps reveal open after a report until next is tapped',
      (tester) async {
    var reportCalls = 0;
    var advanceCalls = 0;
    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(
          theme: AppTheme.light,
          home: Scaffold(
            body: SingleChildScrollView(
              child: AnswerRevealBottomSheet(
                question: _question,
                sentState: _sentState,
                onReport: () async {
                  reportCalls += 1;
                  return true;
                },
                onNext: () async {
                  advanceCalls += 1;
                  return const AnswerRevealFailure(
                    title: 'Failed',
                    message: 'Try again',
                    kind: AnswerRevealFailureKind.error,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text(t.question.report.entry_title));
    await tester.pumpAndSettle();

    expect(reportCalls, 1);
    expect(advanceCalls, 0);
    expect(find.text(t.question.report.entry_title), findsNothing);
    expect(find.text(t.question.report.status_title), findsOneWidget);
    expect(find.text(t.question.report.status_message), findsOneWidget);

    await tester.tap(find.text(t.question.answer_reveal.next_question));
    await tester.pumpAndSettle();

    expect(advanceCalls, 1);
  });

  testWidgets('shows persisted report status without another action',
      (tester) async {
    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(
          theme: AppTheme.light,
          home: Scaffold(
            body: SingleChildScrollView(
              child: AnswerRevealBottomSheet(
                question: _question,
                sentState: _sentState,
                reportStatus: QuestionReportStatus.processed,
                onReport: () async => true,
                onNext: () async => null,
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text(t.question.report.entry_title), findsNothing);
    expect(find.text(t.question.report.processed_title), findsOneWidget);
    expect(find.text(t.question.report.processed_message), findsOneWidget);
  });
}

const _answer = AnswerEntity(id: 'answer-1', text: 'Answer');
const _question = QuestionEntity(
  id: 'question-1',
  question: 'Question?',
  topic: TopicEntity(id: 'topic-1', name: 'Topic', description: ''),
  hint: '',
  answers: [_answer],
);
const _sentState = QuestionAnswerSentState(
  answer: _answer,
  correctAnswerId: 'answer-1',
  description: 'Explanation',
);
