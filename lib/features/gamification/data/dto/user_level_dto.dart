import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_level_dto.freezed.dart';
part 'user_level_dto.g.dart';

@freezed
class UserLevelDto with _$UserLevelDto {
  const factory UserLevelDto({
    @JsonKey(defaultValue: 1) required int level,
    @JsonKey(defaultValue: 0) required int experience,
    @JsonKey(defaultValue: 0) required int totalPoints,
    @JsonKey(defaultValue: 0) required int questionsAnswered,
    @JsonKey(defaultValue: 0) required int correctAnswers,
    @JsonKey(defaultValue: 0.0) required double accuracy,
    @JsonKey(defaultValue: 0) required int streakDays,
  }) = _UserLevelDto;

  factory UserLevelDto.fromJson(Map<String, dynamic> json) => _$UserLevelDtoFromJson(json);
}
