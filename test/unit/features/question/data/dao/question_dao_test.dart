import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/data/converter/answer_db_converter.dart';
import 'package:quiz/features/question/data/converter/question_db_converter.dart';
import 'package:quiz/features/question/data/converter/topic_db_converter.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/entity/topic_entity.dart';

final _question = QuestionEntity(
  id: 'q1',
  question: '2+2?',
  topic: TopicEntity(id: 't1', name: 'Math', description: ''),
  hint: '',
  answers: [
    AnswerEntity(id: 'a1', text: '3'),
    AnswerEntity(id: 'a2', text: '4'),
  ],
);
void main() {
  late AppDatabase database;
  late QuestionDao dao;

  setUp(() async {
    database = AppDatabase(
      executor: DatabaseConnection(
        NativeDatabase.memory(),
        closeStreamsSynchronously: true,
      ).executor,
    );

    dao = QuestionDaoImpl(
      database,
      questionConverter: QuestionDbConverterImpl(
        answerConverter: AnswerDbConverterImpl(),
        topicConverter: TopicDbConverterImpl(),
      ),
    );
  });

  tearDown(() async {
    await database.close();
  });

  group('QuestionDao', () {
    group('when database is empty', () {
      test('getRandomQuestion returns notFoundCached', () async {
        final result = await dao.getRandomQuestion();

        expect(result, isA<ResultFailed<QuestionEntity, Failure>>());
        expect((result as ResultFailed<QuestionEntity, Failure>).error, isA<QuestionFailure>());
        expect(((result as ResultFailed).error as QuestionFailure).reason, isA<QuestionFailureNotFoundCachedReason>());
      });

      test('getQuestionById returns notFoundCached', () async {
        final result = await dao.getQuestionById('q1');

        expect(result, isA<ResultFailed<QuestionEntity, Failure>>());
        expect((result as ResultFailed<QuestionEntity, Failure>).error, isA<QuestionFailure>());
        expect(((result as ResultFailed).error as QuestionFailure).reason, isA<QuestionFailureNotFoundCachedReason>());
      });
    });

    group('when database is not empty', () {
      test('save returns ok', () async {
        final result = await dao.save([_question]);

        expect(result, isA<ResultOk<void, Failure>>());
      });

      group('when question is saved', () {
        setUp(() async {
          await dao.save([_question]);
        });

        test('getRandomQuestion returns question', () async {
          final result = await dao.getRandomQuestion();

          expect(result, isA<ResultOk<QuestionEntity, Failure>>());
          expect((result as ResultOk<QuestionEntity, Failure>).data, _question);
        });

        test('getQuestionById returns question by id', () async {
          final result = await dao.getQuestionById('q1');

          expect(result, isA<ResultOk<QuestionEntity, Failure>>());
          expect((result as ResultOk<QuestionEntity, Failure>).data, _question);
        });

        test('removeById returns ok', () async {
          final result = await dao.removeById('q1');

          expect(result, isA<ResultOk<void, Failure>>());
        });

        test('clearAllCache returns ok', () async {
          final result = await dao.clearAllCache();

          expect(result, isA<ResultOk<void, Failure>>());
        });

        test('watchQuestionsCount returns count', () async {
          final stream = dao.watchQuestionsCount();

          expect(stream, isA<Stream<int>>());
          expect(await stream.first, 1);
        });

        test('watchAllQuestions returns questions', () async {
          final stream = dao.watchAllQuestions();

          expect(stream, isA<Stream<List<Question>>>());
          final rows = await stream.first;
          expect(rows, hasLength(1));
          expect(
            rows.single,
            Question(
              id: _question.id,
              question: _question.question,
              hint: _question.hint,
              topicId: _question.topic.id,
            ),
          );
        });
      });
    });
  });
}
