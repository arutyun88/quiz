import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/connectivity_service.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/domain/entity/pending_daily_attempt_entity.dart';
import 'package:quiz/features/daily_edition/domain/repository/daily_edition_repository.dart';
import 'package:quiz/features/daily_edition/domain/service/daily_attempt_outbox.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';

class MockDailyEditionRepository extends Mock
    implements DailyEditionRepository {}

class MockDailyAttemptOutbox extends Mock implements DailyAttemptOutbox {}

class FakeConnectivityService implements ConnectivityService {
  FakeConnectivityService({required bool connected}) : _connected = connected;

  final _controller = StreamController<InternetStatus>.broadcast();
  bool _connected;

  @override
  Future<bool> hasInternetConnection() async => _connected;

  @override
  Stream<InternetStatus> get onStatusChange => _controller.stream;

  void emit(InternetStatus status) {
    _connected = status == InternetStatus.connected;
    _controller.add(status);
  }

  Future<void> dispose() => _controller.close();
}

void main() {
  late MockDailyEditionRepository repository;
  late MockDailyAttemptOutbox outbox;
  late DailyEditionNotifier notifier;

  final continuation = DailyContinuationEntity(
    runId: 'run-1',
    serverTime: DateTime.parse('2026-08-25T12:00:00Z'),
    closesAt: DateTime.parse('2026-08-26T00:00:00Z'),
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

  final summary = DailySummaryEntity(
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
    continuation: continuation.copyWith(
      nextAction: DailyContinuationAction.watchRewarded,
      rewardedAdAvailable: true,
    ),
  );

  setUpAll(() {
    registerFallbackValue(DailyAttemptAction.answer);
    registerFallbackValue(
      PendingDailyAttemptEntity(
        accountId: 'account-1',
        runId: 'run-1',
        assignmentId: 'assignment-4',
        clientEventId: 'fallback-event',
        action: DailyAttemptAction.answer,
        answerId: 'answer-1',
        createdAt: DateTime.parse('2026-08-26T00:00:00Z'),
      ),
    );
  });

  setUp(() {
    repository = MockDailyEditionRepository();
    outbox = MockDailyAttemptOutbox();
    when(() => outbox.load(accountId: 'account-1'))
        .thenAnswer((_) async => null);
    when(() => outbox.save(any())).thenAnswer((_) async {});
    when(
      () => outbox.clear(
        accountId: any(named: 'accountId'),
        clientEventId: any(named: 'clientEventId'),
      ),
    ).thenAnswer((_) async {});
    notifier = DailyEditionNotifier(
      accountId: 'account-1',
      repository: repository,
      outbox: outbox,
      clientEventIdFactory: () => 'event-1',
      now: () => DateTime.parse('2026-08-26T00:00:00Z'),
      delay: (_) async {},
    );
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

  test('retry keeps the connection error visible until bootstrap succeeds',
      () async {
    final retryResult = Completer<Result<DailyRunEntity, Failure>>();
    var openCalls = 0;
    when(() => repository.open(timezoneId: 'Asia/Yekaterinburg'))
        .thenAnswer((_) {
      openCalls += 1;
      if (openCalls == 1) {
        return Future.value(
          const Result.failed(Failure.serverUnavailable()),
        );
      }
      return retryResult.future;
    });
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));

    await notifier.bootstrap(timezoneId: 'Asia/Yekaterinburg');
    final failedState = notifier.state;

    final retry = notifier.bootstrap(
      timezoneId: 'Asia/Yekaterinburg',
      preserveCurrentState: true,
    );
    await Future<void>.delayed(Duration.zero);

    expect(notifier.state, same(failedState));

    retryResult.complete(Result.ok(activeRun));
    await retry;

    expect(notifier.state, isA<DailyEditionActiveState>());
  });

  test('resume synchronization keeps the authoritative current assignment',
      () async {
    final startedRun = activeRun.copyWith(
      startedAt: DateTime.parse('2026-08-25T12:00:00Z'),
    );
    when(() => repository.open(timezoneId: 'Asia/Yekaterinburg'))
        .thenAnswer((_) async => Result.ok(startedRun));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    await notifier.bootstrap(timezoneId: 'Asia/Yekaterinburg');

    await notifier.synchronizeActiveRun(
      timezoneId: 'Asia/Yekaterinburg',
    );

    final state = notifier.state as DailyEditionActiveState;
    expect(state.run.runId, 'run-1');
    expect(state.assignment.assignmentId, 'assignment-4');
    verify(() => repository.open(timezoneId: 'Asia/Yekaterinburg')).called(2);
    verify(() => repository.fetchCurrent('run-1')).called(2);
  });

  test('resume synchronization replaces a stale run with the new server day',
      () async {
    var openCalls = 0;
    final startedRun = activeRun.copyWith(
      startedAt: DateTime.parse('2026-08-25T12:00:00Z'),
    );
    final nextRun = activeRun.copyWith(
      runId: 'run-2',
      editionDate: '2026-08-26',
      startedAt: null,
      resolvedCount: 0,
    );
    when(() => repository.open(timezoneId: 'Asia/Yekaterinburg')).thenAnswer(
        (_) async => Result.ok(++openCalls == 1 ? startedRun : nextRun));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    when(() => repository.fetchCurrent('run-2'))
        .thenAnswer((_) async => const Result.ok(nextAssignment));
    await notifier.bootstrap(timezoneId: 'Asia/Yekaterinburg');

    await notifier.synchronizeActiveRun(
      timezoneId: 'Asia/Yekaterinburg',
    );

    final state = notifier.state as DailyEditionActiveState;
    expect(state.run.runId, 'run-2');
    expect(state.run.startedAt, isNull);
    expect(state.assignment.assignmentId, 'assignment-5');
  });

  test('startEdition persists start before navigating to the first question',
      () async {
    final startedRun = activeRun.copyWith(
      startedAt: DateTime.parse('2026-08-25T12:00:00Z'),
    );
    when(() => repository.open(timezoneId: 'Asia/Yekaterinburg'))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    when(() => repository.start('run-1'))
        .thenAnswer((_) async => Result.ok(startedRun));

    await notifier.bootstrap(timezoneId: 'Asia/Yekaterinburg');
    final started = await notifier.startEdition();

    expect(started, isTrue);
    expect(
      (notifier.state as DailyEditionActiveState).run.startedAt,
      startedRun.startedAt,
    );
    verify(() => repository.start('run-1')).called(1);
  });

  test('review bootstrap opens a run and reserves through the server',
      () async {
    when(() => repository.open(timezoneId: 'Asia/Yekaterinburg'))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(
      () => repository.reserveReviewReplacement(
        runId: 'run-1',
        clientEventId: 'event-1',
        sourceAttemptId: 'attempt-incorrect-1',
      ),
    ).thenAnswer((_) async => const Result.ok(assignment));

    await notifier.bootstrapReviewReplacement(
      sourceAttemptId: 'attempt-incorrect-1',
      timezoneId: 'Asia/Yekaterinburg',
    );

    final state = notifier.state as DailyEditionActiveState;
    expect(state.assignment, assignment);
    verify(
      () => repository.reserveReviewReplacement(
        runId: 'run-1',
        clientEventId: 'event-1',
        sourceAttemptId: 'attempt-incorrect-1',
      ),
    ).called(1);
    verifyNever(() => repository.fetchCurrent(any()));
  });

  test('review without allowance opens acknowledged continuation', () async {
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.reserveReviewReplacement(
          runId: 'run-1',
          clientEventId: 'event-1',
          sourceAttemptId: 'source-1',
        )).thenAnswer((_) async => const Result.failed(Failure.network(
          NetworkFailureReason.badResponse('Allowance required',
              statusCode: 409, errorCode: 'DAILY_RUN_COMPLETE'),
        )));
    when(() => repository.acknowledgeSummary('run-1')).thenAnswer(
        (_) async => Result.ok(summary.copyWith(summaryAcknowledged: true)));

    await notifier.bootstrapReviewReplacement(sourceAttemptId: 'source-1');

    final state = notifier.state as DailyEditionSummaryState;
    expect(state.summary.summaryAcknowledged, isTrue);
    expect(state.resumeContinuation, isTrue);
    verifyNever(() => repository.fetchCurrent(any()));

    when(() => repository.fetchContinuation('run-1')).thenAnswer(
      (_) async => Result.ok(continuation.copyWith(
        nextAction: DailyContinuationAction.playQuestion,
        bonusQuestionsRemaining: 5,
      )),
    );
    when(() => repository.reserveReviewReplacement(
          runId: 'run-1',
          clientEventId: 'event-1',
          sourceAttemptId: 'source-1',
        )).thenAnswer((_) async => const Result.ok(assignment));

    await notifier.refreshContinuation();
    await notifier.continueEdition();

    expect(notifier.state, isA<DailyEditionActiveState>());
    expect(notifier.hasPendingReview, isFalse);
    verifyNever(() => repository.fetchCurrent(any()));
  });

  test('review resumes selected topic after resolving current bonus question',
      () async {
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.reserveReviewReplacement(
          runId: 'run-1',
          clientEventId: 'event-1',
          sourceAttemptId: 'source-1',
        )).thenAnswer((_) async => const Result.failed(Failure.network(
          NetworkFailureReason.badResponse('Current question exists',
              statusCode: 409, errorCode: 'CURRENT_ASSIGNMENT_EXISTS'),
        )));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => Result.ok(summary));

    await notifier.bootstrapReviewReplacement(sourceAttemptId: 'source-1');
    expect(notifier.hasPendingReview, isTrue);

    // The current question has now been answered and its reveal is visible.
    notifier.state = DailyEditionActiveState(
      run: completedRun,
      assignment: assignment,
      attempt: attempt,
    );
    when(() => repository.reserveReviewReplacement(
          runId: 'run-1',
          clientEventId: 'event-1',
          sourceAttemptId: 'source-1',
        )).thenAnswer((_) async => const Result.ok(nextAssignment));

    await notifier.advance();

    expect(
        (notifier.state as DailyEditionActiveState).assignment, nextAssignment);
    expect(notifier.hasPendingReview, isFalse);
  });

  test('bootstrap fails closed without an authenticated account', () async {
    final unauthenticatedNotifier = DailyEditionNotifier(
      accountId: null,
      repository: repository,
      outbox: outbox,
      clientEventIdFactory: () => 'event-1',
    );
    addTearDown(unauthenticatedNotifier.dispose);

    await unauthenticatedNotifier.bootstrap();

    final state = unauthenticatedNotifier.state as DailyEditionFailedState;
    expect(
      state.failure,
      const AuthenticationFailure(
        AuthenticationFailureType.unauthenticated,
      ),
    );
    verifyNever(() => repository.open(timezoneId: any(named: 'timezoneId')));
  });

  test('bootstrap restores a completed run from the server summary', () async {
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => Result.ok(summary));

    await notifier.bootstrap();

    expect(notifier.state, isA<DailyEditionSummaryState>());
    verifyNever(() => repository.fetchCurrent(any()));
    verify(() => repository.fetchSummary('run-1')).called(1);
  });

  test('acknowledges the summary through the server', () async {
    final acknowledged = summary.copyWith(summaryAcknowledged: true);
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => Result.ok(summary));
    when(() => repository.acknowledgeSummary('run-1'))
        .thenAnswer((_) async => Result.ok(acknowledged));
    await notifier.bootstrap();

    expect(await notifier.acknowledgeSummary(), isTrue);

    final state = notifier.state as DailyEditionSummaryState;
    expect(state.summary.summaryAcknowledged, isTrue);
    verify(() => repository.acknowledgeSummary('run-1')).called(1);
  });

  test('restores an acknowledged summary directly into its next question',
      () async {
    final acknowledged = summary.copyWith(
      summaryAcknowledged: true,
      continuation: summary.continuation.copyWith(
        nextAction: DailyContinuationAction.playQuestion,
      ),
    );
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => Result.ok(acknowledged));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    await notifier.bootstrap();

    expect(
      (notifier.state as DailyEditionSummaryState).resumeContinuation,
      isTrue,
    );
    await notifier.resumeAcknowledgedSummary();

    expect(notifier.state, isA<DailyEditionActiveState>());
    verify(() => repository.fetchCurrent('run-1')).called(1);
  });

  test('refreshContinuation replaces only the server continuation snapshot',
      () async {
    final refreshed = continuation.copyWith(
      nextAction: DailyContinuationAction.waitForRewarded,
      rewardedAdNextAvailableAt: DateTime.parse('2026-08-25T14:00:00Z'),
    );
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => Result.ok(summary));
    when(() => repository.fetchContinuation('run-1'))
        .thenAnswer((_) async => Result.ok(refreshed));
    await notifier.bootstrap();

    await notifier.refreshContinuation();

    final state = notifier.state as DailyEditionSummaryState;
    expect(
      state.summary.continuation.nextAction,
      DailyContinuationAction.waitForRewarded,
    );
    expect(state.summary.totalXp, summary.totalXp);
  });

  test('expired continuation opens the new server day at the exact boundary',
      () async {
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => Result.ok(summary));
    await notifier.bootstrap();

    final newRun = activeRun.copyWith(
      runId: 'run-2',
      editionDate: '2026-08-26',
      resolvedCount: 0,
    );
    when(() => repository.fetchContinuation('run-1')).thenAnswer(
      (_) async => Result.ok(continuation.copyWith(
        serverTime: continuation.closesAt,
        nextAction: DailyContinuationAction.closed,
      )),
    );
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(newRun));
    when(() => repository.fetchCurrent('run-2'))
        .thenAnswer((_) async => const Result.ok(assignment));

    await notifier.refreshContinuation();

    expect(notifier.state, isA<DailyEditionActiveState>());
    expect((notifier.state as DailyEditionActiveState).run.runId, 'run-2');
  });

  test('continueEdition loads an assignment only when the server allows play',
      () async {
    final playableSummary = summary.copyWith(
      continuation: continuation.copyWith(
        nextAction: DailyContinuationAction.playQuestion,
        bonusQuestionsRemaining: 5,
      ),
    );
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => Result.ok(playableSummary));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    await notifier.bootstrap();

    await notifier.continueEdition();

    expect(notifier.state, isA<DailyEditionActiveState>());
    verify(() => repository.fetchCurrent('run-1')).called(1);
  });

  test('continueEdition cannot bypass a server rewarded-ad decision', () async {
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => Result.ok(summary));
    await notifier.bootstrap();

    await notifier.continueEdition();

    expect(notifier.state, isA<DailyEditionSummaryState>());
    verifyNever(() => repository.fetchCurrent(any()));
  });

  test('reward completion waits for the server continuation', () async {
    var continuationRequests = 0;
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => Result.ok(summary));
    when(() => repository.fetchContinuation('run-1')).thenAnswer((_) async {
      continuationRequests++;
      if (continuationRequests == 1) return Result.ok(summary.continuation);
      return Result.ok(
        summary.continuation.copyWith(
          nextAction: DailyContinuationAction.playQuestion,
          rewardedVideosUsed: 1,
          rewardedVideosRemaining: 5,
          rollingVideosUsed: 1,
          bonusQuestionsGranted: 5,
          bonusQuestionsRemaining: 5,
        ),
      );
    });
    await notifier.bootstrap();

    final confirmed = await notifier.waitForRewardedAdConfirmation(
      previousRewardedVideosUsed: 0,
    );

    final state = notifier.state as DailyEditionSummaryState;
    expect(confirmed, isTrue);
    expect(continuationRequests, 2);
    expect(state.summary.continuation.bonusQuestionsRemaining, 5);
    expect(
      state.summary.continuation.nextAction,
      DailyContinuationAction.playQuestion,
    );
  });

  test('debug reward confirmation applies the server continuation', () async {
    final rewardedContinuation = summary.continuation.copyWith(
      nextAction: DailyContinuationAction.playQuestion,
      rewardedVideosUsed: 1,
      rewardedVideosRemaining: 5,
      rollingVideosUsed: 1,
      bonusQuestionsGranted: 5,
      bonusQuestionsRemaining: 5,
    );
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => Result.ok(summary));
    when(
      () => repository.confirmDebugRewardedAd(
        runId: 'run-1',
        clientEventId: 'ad-event-1',
      ),
    ).thenAnswer((_) async => Result.ok(rewardedContinuation));
    await notifier.bootstrap();

    final confirmed = await notifier.confirmDebugRewardedAd(
      clientEventId: 'ad-event-1',
    );

    final state = notifier.state as DailyEditionSummaryState;
    expect(confirmed, isTrue);
    expect(state.summary.continuation.rewardedVideosUsed, 1);
    expect(state.summary.continuation.bonusQuestionsRemaining, 5);
  });

  test('an unconfirmed client reward never grants questions locally', () async {
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(completedRun));
    when(() => repository.fetchSummary('run-1'))
        .thenAnswer((_) async => Result.ok(summary));
    when(() => repository.fetchContinuation('run-1'))
        .thenAnswer((_) async => Result.ok(summary.continuation));
    await notifier.bootstrap();

    final confirmed = await notifier.waitForRewardedAdConfirmation(
      previousRewardedVideosUsed: 0,
      maxAttempts: 2,
    );

    final state = notifier.state as DailyEditionSummaryState;
    expect(confirmed, isFalse);
    expect(state.summary.continuation.bonusQuestionsGranted, 0);
    expect(state.summary.continuation.bonusQuestionsRemaining, 0);
    verify(() => repository.fetchContinuation('run-1')).called(2);
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

  test('bootstrap restores the text of an already used server hint', () async {
    final hintedAssignment = assignment.copyWith(hintUsed: true);
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => Result.ok(hintedAssignment));
    when(
      () => repository.useHint(
        runId: 'run-1',
        assignmentId: 'assignment-4',
      ),
    ).thenAnswer(
      (_) async => const Result.ok(
        DailyHintEntity(
          assignmentId: 'assignment-4',
          hint: 'Restored server hint',
        ),
      ),
    );

    await notifier.bootstrap();

    final state = notifier.state as DailyEditionActiveState;
    expect(state.assignment.hintUsed, isTrue);
    expect(state.hint?.hint, 'Restored server hint');
    verify(
      () => repository.useHint(
        runId: 'run-1',
        assignmentId: 'assignment-4',
      ),
    ).called(1);
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
      action: DailyAttemptAction.answer,
      answerId: 'answer-1',
    );

    final state = notifier.state as DailyEditionActiveState;
    expect(state.attempt?.ratingDelta, 12);
    expect(state.attempt?.description, 'Server explanation');
    expect(state.assignment.assignmentId, 'assignment-4');
    final saved = verify(() => outbox.save(captureAny())).captured.single
        as PendingDailyAttemptEntity;
    expect(saved.accountId, 'account-1');
    expect(saved.runId, 'run-1');
    expect(saved.assignmentId, 'assignment-4');
    expect(saved.clientEventId, 'event-1');
    expect(saved.createdAt, DateTime.parse('2026-08-26T00:00:00Z'));
    verify(
      () => outbox.clear(
        accountId: 'account-1',
        clientEventId: 'event-1',
      ),
    ).called(1);
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
        .thenAnswer((_) async => Result.ok(summary));
    await notifier.bootstrap();
    await notifier.submitAttempt(
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
        .thenAnswer((_) async => Result.ok(summary));

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

  test('does not send an attempt before its envelope is persisted', () async {
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    when(() => outbox.save(any())).thenThrow(StateError('disk failed'));
    await notifier.bootstrap();

    await notifier.submitAttempt(
      action: DailyAttemptAction.answer,
      answerId: 'answer-1',
    );

    final state = notifier.state as DailyEditionActiveState;
    expect(state.failure, isA<UnknownFailure>());
    verifyNever(
      () => repository.submitAttempt(
        runId: any(named: 'runId'),
        assignmentId: any(named: 'assignmentId'),
        clientEventId: any(named: 'clientEventId'),
        action: any(named: 'action'),
        answerId: any(named: 'answerId'),
      ),
    );
  });

  test('missing run drops the stale attempt and opens the current server day',
      () async {
    var openCalls = 0;
    final nextRun = activeRun.copyWith(
      runId: 'run-2',
      editionDate: '2026-08-26',
      resolvedCount: 0,
    );
    when(() => repository.open(timezoneId: null)).thenAnswer(
      (_) async => Result.ok(++openCalls == 1 ? activeRun : nextRun),
    );
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));
    when(() => repository.fetchCurrent('run-2'))
        .thenAnswer((_) async => const Result.ok(nextAssignment));
    when(
      () => repository.submitAttempt(
        runId: 'run-1',
        assignmentId: 'assignment-4',
        clientEventId: 'event-1',
        action: DailyAttemptAction.answer,
        answerId: 'answer-1',
      ),
    ).thenAnswer(
      (_) async => const Result.failed(
        NetworkFailure(
          NetworkFailureReason.badResponse(
            'Daily run not found',
            statusCode: 400,
            errorCode: 'DAILY_RUN_NOT_FOUND',
          ),
        ),
      ),
    );
    await notifier.bootstrap();

    await notifier.submitAttempt(
      action: DailyAttemptAction.answer,
      answerId: 'answer-1',
    );

    final state = notifier.state as DailyEditionActiveState;
    expect(state.run.runId, 'run-2');
    expect(state.assignment.assignmentId, 'assignment-5');
    verify(
      () => outbox.clear(
        accountId: 'account-1',
        clientEventId: 'event-1',
      ),
    ).called(1);
  });

  test('retry reuses the persisted client event id after a lost response',
      () async {
    var submitCalls = 0;
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
    ).thenAnswer((_) async {
      submitCalls++;
      if (submitCalls == 1) {
        return const Result.failed(
          NetworkFailure(NetworkFailureReason.server('response lost')),
        );
      }
      return const Result.ok(attempt);
    });
    await notifier.bootstrap();

    await notifier.submitAttempt(
      action: DailyAttemptAction.answer,
      answerId: 'answer-1',
    );
    final pending = verify(() => outbox.save(captureAny())).captured.single
        as PendingDailyAttemptEntity;
    when(() => outbox.load(accountId: 'account-1'))
        .thenAnswer((_) async => pending);
    verifyNever(
      () => outbox.clear(
        accountId: any(named: 'accountId'),
        clientEventId: any(named: 'clientEventId'),
      ),
    );

    await notifier.retryPendingAttempt();

    final state = notifier.state as DailyEditionActiveState;
    expect(state.attempt?.clientEventId, 'event-1');
    verify(
      () => repository.submitAttempt(
        runId: 'run-1',
        assignmentId: 'assignment-4',
        clientEventId: 'event-1',
        action: DailyAttemptAction.answer,
        answerId: 'answer-1',
      ),
    ).called(2);
    verify(
      () => outbox.clear(
        accountId: 'account-1',
        clientEventId: 'event-1',
      ),
    ).called(1);
  });

  test('server recovery retries the pending attempt with increasing backoff',
      () async {
    final connectivity = FakeConnectivityService(connected: true);
    final retryWaiters = <Completer<void>>[];
    final retryDelays = <Duration>[];
    PendingDailyAttemptEntity? savedPending;
    var submitCalls = 0;
    final secondSubmitStarted = Completer<void>();
    final thirdSubmitStarted = Completer<void>();
    final coordinatedNotifier = DailyEditionNotifier(
      accountId: 'account-1',
      repository: repository,
      outbox: outbox,
      connectivityService: connectivity,
      clientEventIdFactory: () => 'event-1',
      now: () => DateTime.parse('2026-08-26T00:00:00Z'),
      automaticRetryDelay: (duration) {
        retryDelays.add(duration);
        final waiter = Completer<void>();
        retryWaiters.add(waiter);
        return waiter.future;
      },
    );
    addTearDown(coordinatedNotifier.dispose);
    addTearDown(connectivity.dispose);
    when(() => outbox.save(any())).thenAnswer((invocation) async {
      savedPending =
          invocation.positionalArguments.single as PendingDailyAttemptEntity;
    });
    when(() => outbox.load(accountId: 'account-1'))
        .thenAnswer((_) async => savedPending);
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
    ).thenAnswer((_) async {
      submitCalls += 1;
      if (submitCalls == 2) secondSubmitStarted.complete();
      if (submitCalls == 3) thirdSubmitStarted.complete();
      return submitCalls < 3
          ? const Result.failed(Failure.serverUnavailable())
          : const Result.ok(attempt);
    });

    await coordinatedNotifier.bootstrap();
    await coordinatedNotifier.submitAttempt(
      action: DailyAttemptAction.answer,
      answerId: 'answer-1',
    );

    expect(retryDelays, [const Duration(seconds: 2)]);
    retryWaiters[0].complete();
    await secondSubmitStarted.future;
    await Future<void>.delayed(Duration.zero);
    expect(retryDelays, [
      const Duration(seconds: 2),
      const Duration(seconds: 5),
    ]);

    retryWaiters[1].complete();
    await thirdSubmitStarted.future;
    await Future<void>.delayed(Duration.zero);

    final state = coordinatedNotifier.state as DailyEditionActiveState;
    expect(state.attempt?.clientEventId, 'event-1');
    verify(
      () => repository.submitAttempt(
        runId: 'run-1',
        assignmentId: 'assignment-4',
        clientEventId: 'event-1',
        action: DailyAttemptAction.answer,
        answerId: 'answer-1',
      ),
    ).called(3);
  });

  test('internet recovery immediately retries the pending attempt', () async {
    final connectivity = FakeConnectivityService(connected: false);
    PendingDailyAttemptEntity? savedPending;
    var submitCalls = 0;
    final retryStarted = Completer<void>();
    final coordinatedNotifier = DailyEditionNotifier(
      accountId: 'account-1',
      repository: repository,
      outbox: outbox,
      connectivityService: connectivity,
      clientEventIdFactory: () => 'event-1',
      now: () => DateTime.parse('2026-08-26T00:00:00Z'),
    );
    addTearDown(coordinatedNotifier.dispose);
    addTearDown(connectivity.dispose);
    when(() => outbox.save(any())).thenAnswer((invocation) async {
      savedPending =
          invocation.positionalArguments.single as PendingDailyAttemptEntity;
    });
    when(() => outbox.load(accountId: 'account-1'))
        .thenAnswer((_) async => savedPending);
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
    ).thenAnswer((_) async {
      submitCalls += 1;
      if (submitCalls == 2) retryStarted.complete();
      return submitCalls == 1
          ? const Result.failed(Failure.noConnection())
          : const Result.ok(attempt);
    });

    await coordinatedNotifier.bootstrap();
    await coordinatedNotifier.submitAttempt(
      action: DailyAttemptAction.answer,
      answerId: 'answer-1',
    );
    expect(submitCalls, 1);

    connectivity.emit(InternetStatus.connected);
    await retryStarted.future;
    await Future<void>.delayed(Duration.zero);

    final state = coordinatedNotifier.state as DailyEditionActiveState;
    expect(state.attempt?.clientEventId, 'event-1');
    expect(submitCalls, 2);
  });

  test('bootstrap replays pending attempt before loading current assignment',
      () async {
    final pending = PendingDailyAttemptEntity(
      accountId: 'account-1',
      runId: 'run-1',
      assignmentId: 'assignment-4',
      clientEventId: 'pending-event',
      action: DailyAttemptAction.answer,
      answerId: 'answer-1',
      createdAt: DateTime.parse('2026-08-25T23:59:00Z'),
      assignment: assignment,
    );
    when(() => outbox.load(accountId: 'account-1'))
        .thenAnswer((_) async => pending);
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(
      () => repository.submitAttempt(
        runId: 'run-1',
        assignmentId: 'assignment-4',
        clientEventId: 'pending-event',
        action: DailyAttemptAction.answer,
        answerId: 'answer-1',
      ),
    ).thenAnswer((_) async => const Result.ok(attempt));
    await notifier.bootstrap();

    final state = notifier.state as DailyEditionActiveState;
    expect(state.assignment.assignmentId, 'assignment-4');
    expect(state.attempt, attempt);
    verifyInOrder([
      () => outbox.load(accountId: 'account-1'),
      () => repository.submitAttempt(
            runId: 'run-1',
            assignmentId: 'assignment-4',
            clientEventId: 'pending-event',
            action: DailyAttemptAction.answer,
            answerId: 'answer-1',
          ),
      () => outbox.clear(
            accountId: 'account-1',
            clientEventId: 'pending-event',
          ),
    ]);
    verifyNever(() => repository.fetchCurrent('run-1'));
  });

  test('bootstrap drops a stale envelope only after server opens a new run',
      () async {
    final stale = PendingDailyAttemptEntity(
      accountId: 'account-1',
      runId: 'old-run',
      assignmentId: 'old-assignment',
      clientEventId: 'old-event',
      action: DailyAttemptAction.skip,
      answerId: null,
      createdAt: DateTime.parse('2026-08-24T00:00:00Z'),
    );
    when(() => outbox.load(accountId: 'account-1'))
        .thenAnswer((_) async => stale);
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(assignment));

    await notifier.bootstrap();

    expect(notifier.state, isA<DailyEditionActiveState>());
    verify(
      () => outbox.clear(
        accountId: 'account-1',
        clientEventId: 'old-event',
      ),
    ).called(1);
    verifyNever(
      () => repository.submitAttempt(
        runId: any(named: 'runId'),
        assignmentId: any(named: 'assignmentId'),
        clientEventId: any(named: 'clientEventId'),
        action: any(named: 'action'),
        answerId: any(named: 'answerId'),
      ),
    );
  });

  test('bootstrap reconciles an unaccepted attempt resolved on another device',
      () async {
    final pending = PendingDailyAttemptEntity(
      accountId: 'account-1',
      runId: 'run-1',
      assignmentId: 'assignment-4',
      clientEventId: 'pending-event',
      action: DailyAttemptAction.answer,
      answerId: 'answer-1',
      createdAt: DateTime.parse('2026-08-25T23:59:00Z'),
    );
    when(() => outbox.load(accountId: 'account-1'))
        .thenAnswer((_) async => pending);
    when(() => repository.open(timezoneId: null))
        .thenAnswer((_) async => Result.ok(activeRun));
    when(
      () => repository.submitAttempt(
        runId: 'run-1',
        assignmentId: 'assignment-4',
        clientEventId: 'pending-event',
        action: DailyAttemptAction.answer,
        answerId: 'answer-1',
      ),
    ).thenAnswer(
      (_) async => const Result.failed(
        NetworkFailure(
          NetworkFailureReason.badResponse(
            'already resolved elsewhere',
            statusCode: 409,
            errorCode: 'ASSIGNMENT_NOT_CURRENT',
          ),
        ),
      ),
    );
    when(() => repository.fetchCurrent('run-1'))
        .thenAnswer((_) async => const Result.ok(nextAssignment));

    await notifier.bootstrap();

    final state = notifier.state as DailyEditionActiveState;
    expect(state.assignment.assignmentId, 'assignment-5');
    verify(
      () => outbox.clear(
        accountId: 'account-1',
        clientEventId: 'pending-event',
      ),
    ).called(1);
  });
}
