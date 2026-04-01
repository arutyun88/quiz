import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/database/dao/answered_question_dao.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/data/converter/answered_question_db_converter.dart';
import 'package:quiz/features/question/domain/entity/answered_question_entity.dart';

final _answeredDateTime = DateTime.utc(2026, 3, 25, 7, 3, 33);
final _answeredQuestion = AnsweredQuestionEntity(
  questionId: 'q1',
  question: '2+2?',
  answerId: 'a2',
  answer: '4',
  answeredAt: _answeredDateTime,
);

void main() {
  late AppDatabase database;
  late AnsweredQuestionDao dao;

  setUp(() async {
    database = AppDatabase(
      executor: DatabaseConnection(
        NativeDatabase.memory(),
        closeStreamsSynchronously: true,
      ).executor,
    );

    dao = AnsweredQuestionDaoImpl(
      database,
      answeredQuestionDbConverter: AnsweredQuestionDbConverterImpl(),
    );
  });

  tearDown(() async {
    await database.close();
  });

  group('AnsweredQuestionDao', () {
    group('when database is empty', () {
      test('watchAnsweredQuestionsCount returns 0', () async {
        final stream = dao.watchAnsweredQuestionsCount();

        expect(stream, isA<Stream<int>>());
        expect(await stream.first, 0);
      });

      test('watchAnsweredQuestions returns empty list', () async {
        final stream = dao.watchAnsweredQuestions();

        expect(stream, isA<Stream<List<AnsweredQuestion>>>());
        expect(await stream.first, isEmpty);
      });

      test('checkQuestionStateById returns false', () async {
        final result = await dao.checkQuestionStateById('q1');

        expect(result, isA<ResultOk<bool, Failure>>());
        expect((result as ResultOk<bool, Failure>).data, false);
      });

      test('getAllAnsweredQuestions returns empty list', () async {
        final result = await dao.getAllAnsweredQuestions();

        expect(result, isA<ResultOk<List<AnsweredQuestionEntity>, Failure>>());
        expect((result as ResultOk<List<AnsweredQuestionEntity>, Failure>).data, isEmpty);
      });
    });

    group('when database is not empty', () {
      test('save returns ok', () async {
        final result = await dao.save(_answeredQuestion);

        expect(result, isA<ResultOk<void, Failure>>());
      });

      group('when answered question is saved', () {
        setUp(() async {
          await dao.save(_answeredQuestion);
        });

        test('watchAnsweredQuestionsCount returns 1', () async {
          final stream = dao.watchAnsweredQuestionsCount();

          expect(stream, isA<Stream<int>>());
          expect(await stream.first, 1);
        });

        test('watchAnsweredQuestions returns list with one item', () async {
          final stream = dao.watchAnsweredQuestions();

          expect(stream, isA<Stream<List<AnsweredQuestion>>>());
          final rows = await stream.first;
          expect(rows, hasLength(1));
          expect(
            rows.single,
            AnsweredQuestion(
              questionId: _answeredQuestion.questionId,
              question: _answeredQuestion.question,
              answerId: _answeredQuestion.answerId,
              answer: _answeredQuestion.answer,
              answeredAt: _answeredDateTime,
            ),
          );
        });

        test('checkQuestionStateById returns true', () async {
          final result = await dao.checkQuestionStateById('q1');

          expect(result, isA<ResultOk<bool, Failure>>());
          expect((result as ResultOk<bool, Failure>).data, true);
        });

        test('getAllAnsweredQuestions returns list with answered question', () async {
          final result = await dao.getAllAnsweredQuestions();

          expect(result, isA<ResultOk<List<AnsweredQuestionEntity>, Failure>>());
          expect((result as ResultOk<List<AnsweredQuestionEntity>, Failure>).data, hasLength(1));
          expect((result).data.first, _answeredQuestion);
        });

        test('clearAllCache returns ok and clears all answered questions', () async {
          final result = await dao.clearAllCache();

          expect(result, isA<ResultOk<void, Failure>>());

          final getAllResult = await dao.getAllAnsweredQuestions();
          expect(getAllResult, isA<ResultOk<List<AnsweredQuestionEntity>, Failure>>());
          expect((getAllResult as ResultOk<List<AnsweredQuestionEntity>, Failure>).data, isEmpty);
        });
      });
    });
  });
}
