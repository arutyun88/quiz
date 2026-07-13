import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_achievement_entity.freezed.dart';

@freezed
class UserAchievementEntity with _$UserAchievementEntity {
  const factory UserAchievementEntity({
    required String id,
    required String name,
    required String description,
    required String category,
    required bool unlocked,
    int? points,
    DateTime? unlockedAt,
    int? progressCurrent,
    int? progressTarget,
  }) = _UserAchievementEntity;
}
