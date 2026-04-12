import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/domain/entity/answer_result_entity.dart';
import 'package:quiz/features/question/domain/entity/answered_question_entity.dart';
import 'package:quiz/features/user/domain/entity/user_statistics_entity.dart';

abstract interface class AnswerRepository {
  Stream<UserStatisticsEntity> get statistics;

  Future<Result<AnswerResultEntity, Failure>> send({
    required String questionId,
    required String answerId,
  });

  Future<Result<UserStatisticsEntity, Failure>> sendAllAnswered(
    List<AnsweredQuestionEntity> answers,
  );
}
