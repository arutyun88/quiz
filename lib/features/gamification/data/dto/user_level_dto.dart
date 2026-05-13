import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_level_dto.freezed.dart';
part 'user_level_dto.g.dart';

@freezed
class UserLevelDto with _$UserLevelDto {
  const factory UserLevelDto({
    @JsonKey(defaultValue: 1) required int level,
    @JsonKey(defaultValue: 0) required int experience,
    @JsonKey(name: 'total_points', defaultValue: 0) required int totalPoints,
    @JsonKey(name: 'questions_answered', defaultValue: 0) required int questionsAnswered,
    @JsonKey(name: 'correct_answers', defaultValue: 0) required int correctAnswers,
    @JsonKey(defaultValue: 0.0) required double accuracy,
    @JsonKey(name: 'streak_days', defaultValue: 0) required int streakDays,
  }) = _UserLevelDto;

  factory UserLevelDto.fromJson(Map<String, dynamic> json) => _$UserLevelDtoFromJson(json);
}
