import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/domain/entity/user_statistics_entity.dart';

abstract interface class UserStatisticsRepository {
  Future<Result<UserStatisticsEntity, Failure>> fetch();
}
