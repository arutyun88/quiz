// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/features/user/data/dto/age_access_dto.dart';
import 'package:quiz/features/user/data/dto/subscription_dto.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    String? email,
    String? name,
    @JsonKey(name: 'age_access') AgeAccessDto? ageAccess,
    @JsonKey(name: 'timezone_id') String? timezoneId,
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
    @Default(1000) int rating,
    @JsonKey(name: 'best_rating') @Default(1000) int bestRating,
    @JsonKey(name: 'rating_official_answers')
    @Default(0)
    int ratingOfficialAnswers,
    @JsonKey(name: 'rating_provisional') @Default(true) bool ratingProvisional,
    SubscriptionDto? subscription,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
