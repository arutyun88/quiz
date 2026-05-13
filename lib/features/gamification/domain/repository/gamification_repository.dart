import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/gamification/domain/entity/user_level_entity.dart';

abstract interface class GamificationRepository {
  Future<Result<UserLevelEntity, Failure>> fetchLevel();
}
