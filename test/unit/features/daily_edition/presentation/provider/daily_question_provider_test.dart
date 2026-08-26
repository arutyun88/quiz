import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_question_provider.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';

void main() {
  group('DailyAssignmentPresentationX', () {
    test('maps server assignment to the existing question presentation model',
        () {
      final question = _assignment().toQuestionEntity();

      expect(question?.id, 'assignment-1');
      expect(question?.question, 'Question?');
      expect(question?.topic.name, 'History');
      expect(question?.answers.map((answer) => answer.text), ['One', 'Two']);
      expect(question?.hint, isEmpty);
    });

    test('fails closed when server content is redacted', () {
      expect(_assignment(text: null).toQuestionEntity(), isNull);
      expect(
        _assignment(
          answers: const [
            DailyAssignmentAnswerEntity(id: 'answer-1', text: null),
          ],
        ).toQuestionEntity(),
        isNull,
      );
    });
  });

  group('DailyQuestionNotifier', () {
    test('submits the server answer id after confirmation', () async {
      final submitted = <String>[];
      final notifier = DailyQuestionNotifier(
        submitAnswer: (answerId) async => submitted.add(answerId),
        confirmationDuration: const Duration(milliseconds: 1),
      );
      addTearDown(notifier.dispose);
      notifier.synchronize(_active());

      notifier.select(const AnswerEntity(id: 'answer-1', text: 'One'));
      await Future<void>.delayed(const Duration(milliseconds: 40));

      expect(submitted, ['answer-1']);
      expect(notifier.state, isA<QuestionAnswerSendingState>());
    });

    test('does not submit after assignment changes', () async {
      final submitted = <String>[];
      final notifier = DailyQuestionNotifier(
        submitAnswer: (answerId) async => submitted.add(answerId),
        confirmationDuration: const Duration(milliseconds: 20),
      );
      addTearDown(notifier.dispose);
      notifier.synchronize(_active());
      notifier.select(const AnswerEntity(id: 'answer-1', text: 'One'));

      notifier
          .synchronize(_active(assignment: _assignment(id: 'assignment-2')));
      await Future<void>.delayed(const Duration(milliseconds: 50));

      expect(submitted, isEmpty);
      expect(notifier.state, isA<QuestionAnswerWaitingState>());
    });

    test('uses only authoritative attempt reveal and xp', () {
      final notifier = DailyQuestionNotifier(submitAnswer: (_) async {});
      addTearDown(notifier.dispose);
      notifier.synchronize(_active());
      notifier.select(const AnswerEntity(id: 'answer-2', text: 'Two'));

      notifier.synchronize(
        _active(
          attempt: _attempt(
            answerId: 'answer-2',
            correctAnswerId: 'answer-1',
            xpAwarded: 7,
          ),
        ),
      );

      final state = notifier.state as QuestionAnswerSentState;
      expect(state.answer.id, 'answer-2');
      expect(state.correctAnswerId, 'answer-1');
      expect(state.xp, 7);
      expect(state.streakDelta, 0);
      expect(state.isCorrect, isFalse);
    });

    test('does not reconstruct a redacted attempted answer', () {
      final notifier = DailyQuestionNotifier(submitAnswer: (_) async {});
      addTearDown(notifier.dispose);
      notifier.synchronize(
        _active(
          assignment: _assignment(
            answers: const [
              DailyAssignmentAnswerEntity(id: 'answer-1', text: null),
            ],
          ),
          attempt: _attempt(answerId: 'answer-1'),
        ),
      );

      expect(notifier.state, isA<QuestionAnswerWaitingState>());
    });
  });
}

DailyEditionActiveState _active({
  DailyAssignmentEntity? assignment,
  DailyAttemptEntity? attempt,
}) =>
    DailyEditionActiveState(
      run: _run(),
      assignment: assignment ?? _assignment(),
      attempt: attempt,
    );

DailyRunEntity _run() => DailyRunEntity(
      runId: 'run-1',
      editionDate: '2026-08-26',
      status: DailyRunStatus.inProgress,
      closesAt: DateTime.utc(2026, 8, 27, 4),
      graceEndsAt: DateTime.utc(2026, 8, 27, 4, 10),
      requiredCount: 6,
      resolvedCount: 0,
      ratingAtOpen: 1000,
      continuation: _continuation(),
    );

DailyContinuationEntity _continuation() => DailyContinuationEntity(
      runId: 'run-1',
      serverTime: DateTime.utc(2026, 8, 26, 12),
      closesAt: DateTime.utc(2026, 8, 27, 4),
      nextAction: DailyContinuationAction.completeMain,
      quizPlus: false,
      bonusQuestionsGranted: 0,
      bonusQuestionsServed: 0,
      bonusQuestionsRemaining: 0,
      questionsPerReward: 5,
      rewardedVideosUsed: 0,
      rewardedVideosMax: 6,
      rewardedVideosRemaining: 6,
      rollingVideosUsed: 0,
      rollingVideosMax: 2,
      rewardedAdAvailable: false,
      rewardedAdNextAvailableAt: null,
    );

DailyAssignmentEntity _assignment({
  String id = 'assignment-1',
  String? text = 'Question?',
  List<DailyAssignmentAnswerEntity> answers = const [
    DailyAssignmentAnswerEntity(id: 'answer-1', text: 'One'),
    DailyAssignmentAnswerEntity(id: 'answer-2', text: 'Two'),
  ],
}) =>
    DailyAssignmentEntity(
      assignmentId: id,
      questionId: 'question-1',
      questionVersionId: 'version-1',
      position: 1,
      kind: DailyAssignmentKind.main,
      topic: 'History',
      text: text,
      answers: answers,
      hintUsed: false,
    );

DailyAttemptEntity _attempt({
  String? answerId = 'answer-1',
  String? correctAnswerId = 'answer-1',
  int xpAwarded = 5,
}) =>
    DailyAttemptEntity(
      clientEventId: 'event-1',
      attemptId: 'attempt-1',
      assignmentId: 'assignment-1',
      questionVersionId: 'version-1',
      action: DailyAttemptAction.answer,
      isCorrect: answerId == correctAnswerId,
      answerId: answerId,
      correctAnswerId: correctAnswerId,
      description: 'Explanation',
      hintUsed: false,
      xpAwarded: xpAwarded,
      ratingBefore: 1000,
      ratingAfter: 1001,
      ratingDelta: 1,
      provisional: false,
      runCompleted: false,
      partner: null,
    );
