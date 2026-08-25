import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/domain/repository/daily_edition_repository.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';

class MockDailyEditionRepository extends Mock
    implements DailyEditionRepository {}

void main() {
  late MockDailyEditionRepository repository;
  late DailyEditionNotifier notifier;

  final activeRun = DailyRunEntity(
    runId: 'run-1',
    editionDate: '2026-08-25',
    status: DailyRunStatus.inProgress,
    closesAt: DateTime.parse('2026-08-26T00:00:00Z'),
    graceEndsAt: DateTime.parse('2026-08-26T00:30:00Z'),
    requiredCount: 10,
    resolvedCount: 3,
    ratingAtOpen: 1000,
  );

  final completedRun = activeRun.copyWith(status: DailyRunStatus.completed);

  const assignment = DailyAssignmentEntity(
    assignmentId: 'assignment-4',
    questionId: 'question-4',
    questionVersionId: 'version-4',
    position: 4,
    kind: DailyAssignmentKind.main,
    topic: 'Science',
    text: 'Question?',
    answers: [DailyAssignmentAnswerEntity(id: 'answer-1', text: 'Answer')],
    hintUsed: false,
  );

  const nextAssignment = DailyAssignmentEntity(
    assignmentId: 'assignment-5',
    questionId: 'question-5',
    questionVersionId: 'version-5',
    position: 5,
    kind: DailyAssignmentKind.main,
    topic: 'History',
    text: 'Next question?',
    answers: [DailyAssignmentAnswerEntity(id: 'answer-2', text: 'Answer')],
    hintUsed: false,
  );

  const attempt = DailyAttemptEntity(
    clientEventId: 'event-1',
    attemptId: 'attempt-1',
    assignmentId: 'assignment-4',
    questionVersionId: 'version-4',
    action: DailyAttemptAction.answer,
    isCorrect: true,
    answerId: 'answer-1',
    correctAnswerId: 'answer-1',
    description: 'Server explanation',
    hintUsed: false,
    xpAwarded: 10,
    ratingBefore: 1000,
    ratingAfter: 1012,
    ratingDelta: 12,
    provisional: false,
    runCompleted: false,
    partner: null,
  );

  const summary = DailySummaryEntity(
    runId: 'run-1',
    editionDate: '2026-08-25',
    status: DailyRunStatus.completed,
    requiredCount: 10,
    resolvedCount: 10,
    correctCount: 8,
    skippedCount: 1,
    hintCount: 2,
    answerXp: 90,
    completionXp: 25,
    totalXp: 115,
    bonusGranted: 0,
    bonusServed: 0,
  );

  setUpAll(() {
    registerFallbackValue(DailyAttemptAction.answer);
  });

  setUp(() {
    repository = MockDailyEditionRepository();
    notifier = DailyEditionNotifier(repository: repository);
  });

  tearDown(() => notifier.dispose());

  test('bootstrap restores the server run and its pinned assignment', () async {
    when(() => repository.open(timezoneId: 'Asia/Yekaterinburg'))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));

    await notifier.bootstrap(timezoneId: 'Asia/Yekaterinburg');

    final state = notifier.state as DailyEditionActiveState;
    expect(state.run.runId, 'run-1');
    expect(state.assignment.assignmentId, 'assignment-4');
    verify(() => repository.open(timezoneId: 'Asia/Yekaterinburg')).called(1);
    verify(() => repository.fetchCurrent('run-1')).called(1);
  });

  test('bootstrap restores a completed run from the server summary', () async {
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => const Result.ok(summary));

    await notifier.bootstrap();

    expect(notifier.state, isA<DailyEditionSummaryState>());
    verifyNever(() => repository.fetchCurrent(any()));
    verify(() => repository.fetchSummary('run-1')).called(1);
  });

  test('hint text and usage come only from the server response', () async {
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    when(
      () => repository.useHint(
        runId: 'run-1',
        assignmentId: 'assignment-4',
      ),
    ).thenAnswer(
      (_) async => const Result.ok(
        DailyHintEntity(
          assignmentId: 'assignment-4',
          hint: 'Server hint',
        ),
      ),
    );
    await notifier.bootstrap();

    await notifier.useHint();

    final state = notifier.state as DailyEditionActiveState;
    expect(state.assignment.hintUsed, isTrue);
    expect(state.hint?.hint, 'Server hint');
  });

  test('attempt keeps authoritative reveal and rating delta unchanged',
      () async {
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    when(
      () => repository.submitAttempt(
        runId: 'run-1',
        assignmentId: 'assignment-4',
        clientEventId: 'event-1',
        action: DailyAttemptAction.answer,
        answerId: 'answer-1',
      ),
    ).thenAnswer((_) async => const Result.ok(attempt));
    await notifier.bootstrap();

    await notifier.submitAttempt(
      clientEventId: 'event-1',
      action: DailyAttemptAction.answer,
      answerId: 'answer-1',
    );

    final state = notifier.state as DailyEditionActiveState;
    expect(state.attempt?.ratingDelta, 12);
    expect(state.attempt?.description, 'Server explanation');
    expect(state.assignment.assignmentId, 'assignment-4');
  });

  test('advance requests the next server assignment after reveal', () async {
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    when(
      () => repository.submitAttempt(
        runId: any(named: 'runId'),
        assignmentId: any(named: 'assignmentId'),
        clientEventId: any(named: 'clientEventId'),
        action: any(named: 'action'),
        answerId: any(named: 'answerId'),
      ),
    ).thenAnswer((_) async => const Result.ok(attempt));
    await notifier.bootstrap();
    await notifier.submitAttempt(
      clientEventId: 'event-1',
      action: DailyAttemptAction.answer,
      answerId: 'answer-1',
    );
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(nextAssignment));

    await notifier.advance();

    final state = notifier.state as DailyEditionActiveState;
    expect(state.assignment.assignmentId, 'assignment-5');
    expect(state.attempt, isNull);
  });

  test('completed attempt advances to the authoritative summary', () async {
    final completedAttempt = attempt.copyWith(runCompleted: true);
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    when(
      () => repository.submitAttempt(
        runId: any(named: 'runId'),
        assignmentId: any(named: 'assignmentId'),
        clientEventId: any(named: 'clientEventId'),
        action: any(named: 'action'),
        answerId: any(named: 'answerId'),
      ),
    ).thenAnswer((_) async => Result.ok(completedAttempt));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => const Result.ok(summary));
    await notifier.bootstrap();
    await notifier.submitAttempt(
      clientEventId: 'event-1',
      action: DailyAttemptAction.answer,
      answerId: 'answer-1',
    );

    await notifier.advance();

    final state = notifier.state as DailyEditionSummaryState;
    expect(state.summary.totalXp, 115);
    expect(state.latestAttempt?.ratingDelta, 12);
    verify(() => repository.fetchCurrent('run-1')).called(1);
  });

  test('DAILY_RUN_COMPLETE falls back to the server summary', () async {
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(() => repository.fetchCurrent('run-1')).thenAnswer(
      (_) async => const Result.failed(
        NetworkFailure(
          NetworkFailureReason.badResponse(
            'complete',
            statusCode: 409,
            errorCode: 'DAILY_RUN_COMPLETE',
          ),
        ),
      ),
    );
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => const Result.ok(summary));

    await notifier.bootstrap();

    expect(notifier.state, isA<DailyEditionSummaryState>());
    verify(() => repository.fetchSummary('run-1')).called(1);
  });

  test('unknown server status fails closed', () async {
    when(() => repository.open(timezoneId: null)).thenAnswer(
      (_) async =>
          Result.ok(activeRun.copyWith(status: DailyRunStatus.unknown)),
    );

    await notifier.bootstrap();

    expect(notifier.state, isA<DailyEditionFailedState>());
    verifyNever(() => repository.fetchCurrent(any()));
    verifyNever(() => repository.fetchSummary(any()));
  });

  test('bootstrap can recover by restoring the same server run', () async {
    var currentCalls = 0;
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(() => repository.fetchCurrent('run-1')).thenAnswer((_) async {
      currentCalls++;
      if (currentCalls == 1) {
        return const Result.failed(
          NetworkFailure(NetworkFailureReason.server('offline')),
        );
      }
      return const Result.ok(assignment);
    });

    await notifier.bootstrap();
    expect(notifier.state, isA<DailyEditionFailedState>());

    await notifier.bootstrap();

    final state = notifier.state as DailyEditionActiveState;
    expect(state.run.runId, 'run-1');
    expect(state.assignment.assignmentId, 'assignment-4');
    verify(() => repository.open(timezoneId: null)).called(2);
  });

  test('grace close trusts the returned run and server summary', () async {
    final abandonedRun = activeRun.copyWith(status: DailyRunStatus.abandoned);
    final abandonedSummary = summary.copyWith(
      status: DailyRunStatus.abandoned,
      resolvedCount: 3,
    );
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    when(() => repository.close('run-1'))
        .thenAnswer((_) async => Result.ok(abandonedRun));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => Result.ok(abandonedSummary));
    await notifier.bootstrap();

    await notifier.closeDuringGrace();

    final state = notifier.state as DailyEditionSummaryState;
    expect(state.run.status, DailyRunStatus.abandoned);
    expect(state.summary.resolvedCount, 3);
    verify(() => repository.close('run-1')).called(1);
  });
}
