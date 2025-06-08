import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/app/core/services/connectivity_service.dart';
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
  final ConnectivityService _connectivityService;

  SendAnswerUseCaseImpl({
    required AnswerRepository answerRepository,
    required AuthTokenService tokenService,
    required CachedQuestionService cachedQuestionService,
    required ConnectivityService connectivityService,
  })  : _answerRepository = answerRepository,
        _tokenService = tokenService,
        _cachedQuestionService = cachedQuestionService,
        _connectivityService = connectivityService;

  @override
  Future<Result<bool, Failure>> send(AnsweredQuestionEntity value) async {
    final hasInternet = await _connectivityService.hasInternetConnection();

    if (_tokenService.accessToken == null || !hasInternet) {
      return await _markAsCached(value);
    }

    final result = await _answerRepository.send(
      questionId: value.questionId,
      answerId: value.answerId,
    );

    switch (result) {
      case ResultOk(data: final entity):
        await _cachedQuestionService.deleteById(value.questionId);
        return Result.ok(entity.lastIsCorrect);
      case ResultFailed(error: final failure):
        if (failure is NetworkFailure) {
          return await _markAsCached(value);
        }
        return Result.failed(failure);
    }
  }

  Future<Result<bool, Failure>> _markAsCached(AnsweredQuestionEntity answer) async {
    final result = await _cachedQuestionService.markAsAnswered(answer);

    return switch (result) {
      ResultOk() => Result.ok(answer.isCorrect),
      ResultFailed(error: final failure) => Result.failed(failure),
    };
  }
}
