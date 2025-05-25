import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/features/question/domain/entity/answered_question_entity.dart';
import 'package:quiz/features/question/domain/repository/answer_repository.dart';
import 'package:quiz/features/question/domain/service/cached_question_service.dart';

abstract interface class SendAnswerUseCase {
  Future<Result<bool, Failure>> send(AnsweredQuestionEntity value);
}

@Injectable(as: SendAnswerUseCase)
class SendAnswerUseCaseImpl implements SendAnswerUseCase {
  final AnswerRepository _answerRepository;
  final AuthTokenService _tokenService;
  final CachedQuestionService _cachedQuestionService;

  SendAnswerUseCaseImpl({
    required AnswerRepository answerRepository,
    required AuthTokenService tokenService,
    required CachedQuestionService cachedQuestionService,
  })  : _answerRepository = answerRepository,
        _tokenService = tokenService,
        _cachedQuestionService = cachedQuestionService;

  @override
  Future<Result<bool, Failure>> send(AnsweredQuestionEntity value) async {
    // Если сервер недоступен, сохранить локально,
    // и отправить ответы при следующем запуске или после восстановления соединения.
    // Возможно, стоит проверять наличие интернет соединения с internet_connectivity
    if (_tokenService.accessToken == null) {
      final result = await _cachedQuestionService.markAsAnswered(value);

      return switch (result) {
        ResultOk() => Result.ok(value.isCorrect),
        ResultFailed(error: final failure) => Result.failed(failure),
      };
    }

    final result = await _answerRepository.send(
      questionId: value.questionId,
      answerId: value.answerId,
    );

    switch (result) {
      case ResultOk(data: final entity):
        return Result.ok(entity.lastIsCorrect);
      case ResultFailed(error: final failure):
        return Result.failed(failure);
    }
  }
}
