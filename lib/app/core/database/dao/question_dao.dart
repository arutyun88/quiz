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
}
