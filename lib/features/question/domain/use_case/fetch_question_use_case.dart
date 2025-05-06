import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/domain/entity/question_entity.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';

abstract interface class FetchQuestionUseCase {
  Future<Result<QuestionEntity, Failure>> fetch();

  Future<Result<QuestionEntity, Failure>> fetchById(String id);
}

@Injectable(as: FetchQuestionUseCase)
class FetchQuestionUseCaseImpl implements FetchQuestionUseCase {
  final QuestionRepository _questionRepository;
  final QuestionDao _questionDao;

  FetchQuestionUseCaseImpl({
    required QuestionRepository questionRepository,
    required QuestionDao questionDao,
  })  : _questionRepository = questionRepository,
        _questionDao = questionDao;

  @override
  Future<Result<QuestionEntity, Failure>> fetch() async {
    final question = await _questionDao.getRandomQuestion();
    switch (question) {
      case ResultOk(data: final question):
        return Result.ok(question);
      case ResultFailed(error: final QuestionFailure failure)
          when failure.reason is QuestionFailureNotFoundCachedReason:
        final questions = await _questionRepository.fetch(limit: 10);
        switch (questions) {
          case ResultOk(:final data):
            await _questionDao.save(data.items);
            return await fetch();
          case ResultFailed(:final error):
            return Result.failed(error);
        }
      case ResultFailed(:final error):
        return Result.failed(error);
    }
  }

  @override
  Future<Result<QuestionEntity, Failure>> fetchById(String id) async {
    final question = await _questionDao.getQuestionById(id);
    switch (question) {
      case ResultOk(data: final question):
        return Result.ok(question);
      case ResultFailed(:final error):
        return Result.failed(error);
    }
  }
}
