// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/features/user/data/dto/subscription_dto.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    String? email,
    String? name,
    @JsonKey(name: 'birth_date') DateTime? birthDate,
    required int level,
    @JsonKey(name: 'experience_in_level') required int experienceInLevel,
    @JsonKey(name: 'level_experience') required int levelExperience,
    @JsonKey(name: 'streak_days') required int streakDays,
    @JsonKey(name: 'best_streak_days') required int bestStreakDays,
    @JsonKey(name: 'questions_answered') required int questionsAnswered,
    @JsonKey(name: 'correct_answers') required int correctAnswers,
    required double accuracy,
    @JsonKey(name: 'total_points') required int totalPoints,
    @JsonKey(name: 'member_since') required DateTime memberSince,
    @JsonKey(name: 'achievements_unlocked') required int achievementsUnlocked,
    @JsonKey(name: 'achievements_total') required int achievementsTotal,
    SubscriptionDto? subscription,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}
