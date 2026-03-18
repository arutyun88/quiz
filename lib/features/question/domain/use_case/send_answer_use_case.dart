import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/app/core/services/connectivity_service.dart';
import 'package:quiz/features/question/domain/entity/answer_result_entity.dart';
import 'package:quiz/features/question/domain/entity/answered_question_entity.dart';
import 'package:quiz/features/question/domain/repository/answer_repository.dart';
import 'package:quiz/features/question/domain/service/cached_question_service.dart';

abstract interface class SendAnswerUseCase {
  Future<Result<AnswerResultEntity?, Failure>> send(AnsweredQuestionEntity value);
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
  Future<Result<AnswerResultEntity?, Failure>> send(AnsweredQuestionEntity value) async {
    final hasInternet = await _connectivityService.hasInternetConnection();

    if (_tokenService.accessToken == null || !hasInternet) {
      final cachedResult = await _markAsCached(value);
      return switch (cachedResult) {
        ResultOk() => Result.ok(null),
        ResultFailed(error: final failure) => Result.failed(failure),
      };
    }

    final result = await _answerRepository.send(
      questionId: value.questionId,
      answerId: value.answerId,
    );

    switch (result) {
      case ResultOk():
        await _cachedQuestionService.deleteById(value.questionId);
        return result;
      case ResultFailed(error: final failure):
        if (failure is NetworkFailure) {
          final cachedResult = await _markAsCached(value);
          return switch (cachedResult) {
            ResultOk() => result,
            ResultFailed(error: final failure) => Result.failed(failure),
          };
        }
        return Result.failed(failure);
    }
  }

  Future<Result<void, Failure>> _markAsCached(AnsweredQuestionEntity answer) async {
    final result = await _cachedQuestionService.markAsAnswered(answer);

    return switch (result) {
      ResultOk() => Result.ok(null),
      ResultFailed(error: final failure) => Result.failed(failure),
    };
  }
}
