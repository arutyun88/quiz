import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/connectivity_service.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/entity/topic_entity.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';
import 'package:quiz/features/question/domain/service/question_id_service.dart';
import 'package:quiz/features/question/domain/use_case/sync_cached_question_locale_use_case.dart';

import '../../../../../support/mock_question_dao.dart';

class MockQuestionRepository extends Mock implements QuestionRepository {}

class MockConnectivityService extends Mock implements ConnectivityService {}

class MockQuestionIdService extends Mock implements QuestionIdService {}

const _oldQuestion = QuestionEntity(
  id: 'q1',
  question: '2+2?',
  topic: TopicEntity(id: 't1', name: 'Math', description: ''),
  hint: '',
  answers: [
    AnswerEntity(id: 'a1', text: '3'),
    AnswerEntity(id: 'a2', text: '4'),
  ],
);

const _localizedQuestion = QuestionEntity(
  id: 'q1',
  question: 'Сколько будет 2+2?',
  topic: TopicEntity(id: 't1', name: 'Математика', description: ''),
  hint: '',
  answers: [
    AnswerEntity(id: 'a1', text: '3'),
    AnswerEntity(id: 'a2', text: '4'),
  ],
);

void main() {
  late QuestionDao questionDao;
  late QuestionRepository questionRepository;
  late ConnectivityService connectivityService;
  late QuestionIdService questionIdService;
  late SyncCachedQuestionLocaleUseCase useCase;

  setUp(() {
    questionDao = MockQuestionDao();
    questionRepository = MockQuestionRepository();
    connectivityService = MockConnectivityService();
    questionIdService = MockQuestionIdService();
    useCase = SyncCachedQuestionLocaleUseCaseImpl(
      questionDao: questionDao,
      questionRepository: questionRepository,
      connectivityService: connectivityService,
      questionIdService: questionIdService,
    );
  });

  group('SyncCachedQuestionLocaleUseCase', () {
    test('does not touch cache when there is no internet connection', () async {
      when(() => questionDao.getAllQuestions()).thenAnswer((_) async => Result.ok([_oldQuestion]));
      when(() => connectivityService.hasInternetConnection()).thenAnswer((_) async => false);

      final result = await useCase.sync();

      expect(result, isA<ResultFailed<SyncCachedQuestionLocaleResult, Failure>>());
      expect((result as ResultFailed).error, isA<NoConnectionFailure>());
      verify(() => questionDao.getAllQuestions()).called(1);
      verifyNever(() => questionRepository.localizeByIds(any()));
      verifyNever(() => questionDao.replaceAll(any()));
    });

    test('replaces cache with localized questions when sync succeeds', () async {
      when(() => questionDao.getAllQuestions()).thenAnswer((_) async => Result.ok([_oldQuestion]));
      when(() => connectivityService.hasInternetConnection()).thenAnswer((_) async => true);
      when(() => questionRepository.localizeByIds(any())).thenAnswer((_) async => Result.ok([_localizedQuestion]));
      when(() => questionDao.replaceAll(any())).thenAnswer((_) async => Result.ok(null));
      when(() => questionIdService.questionId).thenReturn(_oldQuestion.id);

      final result = await useCase.sync();

      expect(result, isA<ResultOk<SyncCachedQuestionLocaleResult, Failure>>());
      final data = (result as ResultOk<SyncCachedQuestionLocaleResult, Failure>).data;
      expect(data.cachedCount, 1);
      expect(data.syncedCount, 1);
      verify(() => questionRepository.localizeByIds([_oldQuestion.id])).called(1);
      verify(() => questionDao.replaceAll([_localizedQuestion])).called(1);
      verifyNever(() => questionIdService.clean());
    });

    test('localizes cached questions in chunks and replaces cache once', () async {
      final cachedQuestions = List.generate(51, (index) => _question(index + 1));
      final firstChunkIds = cachedQuestions.take(50).map((question) => question.id).toList();
      final secondChunkIds = cachedQuestions.skip(50).map((question) => question.id).toList();

      when(() => questionDao.getAllQuestions()).thenAnswer((_) async => Result.ok(cachedQuestions));
      when(() => connectivityService.hasInternetConnection()).thenAnswer((_) async => true);
      when(() => questionRepository.localizeByIds(any())).thenAnswer(
        (invocation) async {
          final ids = invocation.positionalArguments.single as List<String>;
          return Result.ok(ids.map(_localizedQuestionById).toList());
        },
      );
      when(() => questionDao.replaceAll(any())).thenAnswer((_) async => Result.ok(null));
      when(() => questionIdService.questionId).thenReturn(null);

      final result = await useCase.sync();

      expect(result, isA<ResultOk<SyncCachedQuestionLocaleResult, Failure>>());
      final data = (result as ResultOk<SyncCachedQuestionLocaleResult, Failure>).data;
      expect(data.cachedCount, 51);
      expect(data.syncedCount, 51);

      final capturedChunks = verify(() => questionRepository.localizeByIds(captureAny())).captured;
      expect(capturedChunks, hasLength(2));
      expect(capturedChunks[0], firstChunkIds);
      expect(capturedChunks[1], secondChunkIds);

      final replacedQuestions =
          verify(() => questionDao.replaceAll(captureAny())).captured.single as List<QuestionEntity>;
      expect(replacedQuestions, hasLength(51));
      expect(replacedQuestions.map((question) => question.id), [
        ...firstChunkIds,
        ...secondChunkIds,
      ]);
    });

    test('does not replace cache when one of chunks fails', () async {
      final cachedQuestions = List.generate(51, (index) => _question(index + 1));
      final failure = NetworkFailure(NetworkFailureReason.server('500'));

      when(() => questionDao.getAllQuestions()).thenAnswer((_) async => Result.ok(cachedQuestions));
      when(() => connectivityService.hasInternetConnection()).thenAnswer((_) async => true);
      when(() => questionRepository.localizeByIds(any())).thenAnswer(
        (invocation) async {
          final ids = invocation.positionalArguments.single as List<String>;
          if (ids.length == 1) {
            return Result.failed(failure);
          }
          return Result.ok(ids.map(_localizedQuestionById).toList());
        },
      );

      final result = await useCase.sync();

      expect(result, isA<ResultFailed<SyncCachedQuestionLocaleResult, Failure>>());
      expect((result as ResultFailed).error, failure);
      verify(() => questionRepository.localizeByIds(any())).called(2);
      verifyNever(() => questionDao.replaceAll(any()));
    });

    test('does not replace cache when localized response misses requested ids', () async {
      const anotherQuestion = QuestionEntity(
        id: 'q2',
        question: 'Сколько будет 3+3?',
        topic: TopicEntity(id: 't1', name: 'Математика', description: ''),
        hint: '',
        answers: [
          AnswerEntity(id: 'a3', text: '5'),
          AnswerEntity(id: 'a4', text: '6'),
        ],
      );

      when(() => questionDao.getAllQuestions()).thenAnswer((_) async => Result.ok([_oldQuestion]));
      when(() => connectivityService.hasInternetConnection()).thenAnswer((_) async => true);
      when(() => questionRepository.localizeByIds(any())).thenAnswer((_) async => Result.ok([anotherQuestion]));

      final result = await useCase.sync();

      expect(result, isA<ResultFailed<SyncCachedQuestionLocaleResult, Failure>>());
      expect(
        ((result as ResultFailed).error as QuestionFailure).reason,
        isA<QuestionFailureNotFoundCachedReason>(),
      );
      verifyNever(() => questionDao.replaceAll(any()));
    });

    test('cleans stale current question id after localized cache is saved', () async {
      when(() => questionDao.getAllQuestions()).thenAnswer((_) async => Result.ok([_oldQuestion]));
      when(() => connectivityService.hasInternetConnection()).thenAnswer((_) async => true);
      when(() => questionRepository.localizeByIds(any())).thenAnswer((_) async => Result.ok([_localizedQuestion]));
      when(() => questionDao.replaceAll(any())).thenAnswer((_) async => Result.ok(null));
      when(() => questionIdService.questionId).thenReturn('stale-question-id');
      when(() => questionIdService.clean()).thenAnswer((_) async {});

      final result = await useCase.sync();

      expect(result, isA<ResultOk<SyncCachedQuestionLocaleResult, Failure>>());
      verify(() => questionIdService.clean()).called(1);
    });
  });
}

QuestionEntity _question(int number) {
  return QuestionEntity(
    id: 'q$number',
    question: 'Question $number?',
    topic: const TopicEntity(id: 't1', name: 'Math', description: ''),
    hint: '',
    answers: [
      AnswerEntity(id: 'a${number}1', text: 'A'),
      AnswerEntity(id: 'a${number}2', text: 'B'),
    ],
  );
}

QuestionEntity _localizedQuestionById(String id) {
  return QuestionEntity(
    id: id,
    question: 'Localized $id?',
    topic: const TopicEntity(id: 't1', name: 'Математика', description: ''),
    hint: '',
    answers: [
      AnswerEntity(id: '${id}a1', text: 'А'),
      AnswerEntity(id: '${id}a2', text: 'Б'),
    ],
  );
}
