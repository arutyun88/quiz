import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';

abstract interface class SendAnswerUseCase {
  Future<Result<void, Failure>> send();
}

@Injectable(as: SendAnswerUseCase)
class SendAnswerUseCaseImpl implements SendAnswerUseCase {
  final QuestionRepository _questionRepository;

  SendAnswerUseCaseImpl({
    required QuestionRepository questionRepository,
  }) : _questionRepository = questionRepository;

  @override
  Future<Result<void, Failure>> send() {
    // TODO: implement send
    throw UnimplementedError();
  }
}
