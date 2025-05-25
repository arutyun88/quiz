import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/database/dao/answered_question_dao.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/features/question/domain/entity/question_state_entity.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';

abstract interface class CheckQuestionStateUseCase {
  Future<Result<QuestionStateEntity, Failure>> checkById(String id);
}

@Injectable(as: CheckQuestionStateUseCase)
class CheckQuestionStateUseCaseImpl implements CheckQuestionStateUseCase {
  final QuestionRepository _questionRepository;
  final AuthTokenService _tokenService;
  final AnsweredQuestionDao _answeredQuestionDao;

  CheckQuestionStateUseCaseImpl({
    required QuestionRepository questionRepository,
    required AuthTokenService tokenService,
    required AnsweredQuestionDao answeredQuestionDao,
  })  : _questionRepository = questionRepository,
        _tokenService = tokenService,
        _answeredQuestionDao = answeredQuestionDao;

  @override
  Future<Result<QuestionStateEntity, Failure>> checkById(String id) async {
    if (_tokenService.accessToken == null) {
      final question = await _answeredQuestionDao.checkQuestionStateById(id);
      return switch (question) {
        ResultOk(data: final isAnswered) => Result.ok(
            QuestionStateEntity(
              questionId: id,
              isAnswered: isAnswered,
            ),
          ),
        ResultFailed(error: final failure) => Result.failed(failure)
      };
    }

    final question = await _questionRepository.checkQuestionStateById(id);
    switch (question) {
      case ResultOk(data: final question):
        return Result.ok(question);
      case ResultFailed(:final error):
        return Result.failed(error);
    }
  }
}
