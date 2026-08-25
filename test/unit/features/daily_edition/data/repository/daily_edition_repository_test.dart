import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/daily_edition/data/dto/daily_edition_dto.dart';
import 'package:quiz/features/daily_edition/data/repository/remote_daily_edition_repository.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/domain/repository/daily_edition_repository.dart';

import '../../../../../support/mock_api_client.dart';

void main() {
  late MockApiClient client;
  late DailyEditionRepository repository;

  final run = DailyRunEntity(
    runId: 'run-1',
    editionDate: '2026-08-25',
    status: DailyRunStatus.inProgress,
    closesAt: DateTime.parse('2026-08-25T23:00:00Z'),
    graceEndsAt: DateTime.parse('2026-08-25T23:30:00Z'),
    requiredCount: 10,
    resolvedCount: 0,
    ratingAtOpen: 1000,
  );

  const assignment = DailyAssignmentEntity(
    assignmentId: 'assignment-1',
    questionId: 'question-1',
    questionVersionId: 'version-1',
    position: 1,
    kind: DailyAssignmentKind.main,
    topic: 'Science',
    text: 'Question?',
    answers: [DailyAssignmentAnswerEntity(id: 'answer-1', text: 'Answer')],
    hintUsed: false,
  );

  const attempt = DailyAttemptEntity(
    clientEventId: 'event-1',
    attemptId: 'attempt-1',
    assignmentId: 'assignment-1',
    questionVersionId: 'version-1',
    action: DailyAttemptAction.answer,
    isCorrect: true,
    answerId: 'answer-1',
    correctAnswerId: 'answer-1',
    description: 'Explanation',
    hintUsed: false,
    xpAwarded: 10,
    ratingBefore: 1000,
    ratingAfter: 1010,
    ratingDelta: 10,
    provisional: true,
    runCompleted: false,
    partner: null,
  );

  const hint = DailyHintEntity(
    assignmentId: 'assignment-1',
    hint: null,
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
    answerXp: 84,
    completionXp: 25,
    totalXp: 109,
    bonusGranted: 0,
    bonusServed: 0,
  );

  const rewardedAd = RewardedAdEntity(
    clientEventId: 'ad-event-1',
    grantedQuestions: 5,
  );

  setUpAll(() {
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    client = MockApiClient();
    repository = RemoteDailyEditionRepository(client: client);
  });

  test('open sends the optional IANA timezone as a header', () async {
    when(
      () => client.post<DailyRunEntity, DataDto<DailyOpenDto>>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer((_) async => Result.ok(run));

    await repository.open(timezoneId: 'Asia/Yekaterinburg');

    final captured = verify(
      () => client.post<DailyRunEntity, DataDto<DailyOpenDto>>(
        '/daily-editions/open',
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: captureAny(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).captured.single as Map<String, dynamic>;

    expect(captured, containsPair('X-Timezone', 'Asia/Yekaterinburg'));
  });

  test('fetchCurrent uses the run-scoped localized endpoint', () async {
    when(
      () => client.get<DailyAssignmentEntity, DataDto<DailyAssignmentDto>>(
        any(),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
      ),
    ).thenAnswer((_) async => const Result.ok(assignment));

    await repository.fetchCurrent('run-1');

    verify(
      () => client.get<DailyAssignmentEntity, DataDto<DailyAssignmentDto>>(
        '/daily-editions/run-1/current',
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: true,
      ),
    ).called(1);
  });

  test('close uses the run-scoped endpoint without local state', () async {
    when(
      () => client.post<DailyRunEntity, DataDto<DailyOpenDto>>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer((_) async => Result.ok(run));

    await repository.close('run-1');

    verify(
      () => client.post<DailyRunEntity, DataDto<DailyOpenDto>>(
        '/daily-editions/run-1/close',
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
        onSuccess: any(named: 'onSuccess'),
      ),
    ).called(1);
  });

  test('useHint uses the localized assignment-scoped endpoint', () async {
    when(
      () => client.post<DailyHintEntity, DataDto<DailyHintDto>>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer((_) async => const Result.ok(hint));

    await repository.useHint(
      runId: 'run-1',
      assignmentId: 'assignment-1',
    );

    verify(
      () => client.post<DailyHintEntity, DataDto<DailyHintDto>>(
        '/daily-editions/run-1/assignments/assignment-1/hint',
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: true,
        onSuccess: any(named: 'onSuccess'),
      ),
    ).called(1);
  });

  test('fetchSummary uses the run-scoped non-localized endpoint', () async {
    when(
      () => client.get<DailySummaryEntity, DataDto<DailySummaryDto>>(
        any(),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
      ),
    ).thenAnswer((_) async => const Result.ok(summary));

    await repository.fetchSummary('run-1');

    verify(
      () => client.get<DailySummaryEntity, DataDto<DailySummaryDto>>(
        '/daily-editions/run-1/summary',
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
      ),
    ).called(1);
  });

  test('submitAttempt sends assignment identity and stable event id', () async {
    when(
      () => client.post<DailyAttemptEntity, DataDto<DailyAttemptDto>>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer((_) async => const Result.ok(attempt));

    await repository.submitAttempt(
      runId: 'run-1',
      assignmentId: 'assignment-1',
      clientEventId: 'event-1',
      action: DailyAttemptAction.answer,
      answerId: 'answer-1',
    );

    final captured = verify(
      () => client.post<DailyAttemptEntity, DataDto<DailyAttemptDto>>(
        '/daily-editions/run-1/attempts',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: true,
        onSuccess: any(named: 'onSuccess'),
      ),
    ).captured.single as Map<String, dynamic>;

    expect(captured, containsPair('client_event_id', 'event-1'));
    expect(captured, containsPair('assignment_id', 'assignment-1'));
    expect(captured, containsPair('action', 'ANSWER'));
    expect(captured, containsPair('answer_id', 'answer-1'));
    expect(captured, isNot(contains('question_id')));
    expect(captured, isNot(contains('answered_at')));
  });

  test('skip omits answer_id instead of manufacturing a local answer',
      () async {
    when(
      () => client.post<DailyAttemptEntity, DataDto<DailyAttemptDto>>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer((_) async => const Result.ok(attempt));

    await repository.submitAttempt(
      runId: 'run-1',
      assignmentId: 'assignment-1',
      clientEventId: 'event-skip',
      action: DailyAttemptAction.skip,
    );

    final captured = verify(
      () => client.post<DailyAttemptEntity, DataDto<DailyAttemptDto>>(
        '/daily-editions/run-1/attempts',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: true,
        onSuccess: any(named: 'onSuccess'),
      ),
    ).captured.single as Map<String, dynamic>;

    expect(captured, containsPair('action', 'SKIP'));
    expect(captured, isNot(contains('answer_id')));
  });

  test('confirmRewardedAd forwards only server-verifiable identifiers',
      () async {
    when(
      () => client.post<RewardedAdEntity, DataDto<RewardedAdDto>>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer((_) async => const Result.ok(rewardedAd));

    await repository.confirmRewardedAd(
      runId: 'run-1',
      clientEventId: 'ad-event-1',
      providerEventId: 'provider-event-1',
      verificationToken: 'ssv-token',
    );

    final captured = verify(
      () => client.post<RewardedAdEntity, DataDto<RewardedAdDto>>(
        '/daily-editions/run-1/rewarded-ads',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
        onSuccess: any(named: 'onSuccess'),
      ),
    ).captured.single as Map<String, dynamic>;

    expect(captured, {
      'client_event_id': 'ad-event-1',
      'provider_event_id': 'provider-event-1',
      'verification_token': 'ssv-token',
    });
    expect(captured, isNot(contains('granted_questions')));
  });
}
