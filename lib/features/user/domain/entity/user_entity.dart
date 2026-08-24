import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/features/user/domain/entity/age_access_entity.dart';
import 'package:quiz/features/user/domain/entity/subscription_entity.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String? email,
    required String? name,
    AgeAccessEntity? ageAccess,
    String? timezoneId,
    required int level,
    required int experienceInLevel,
    required int levelExperience,
    required int streakDays,
    required int bestStreakDays,
    required int questionsAnswered,
    required int correctAnswers,
    required double accuracy,
    required int totalPoints,
    required DateTime memberSince,
    required int achievementsUnlocked,
    required int achievementsTotal,
    @Default(1000) int rating,
    @Default(1000) int bestRating,
    @Default(0) int ratingOfficialAnswers,
    @Default(true) bool ratingProvisional,
    SubscriptionEntity? subscription,
  }) = _UserEntity;
}
