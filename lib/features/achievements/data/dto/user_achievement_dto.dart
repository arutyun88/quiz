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
  }) = _UserAchievementDto;

  factory UserAchievementDto.fromJson(Map<String, dynamic> json) => _$UserAchievementDtoFromJson(json);
}
