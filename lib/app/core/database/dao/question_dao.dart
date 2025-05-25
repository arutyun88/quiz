import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/data/converter/question_db_converter.dart';
import 'package:quiz/app/core/database/schema/answer.dart';
import 'package:quiz/app/core/database/schema/question.dart';
import 'package:quiz/features/question/data/table/question_db_model.dart';
import 'package:quiz/app/core/database/schema/topic.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';

part 'question_dao.g.dart';

abstract interface class QuestionDao {
  Future<Result<QuestionEntity, Failure>> getRandomQuestion();

  Future<Result<QuestionEntity, Failure>> getQuestionById(String id);

  Future<Result<void, Failure>> save(List<QuestionEntity> questionList);

  Future<Result<void, Failure>> clearAllCache();

  Stream<int> watchQuestionsCount();

  Stream<List<Question>> watchAllQuestions();
}

@DriftAccessor(tables: [Questions, Answers, Topics])
@Injectable(as: QuestionDao)
class QuestionDaoImpl extends DatabaseAccessor<AppDatabase> with _$QuestionDaoImplMixin implements QuestionDao {
  final QuestionDbConverter _questionConverter;
  QuestionDaoImpl(
    super.attachedDatabase, {
    required QuestionDbConverter questionConverter,
  }) : _questionConverter = questionConverter;

  @override
  Future<Result<QuestionEntity, Failure>> getRandomQuestion() async {
    final id = await customSelect(
      'SELECT id FROM questions ORDER BY RANDOM() LIMIT 1',
    ).map((row) => row.read<String>('id')).getSingleOrNull();

    if (id == null) {
      return Result.failed(Failure.question(QuestionFailureReason.notFoundCached()));
    }

    return getQuestionById(id);
  }

  @override
  Future<Result<QuestionEntity, Failure>> getQuestionById(String id) async {
    final query = select(questions).join([
      innerJoin(topics, topics.id.equalsExp(questions.topicId)),
    ])
      ..where(questions.id.equals(id));

    final result = await query.getSingleOrNull();

    final questionAnswers = await (select(answers)..where((answer) => answer.questionId.equals(id))).get();

    if (result == null || questionAnswers.isEmpty) {
      return Result.failed(Failure.question(QuestionFailureReason.notFoundCached()));
    }

    final question = QuestionDbModel(
      question: result.readTable(questions),
      topic: result.readTable(topics),
      answers: questionAnswers,
    );

    return Result.ok(_questionConverter.toEntity(question));
  }

  @override
  Future<Result<void, Failure>> save(List<QuestionEntity> questionList) async {
    try {
      return await transaction(() async {
        final questionsModels = _questionConverter.toDaoMultiple(questionList);

        await batch(
          (batch) => batch.insertAllOnConflictUpdate(
            questions,
            questionsModels.map((question) => question.question),
          ),
        );
        await batch(
          (batch) => batch.insertAllOnConflictUpdate(
            topics,
            questionsModels.map((question) => question.topic),
          ),
        );
        await batch(
          (batch) => batch.insertAllOnConflictUpdate(
            answers,
            questionsModels.expand((question) => question.answers),
          ),
        );

        return Result.ok(null);
      });
    } catch (_) {
      return Result.failed(Failure.question(QuestionFailureReason.save()));
    }
  }

  @override
  Future<Result<void, Failure>> clearAllCache() async {
    try {
      return await transaction(() async {
        await delete(answers).go();
        await delete(questions).go();
        await delete(topics).go();

        return Result.ok(null);
      });
    } catch (_) {
      return Result.failed(Failure.question(QuestionFailureReason.clearCache()));
    }
  }

  @override
  Stream<int> watchQuestionsCount() {
    return (selectOnly(questions)..addColumns([questions.id.count()]))
        .watchSingle()
        .map((row) => row.read(questions.id.count()) ?? 0);
  }

  @override
  Stream<List<Question>> watchAllQuestions() {
    return select(questions).watch();
  }
}
