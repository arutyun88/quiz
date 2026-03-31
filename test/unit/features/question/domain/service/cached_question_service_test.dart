import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/database/dao/answered_question_dao.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/domain/entity/answered_question_entity.dart';
import 'package:quiz/features/question/domain/service/cached_question_service.dart';

import '../../../../../features/question/domain/use_case/check_question_state_use_case_test.dart';
import '../../../../../support/mock_app_database.dart';
import '../../../../../support/mock_question_dao.dart';

final _answeredQuestion = AnsweredQuestionEntity(
  questionId: 'q1',
  question: '2+2?',
  answerId: 'a2',
  answer: '4',
  answeredAt: DateTime.now().toUtc(),
);

void main() {
  late CachedQuestionService service;
  late QuestionDao questionDao;
  late AnsweredQuestionDao answeredQuestionDao;

  setUpAll(() {
    registerFallbackValue(_answeredQuestion);
  });

  setUp(() {
    questionDao = MockQuestionDao();
    answeredQuestionDao = MockAnsweredQuestionDao();
    service = CachedQuestionServiceImpl(
      database: MockAppDatabase(),
      questionDao: questionDao,
      answeredQuestionDao: answeredQuestionDao,
    );
  });

  group('CachedQuestionService', () {
    group('markAsAnswered', () {
      test('should save answered question and delete question', () async {
        when(() => answeredQuestionDao.save(any())).thenAnswer((_) async => Result.ok(null));
        when(() => questionDao.removeById(any())).thenAnswer((_) async => Result.ok(null));

        final result = await service.markAsAnswered(_answeredQuestion);

        expect(result, isA<ResultOk>());
        verify(() => answeredQuestionDao.save(_answeredQuestion)).called(1);
        verify(() => questionDao.removeById('q1')).called(1);
      });

      test('should return error when save answered question fails', () async {
        final failure = QuestionFailure(QuestionFailureReason.save());
        when(() => answeredQuestionDao.save(any())).thenAnswer((_) async => Result.failed(failure));
        when(() => questionDao.removeById(any())).thenAnswer((_) async => Result.ok(null));

        final result = await service.markAsAnswered(_answeredQuestion);

        expect(result, isA<ResultFailed>());
        expect((result as ResultFailed).error, isA<QuestionFailure>());
        verify(() => answeredQuestionDao.save(_answeredQuestion)).called(1);
        verifyNever(() => questionDao.removeById(any()));
      });

      test('should return error when delete question fails', () async {
        final failure = QuestionFailure(QuestionFailureReason.markAsAnswered());
        when(() => answeredQuestionDao.save(any())).thenAnswer((_) async => Result.ok(null));
        when(() => questionDao.removeById(any())).thenAnswer((_) async => Result.failed(failure));

        final result = await service.markAsAnswered(_answeredQuestion);

        expect(result, isA<ResultFailed>());
        expect((result as ResultFailed).error, isA<QuestionFailure>());
        verify(() => answeredQuestionDao.save(_answeredQuestion)).called(1);
        verify(() => questionDao.removeById('q1')).called(1);
      });
    });

    group('deleteById', () {
      test('should delete question by id', () async {
        when(() => questionDao.removeById(any())).thenAnswer((_) async => Result.ok(null));

        final result = await service.deleteById('q1');

        expect(result, isA<ResultOk>());
        verify(() => questionDao.removeById('q1')).called(1);
      });

      test('should return error when delete question fails', () async {
        final failure = QuestionFailure(QuestionFailureReason.markAsAnswered());
        when(() => questionDao.removeById(any())).thenAnswer((_) async => Result.failed(failure));

        final result = await service.deleteById('q1');

        expect(result, isA<ResultFailed>());
        expect((result as ResultFailed).error, isA<QuestionFailure>());
        verify(() => questionDao.removeById('q1')).called(1);
      });
    });

    group('fetchAllCachedAnsweredQuestions', () {
      test('should return list of answered questions', () async {
        when(() => answeredQuestionDao.getAllAnsweredQuestions())
            .thenAnswer((_) async => Result.ok([_answeredQuestion]));

        final result = await service.fetchAllCachedAnsweredQuestions();

        expect(result, isA<ResultOk>());
        expect((result as ResultOk).data, [_answeredQuestion]);
        verify(() => answeredQuestionDao.getAllAnsweredQuestions()).called(1);
      });

      test('should return error when get all answered questions fails', () async {
        final failure = QuestionFailure(QuestionFailureReason.notFoundCached());
        when(() => answeredQuestionDao.getAllAnsweredQuestions()).thenAnswer((_) async => Result.failed(failure));

        final result = await service.fetchAllCachedAnsweredQuestions();

        expect(result, isA<ResultFailed>());
        expect((result as ResultFailed).error, isA<QuestionFailure>());
        verify(() => answeredQuestionDao.getAllAnsweredQuestions()).called(1);
      });
    });

    group('clear', () {
      test('should clear all answered questions', () async {
        when(() => answeredQuestionDao.clearAllCache()).thenAnswer((_) async => Result.ok(null));

        final result = await service.clear();

        expect(result, isA<ResultOk>());
        verify(() => answeredQuestionDao.clearAllCache()).called(1);
      });

      test('should return error when clear all answered questions fails', () async {
        final failure = QuestionFailure(QuestionFailureReason.notFoundCached());
        when(() => answeredQuestionDao.clearAllCache()).thenAnswer((_) async => Result.failed(failure));

        final result = await service.clear();
        expect(result, isA<ResultFailed>());
        expect((result as ResultFailed).error, isA<QuestionFailure>());
        verify(() => answeredQuestionDao.clearAllCache()).called(1);
      });
    });
  });
}
