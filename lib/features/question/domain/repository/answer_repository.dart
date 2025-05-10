import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/question/domain/entity/answered_statistics_entity.dart';
import 'package:quiz/features/user/domain/entity/user_statistics_entity.dart';

abstract interface class AnswerRepository {
  Stream<UserStatisticsEntity> get statistics;

  Future<Result<AnsweredStatisticsEntity, Failure>> send({
    required String questionId,
    required String answerId,
  });
}
