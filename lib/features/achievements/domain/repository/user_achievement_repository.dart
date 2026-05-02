import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/achievements/domain/entity/user_achievement_entity.dart';

abstract interface class UserAchievementRepository {
  Future<Result<PageEntity<UserAchievementEntity>, Failure>> fetch();

  Future<Result<PageEntity<UserAchievementEntity>, Failure>> fetchByUserId(String userId);
}
