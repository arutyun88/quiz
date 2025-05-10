import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/domain/entity/question_state_entity.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';

abstract interface class CheckQuestionStateUseCase {
  Future<Result<QuestionStateEntity, Failure>> checkById(String id);
}

@Injectable(as: CheckQuestionStateUseCase)
class CheckQuestionStateUseCaseImpl implements CheckQuestionStateUseCase {
  final QuestionRepository _questionRepository;

  CheckQuestionStateUseCaseImpl({
    required QuestionRepository questionRepository,
  }) : _questionRepository = questionRepository;

  @override
  Future<Result<QuestionStateEntity, Failure>> checkById(String id) async {
    final question = await _questionRepository.checkQuestionStateById(id);
    switch (question) {
      case ResultOk(data: final question):
        return Result.ok(question);
      case ResultFailed(:final error):
        return Result.failed(error);
    }
  }
}
