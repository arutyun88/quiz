import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/database/schema/answered_question.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';

part 'answered_question_dao.g.dart';

abstract interface class AnsweredQuestionDao {
  Stream<int> watchAnsweredQuestionsCount();

  Stream<List<AnsweredQuestion>> watchAnsweredQuestions();

  Future<Result<bool, Failure>> checkQuestionStateById(String id);
}

@DriftAccessor(tables: [AnsweredQuestions])
@Injectable(as: AnsweredQuestionDao)
class AnsweredQuestionDaoImpl extends DatabaseAccessor<AppDatabase>
    with _$AnsweredQuestionDaoImplMixin
    implements AnsweredQuestionDao {
  AnsweredQuestionDaoImpl(super.attachedDatabase);

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
      return Result.ok(result?.isCorrect ?? true);
    } catch (_) {
      return Result.failed(Failure.question(QuestionFailureReason.checkState()));
    }
  }
}
