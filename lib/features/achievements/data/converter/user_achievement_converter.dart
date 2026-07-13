import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_page_converter.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/achievements/data/dto/user_achievement_dto.dart';
import 'package:quiz/features/achievements/domain/entity/user_achievement_entity.dart';

typedef UserAchievementPageConverter = DataPageConverter<UserAchievementEntity, UserAchievementDto>;
typedef UserAchievementConverter = DtoConverter<UserAchievementEntity, UserAchievementDto>;

@Injectable(as: UserAchievementConverter)
final class UserAchievementConverterImpl extends UserAchievementConverter {
  @override
  UserAchievementEntity convert(UserAchievementDto dto) {
    return UserAchievementEntity(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      category: dto.category,
      unlocked: dto.unlocked,
      points: dto.points,
      unlockedAt: dto.unlockedAt,
      progressCurrent: dto.progressCurrent,
      progressTarget: dto.progressTarget,
    );
  }
}
