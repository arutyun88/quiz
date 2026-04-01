import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/data_page/data_page_converter.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/data_page/page_info.dart';
import 'package:quiz/app/core/model/data_page/page_info_converter.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/data/converter/answer_converter.dart';
import 'package:quiz/features/question/data/converter/question_converter.dart';
import 'package:quiz/features/question/data/converter/question_state_dto_converter.dart';
import 'package:quiz/features/question/data/converter/topic_converter.dart';
import 'package:quiz/features/question/data/dto/question_dto.dart';
import 'package:quiz/features/question/data/dto/question_state_dto.dart';
import 'package:quiz/features/question/data/repository/remote_question_repository.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/entity/question_state_entity.dart';
import 'package:quiz/features/question/domain/entity/topic_entity.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';

import '../../../../../support/mock_api_client.dart';

final questions = PageEntity<QuestionEntity>(
  items: [
    QuestionEntity(
      id: '1',
      question: 'What is the capital of France?',
      topic: TopicEntity(
        id: 't1',
        name: 'Geography',
        description: '',
      ),
      hint: '',
      answers: [
        AnswerEntity(id: 'a1', text: 'Paris'),
        AnswerEntity(id: 'a2', text: 'London'),
      ],
    ),
  ],
  info: PageInfo(page: 0, limit: 10, hasNextPage: false),
);

final questionState = QuestionStateEntity(questionId: 'q1', isAnswered: false);

void main() {
  late QuestionRepository repository;
  late MockApiClient apiClient;

  setUp(() {
    apiClient = MockApiClient();
    repository = RemoteQuestionRepository(
      client: apiClient,
      questionPageConverter: DataPageConverter<QuestionEntity, QuestionDto>(
        pageInfoConverter: PageInfoConverterImpl(),
        dataConverter: QuestionConverterImpl(
          topicConverter: TopicConverterImpl(),
          answerConverter: AnswerConverterImpl(),
        ),
      ),
      questionStateDtoConverter: QuestionStateDtoConverterImpl(),
    );
  });

  group('QuestionRepository', () {
    group('fetch', () {
      group('when GET succeeds', () {
        setUp(() {
          when(() => _getQuestions(apiClient)).thenAnswer((_) async => Result.ok(questions));
        });

        test('calls GET /questions with X-Limit header', () async {
          await repository.fetch(limit: 10);

          final captured = verify(
            () => apiClient.get<PageEntity<QuestionEntity>, DataPageDto<QuestionDto>>(
              '/questions',
              headers: captureAny(named: 'headers'),
              mapper: any(named: 'mapper'),
              converter: any(named: 'converter'),
              enableLocale: any(named: 'enableLocale'),
            ),
          ).captured;

          final headers = captured.first as Map<String, dynamic>;
          expect(headers, containsPair('X-Limit', 10));
        });

        test('returns Result.ok with questions', () async {
          final result = await repository.fetch(limit: 10);

          expect(result, isA<ResultOk>());
          expect((result as ResultOk).data, questions);

          verify(
            () => _getQuestions(apiClient),
          ).called(1);
        });

        test('default limit is 1', () async {
          await repository.fetch();

          final captured = verify(
            () => apiClient.get<PageEntity<QuestionEntity>, DataPageDto<QuestionDto>>(
              '/questions',
              headers: captureAny(named: 'headers'),
              mapper: any(named: 'mapper'),
              converter: any(named: 'converter'),
              enableLocale: true,
            ),
          ).captured;

          expect(captured.first, containsPair('X-Limit', 1));
        });
      });
      group('when GET fails', () {
        test('returns Result.failed with NetworkFailure', () async {
          final failure = NetworkFailure(NetworkFailureReason.server('500'));
          when(() => _getQuestions(apiClient)).thenAnswer((_) async => Result.failed(failure));

          final result = await repository.fetch();

          expect(result, isA<ResultFailed>());
          expect((result as ResultFailed).error, failure);

          verify(
            () => _getQuestions(apiClient),
          ).called(1);
        });
      });
    });

    group('checkQuestionStateById', () {
      group('when GET succeeds', () {
        setUp(() {
          when(() => _getQuestionStateById(apiClient, 'q1')).thenAnswer(
            (_) async => Result.ok(questionState),
          );
        });
        test('calls GET /questions/:id/state', () async {
          await repository.checkQuestionStateById('q1');

          verify(() => _getQuestionStateById(apiClient, 'q1')).called(1);
        });

        test('returns Result.ok with question state', () async {
          final result = await repository.checkQuestionStateById('q1');

          expect(result, isA<ResultOk<QuestionStateEntity, Failure>>());

          final resultOk = result as ResultOk<QuestionStateEntity, Failure>;
          expect(resultOk.data.questionId, 'q1');
          expect(resultOk.data.isAnswered, false);
        });
      });
      group('when GET fails', () {
        test('returns Result.failed with NetworkFailure', () async {
          final failure = NetworkFailure(NetworkFailureReason.server('500'));
          when(() => _getQuestionStateById(apiClient, 'q1')).thenAnswer((_) async => Result.failed(failure));

          final result = await repository.checkQuestionStateById('q1');

          expect(result, isA<ResultFailed<QuestionStateEntity, Failure>>());

          final resultFailed = result as ResultFailed<QuestionStateEntity, Failure>;
          expect(resultFailed.error, failure);

          verify(
            () => _getQuestionStateById(apiClient, 'q1'),
          ).called(1);
        });
      });
    });
  });
}

Future<Result<PageEntity<QuestionEntity>, Failure>> _getQuestions(MockApiClient apiClient) {
  return apiClient.get<PageEntity<QuestionEntity>, DataPageDto<QuestionDto>>(
    '/questions',
    headers: any(named: 'headers'),
    mapper: any(named: 'mapper'),
    converter: any(named: 'converter'),
    enableLocale: any(named: 'enableLocale'),
  );
}

Future<Result<QuestionStateEntity, Failure>> _getQuestionStateById(MockApiClient apiClient, String id) {
  return apiClient.get<QuestionStateEntity, DataDto<QuestionStateDto>>(
    '/questions/$id/state',
    queryParameters: any(named: 'queryParameters'),
    headers: any(named: 'headers'),
    mapper: any(named: 'mapper'),
    converter: any(named: 'converter'),
    enableLocale: any(named: 'enableLocale'),
  );
}
