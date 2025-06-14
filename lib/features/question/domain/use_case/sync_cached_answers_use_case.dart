import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/domain/repository/answer_repository.dart';
import 'package:quiz/features/question/domain/service/cached_question_service.dart';

abstract interface class SyncCachedAnswersUseCase {
  Future<Result<void, Failure>> sync();
}

@Injectable(as: SyncCachedAnswersUseCase)
class SyncCachedAnswersUseCaseImpl implements SyncCachedAnswersUseCase {
  final CachedQuestionService _cachedQuestionService;
  final AnswerRepository _answerRepository;

  SyncCachedAnswersUseCaseImpl({
    required CachedQuestionService cachedQuestionService,
    required AnswerRepository answerRepository,
  })  : _cachedQuestionService = cachedQuestionService,
        _answerRepository = answerRepository;

  @override
  Future<Result<void, Failure>> sync() async {
    final answers = await _cachedQuestionService.fetchAllCachedAnsweredQuestions();

    switch (answers) {
      case ResultOk(:final data) when data.isNotEmpty:
        final result = await _answerRepository.sendAllAnswered(data);
        if (result case ResultOk()) {
          await _cachedQuestionService.clear();
          return Result.ok(null);
        }
      default:
    }

    return Result.ok(null);
  }
}
