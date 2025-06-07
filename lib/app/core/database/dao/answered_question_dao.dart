import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/database/schema/answered_question.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/data/converter/answered_question_db_converter.dart';
import 'package:quiz/features/question/domain/entity/answered_question_entity.dart';

part 'answered_question_dao.g.dart';

abstract interface class AnsweredQuestionDao {
  Stream<int> watchAnsweredQuestionsCount();

  Stream<List<AnsweredQuestion>> watchAnsweredQuestions();

  Future<Result<bool, Failure>> checkQuestionStateById(String id);

  Future<Result<void, Failure>> save(AnsweredQuestionEntity entity);

  Future<Result<List<AnsweredQuestionEntity>, Failure>> getAllAnsweredQuestions();

  Future<Result<void, Failure>> clearAllCache();
}

@DriftAccessor(tables: [AnsweredQuestions])
@Injectable(as: AnsweredQuestionDao)
class AnsweredQuestionDaoImpl extends DatabaseAccessor<AppDatabase>
    with _$AnsweredQuestionDaoImplMixin
    implements AnsweredQuestionDao {
  final AnsweredQuestionDbConverter _answeredQuestionDbConverter;

  AnsweredQuestionDaoImpl(
    super.attachedDatabase, {
    required AnsweredQuestionDbConverter answeredQuestionDbConverter,
  }) : _answeredQuestionDbConverter = answeredQuestionDbConverter;

  @override
  Stream<int> watchAnsweredQuestionsCount() {
    return (selectOnly(answeredQuestions)..addColumns([answeredQuestions.questionId.count()]))
        .watchSingle()
        .map((row) => row.read(answeredQuestions.questionId.count()) ?? 0);
  }

  @override
  Stream<List<AnsweredQuestion>> watchAnsweredQuestions() {
    return select(answeredQuestions).watch();
  }

  @override
  Future<Result<bool, Failure>> checkQuestionStateById(String id) async {
    try {
      final query = select(answeredQuestions)..where((question) => question.questionId.equals(id));
      final result = (await query.getSingleOrNull());
      return Result.ok(result != null);
    } catch (_) {
      return Result.failed(Failure.question(QuestionFailureReason.checkState()));
    }
  }

  @override
  Future<Result<void, Failure>> save(AnsweredQuestionEntity entity) async {
    try {
      await into(answeredQuestions).insert(
        _answeredQuestionDbConverter.toDao(entity),
        mode: InsertMode.insertOrAbort,
      );
      return Result.ok(null);
    } catch (e) {
      if (e case DriftRemoteException(:final remoteCause)) {
        if (remoteCause case SqliteException(:final extendedResultCode)
            when extendedResultCode == 1555 || extendedResultCode == 2067) {
          return Result.failed(Failure.question(QuestionFailureReason.alreadySaved()));
        }
      }
      return Result.failed(Failure.question(QuestionFailureReason.save()));
    }
  }

  @override
  Future<Result<void, Failure>> clearAllCache() async {
    try {
      await delete(answeredQuestions).go();
      return Result.ok(null);
    } catch (_) {
      return Result.failed(Failure.question(QuestionFailureReason.clearCache()));
    }
  }

  @override
  Future<Result<List<AnsweredQuestionEntity>, Failure>> getAllAnsweredQuestions() async {
    try {
      final questions = await select(answeredQuestions).get();
      return Result.ok(
        _answeredQuestionDbConverter.toEntityMultiple(questions).toList(),
      );
    } catch (_) {
      return Result.failed(Failure.question(QuestionFailureReason.notFoundCached()));
    }
  }
}
