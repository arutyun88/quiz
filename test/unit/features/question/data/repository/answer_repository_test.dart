import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/data/converter/answer_result_converter.dart';
import 'package:quiz/features/question/data/dto/answer_result_dto.dart';
import 'package:quiz/features/question/data/repository/remote_answer_repository.dart';
import 'package:quiz/features/question/domain/entity/answer_result_entity.dart';
import 'package:quiz/features/question/domain/entity/answered_question_entity.dart';
import 'package:quiz/features/question/domain/repository/answer_repository.dart';
import 'package:quiz/features/user/data/converter/user_statistics_converter.dart';
import 'package:quiz/features/user/data/dto/user_statistics_dto.dart';
import 'package:quiz/features/user/domain/entity/user_statistics_entity.dart';

import '../../../../../support/mock_api_client.dart';

final _answerResult = AnswerResultEntity(
  answerId: 'a2',
  correctAnswerId: 'a2',
  description: 'Correct',
  isCorrect: true,
);

final _userStatistics = UserStatisticsEntity(rightCount: 5, wrongCount: 2);

final _answeredQuestion = AnsweredQuestionEntity(
  questionId: 'q1',
  question: '2+2?',
  answerId: 'a2',
  answer: '4',
  answeredAt: DateTime.now().toUtc(),
);

void main() {
  late AnswerRepository answerRepository;
  late MockApiClient apiClient;

  setUpAll(() {
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    apiClient = MockApiClient();
    answerRepository = RemoteAnswerRepository(
      client: apiClient,
      answerConverter: AnswerResultConverterImpl(),
      userStatisticsConverter: UserStatisticsConverterImpl(),
    );
  });

  group('AnswerRepository', () {
    group('send', () {
      group('when POST succeeds', () {
        setUp(() {
          when(
            () => apiClient.post<AnswerResultEntity, DataDto<AnswerResultDto>>(
              any(),
              body: any(named: 'body'),
              queryParameters: any(named: 'queryParameters'),
              headers: any(named: 'headers'),
              mapper: any(named: 'mapper'),
              converter: any(named: 'converter'),
              enableLocale: any(named: 'enableLocale'),
              onSuccess: any(named: 'onSuccess'),
            ),
          ).thenAnswer((_) async => Result.ok(_answerResult));
        });

        test('calls POST /questions/answer with needed parameters', () async {
          await answerRepository.send(questionId: 'q1', answerId: 'a2');

          final captured = verify(
            () => apiClient.post<AnswerResultEntity, DataDto<AnswerResultDto>>(
              '/questions/answer',
              body: captureAny(named: 'body'),
              queryParameters: any(named: 'queryParameters'),
              headers: any(named: 'headers'),
              mapper: any(named: 'mapper'),
              converter: any(named: 'converter'),
              enableLocale: any(named: 'enableLocale'),
              onSuccess: any(named: 'onSuccess'),
            ),
          ).captured;

          final body = captured.first as Map<String, dynamic>;
          expect(body, containsPair('question_id', 'q1'));
          expect(body, containsPair('answer_id', 'a2'));
        });

        test('returns Result.ok with answer result', () async {
          final result = await answerRepository.send(questionId: 'q1', answerId: 'a2');

          expect(result, isA<ResultOk>());
          expect((result as ResultOk).data, _answerResult);

          verify(
            () => _postVerify(apiClient),
          ).called(1);
        });
      });

      group('when POST fails', () {
        test('returns Result.failed with NetworkFailure', () async {
          final failure = NetworkFailure(NetworkFailureReason.server('500'));
          when(
            () => _postVerify(apiClient),
          ).thenAnswer((_) async => Result.failed(failure));

          final result = await answerRepository.send(questionId: 'q1', answerId: 'a2');

          expect(result, isA<ResultFailed>());
          expect((result as ResultFailed).error, failure);
        });
      });
    });

    group('sendAllAnswered', () {
      setUp(() {
        when(
          () => apiClient.post<UserStatisticsEntity, DataDto<UserStatisticsDto>>(
            any(),
            body: any(named: 'body'),
            queryParameters: any(named: 'queryParameters'),
            headers: any(named: 'headers'),
            mapper: any(named: 'mapper'),
            converter: any(named: 'converter'),
            enableLocale: any(named: 'enableLocale'),
            onSuccess: any(named: 'onSuccess'),
          ),
        ).thenAnswer((_) async => Result.ok(_userStatistics));
      });

      test('calls POST /questions/answers with list of answered questions', () async {
        await answerRepository.sendAllAnswered([_answeredQuestion]);

        final captured = verify(
          () => apiClient.post<UserStatisticsEntity, DataDto<UserStatisticsDto>>(
            '/questions/answers',
            body: captureAny(named: 'body'),
            queryParameters: any(named: 'queryParameters'),
            headers: any(named: 'headers'),
            mapper: any(named: 'mapper'),
            converter: any(named: 'converter'),
            enableLocale: any(named: 'enableLocale'),
            onSuccess: any(named: 'onSuccess'),
          ),
        ).captured;

        final body = captured.first as Map<String, dynamic>;

        expect(body['questions'], hasLength(1));
        expect(body['questions'][0]['question_id'], _answeredQuestion.questionId);
        expect(body['questions'][0]['answer_id'], _answeredQuestion.answerId);
        expect(body['questions'][0]['answered_at'], _answeredQuestion.answeredAt.toIso8601String());
      });

      test('returns Result.ok with user statistics', () async {
        final result = await answerRepository.sendAllAnswered([_answeredQuestion]);

        expect(result, isA<ResultOk>());
        expect((result as ResultOk).data, _userStatistics);
      });
    });
  });
}

Future<Result<AnswerResultEntity, Failure>> _postVerify(MockApiClient apiClient) {
  return apiClient.post<AnswerResultEntity, DataDto<AnswerResultDto>>(
    '/questions/answer',
    body: any(named: 'body'),
    queryParameters: any(named: 'queryParameters'),
    headers: any(named: 'headers'),
    mapper: any(named: 'mapper'),
    converter: any(named: 'converter'),
    enableLocale: any(named: 'enableLocale'),
    onSuccess: any(named: 'onSuccess'),
  );
}
