import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/database/dao/answered_question_dao.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/domain/entity/answered_question_entity.dart';

abstract class CachedQuestionService {
  Future<Result<void, Failure>> markAsAnswered(AnsweredQuestionEntity value);
}

@Injectable(as: CachedQuestionService)
class CachedQuestionServiceImpl implements CachedQuestionService {
  final AppDatabase _database;
  final QuestionDao _questionDao;
  final AnsweredQuestionDao _answeredQuestionDao;

  const CachedQuestionServiceImpl({
    required AppDatabase database,
    required QuestionDao questionDao,
    required AnsweredQuestionDao answeredQuestionDao,
  })  : _database = database,
        _questionDao = questionDao,
        _answeredQuestionDao = answeredQuestionDao;

  @override
  Future<Result<void, Failure>> markAsAnswered(AnsweredQuestionEntity value) async {
    try {
      return await _database.transaction(() async {
        final answered = await _answeredQuestionDao.save(value);
        final question = await _questionDao.removeById(value.questionId);
        if (answered is ResultOk && question is ResultOk) {
          return Result.ok(null);
        }
        return Result.failed(Failure.question(QuestionFailureReason.markAsAnswered()));
      });
    } catch (_) {
      return Result.failed(Failure.question(QuestionFailureReason.markAsAnswered()));
    }
  }
}
