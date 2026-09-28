import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question_report/domain/entity/question_report.dart';
import 'package:quiz/features/question_report/domain/repository/question_report_repository.dart';
import 'package:quiz/features/question_report/presentation/provider/question_report_provider.dart';

void main() {
  test('retry reuses the client event id and preserves the payload', () async {
    final repository = _FakeQuestionReportRepository([
      const Result.failed(Failure.noConnection()),
      const Result.ok(null),
    ]);
    var generatedIds = 0;
    final notifier = QuestionReportNotifier(
      attemptId: 'attempt-1',
      repository: repository,
      clientEventIdFactory: () => 'event-${++generatedIds}',
    );

    expect(
      await notifier.submit(
        category: QuestionReportCategory.ambiguous,
        locale: 'ru',
        details: '  Формулировка допускает два ответа  ',
      ),
      isFalse,
    );
    expect(notifier.state, isA<QuestionReportFailedState>());

    expect(
      await notifier.submit(
        category: QuestionReportCategory.ambiguous,
        locale: 'ru',
        details: 'Формулировка допускает два ответа',
      ),
      isTrue,
    );
    expect(notifier.state, isA<QuestionReportSubmittedState>());
    expect(repository.submissions, hasLength(2));
    expect(repository.submissions[0].clientEventId, 'event-1');
    expect(repository.submissions[1].clientEventId, 'event-1');
    expect(
        repository.submissions[1].details, 'Формулировка допускает два ответа');
  });

  test('changed payload after a failure receives a new client event id',
      () async {
    final repository = _FakeQuestionReportRepository([
      const Result.failed(Failure.noConnection()),
      const Result.ok(null),
    ]);
    var generatedIds = 0;
    final notifier = QuestionReportNotifier(
      attemptId: 'attempt-1',
      repository: repository,
      clientEventIdFactory: () => 'event-${++generatedIds}',
    );

    await notifier.submit(
      category: QuestionReportCategory.technical,
      locale: 'en',
    );
    await notifier.submit(
      category: QuestionReportCategory.other,
      locale: 'en',
    );

    expect(repository.submissions[0].clientEventId, 'event-1');
    expect(repository.submissions[1].clientEventId, 'event-2');
  });

  test('retry preserves the visible failure while the request is in flight',
      () async {
    final retry = Completer<Result<void, Failure>>();
    final repository = _ControllableQuestionReportRepository(retry.future);
    final notifier = QuestionReportNotifier(
      attemptId: 'attempt-1',
      repository: repository,
      clientEventIdFactory: () => 'event-1',
    );

    await notifier.submit(
      category: QuestionReportCategory.technical,
      locale: 'ru',
    );
    final submit = notifier.submit(
      category: QuestionReportCategory.technical,
      locale: 'ru',
    );
    await Future<void>.delayed(Duration.zero);

    expect(
      notifier.state,
      isA<QuestionReportSubmittingState>().having(
        (state) => state.previousFailure,
        'previousFailure',
        const Failure.noConnection(),
      ),
    );

    retry.complete(const Result.ok(null));
    expect(await submit, isTrue);
  });
}

class _FakeQuestionReportRepository implements QuestionReportRepository {
  _FakeQuestionReportRepository(this.results);

  final List<Result<void, Failure>> results;
  final List<QuestionReportSubmission> submissions = [];

  @override
  Future<Result<void, Failure>> submit(
    QuestionReportSubmission submission,
  ) async {
    submissions.add(submission);
    return results.removeAt(0);
  }
}

class _ControllableQuestionReportRepository
    implements QuestionReportRepository {
  _ControllableQuestionReportRepository(this.retry);

  final Future<Result<void, Failure>> retry;
  var requests = 0;

  @override
  Future<Result<void, Failure>> submit(
    QuestionReportSubmission submission,
  ) {
    requests += 1;
    return requests == 1
        ? Future.value(const Result.failed(Failure.noConnection()))
        : retry;
  }
}
