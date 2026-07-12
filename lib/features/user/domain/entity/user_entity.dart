import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String? email,
    required String? name,
    required DateTime? birthDate,
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
  }) = _UserEntity;
}
