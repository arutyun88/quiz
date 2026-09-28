import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question_report/data/repository/remote_question_report_repository.dart';
import 'package:quiz/features/question_report/domain/entity/question_report.dart';

import '../../../../../support/mock_api_client.dart';

void main() {
  late MockApiClient client;
  late RemoteQuestionReportRepository repository;

  setUpAll(() => registerFallbackValue(<String, dynamic>{}));

  setUp(() {
    client = MockApiClient();
    repository = RemoteQuestionReportRepository(client: client);
    when(
      () => client.post<void, void>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer((_) async => const Result.ok(null));
  });

  test('posts the server-owned report contract', () async {
    const submission = QuestionReportSubmission(
      clientEventId: 'event-1',
      attemptId: 'attempt-1',
      category: QuestionReportCategory.badTranslation,
      locale: 'ru',
      details: 'Неверно переведён вариант ответа',
    );

    final result = await repository.submit(submission);

    expect(result, isA<ResultOk<void, Failure>>());
    final body = verify(
      () => client.post<void, void>(
        '/question-reports',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
        onSuccess: any(named: 'onSuccess'),
      ),
    ).captured.single;
    expect(body, {
      'client_event_id': 'event-1',
      'attempt_id': 'attempt-1',
      'category': 'BAD_TRANSLATION',
      'details': 'Неверно переведён вариант ответа',
      'locale': 'ru',
    });
  });
}
