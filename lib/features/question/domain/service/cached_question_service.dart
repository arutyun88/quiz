import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/database/dao/answered_question_dao.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/domain/entity/answered_question_entity.dart';

abstract class CachedQuestionService {
  Future<Result<void, Failure>> markAsAnswered(AnsweredQuestionEntity value);

  Future<Result<void, Failure>> deleteById(String id);

  Future<Result<List<AnsweredQuestionEntity>, Failure>> fetchAllCachedAnsweredQuestions();
}

@Injectable(as: CachedQuestionService)
class CachedQuestionServiceImpl implements CachedQuestionService {
  final QuestionDao _questionDao;
  final AnsweredQuestionDao _answeredQuestionDao;

  const CachedQuestionServiceImpl({
    required AppDatabase database,
    required QuestionDao questionDao,
    required AnsweredQuestionDao answeredQuestionDao,
  })  : _questionDao = questionDao,
        _answeredQuestionDao = answeredQuestionDao;

  @override
  Future<Result<void, Failure>> markAsAnswered(AnsweredQuestionEntity value) async {
    try {
      final answered = await _answeredQuestionDao.save(value);
      final question = await _questionDao.removeById(value.questionId);

      if (answered is ResultFailed) {
        throw answered.error;
      }

      if (question is ResultFailed) {
        throw question.error;
      }

      return Result.ok(null);
    } on Failure catch (error) {
      return Result.failed(error);
    } catch (_) {
      return Result.failed(Failure.question(QuestionFailureReason.markAsAnswered()));
    }
  }

  @override
  Future<Result<void, Failure>> deleteById(String id) async {
    try {
      final question = await _questionDao.removeById(id);

      if (question is ResultFailed) {
        throw question.error;
      }

      return Result.ok(null);
    } on Failure catch (error) {
      return Result.failed(error);
    } catch (_) {
      return Result.failed(Failure.question(QuestionFailureReason.markAsAnswered()));
    }
  }

  @override
  Future<Result<List<AnsweredQuestionEntity>, Failure>> fetchAllCachedAnsweredQuestions() async {
    return await _answeredQuestionDao.getAllAnsweredQuestions();
  }
}
