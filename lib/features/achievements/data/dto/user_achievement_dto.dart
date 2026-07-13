import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_achievement_dto.freezed.dart';
part 'user_achievement_dto.g.dart';

@freezed
class UserAchievementDto with _$UserAchievementDto {
  const factory UserAchievementDto({
    required String id,
    required String name,
    required String description,
    required String category,
    int? points,
    @Default(false) bool unlocked,
    @JsonKey(name: 'unlocked_at') DateTime? unlockedAt,
    @JsonKey(name: 'progress_current') int? progressCurrent,
    @JsonKey(name: 'progress_target') int? progressTarget,
  }) = _UserAchievementDto;

  factory UserAchievementDto.fromJson(Map<String, dynamic> json) => _$UserAchievementDtoFromJson(json);
}
