import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_achievement_entity.freezed.dart';

@freezed
class UserAchievementEntity with _$UserAchievementEntity {
  const factory UserAchievementEntity({
    required String id,
    required String name,
    required String description,
    required String category,
    int? points,
  }) = _UserAchievementEntity;
}
