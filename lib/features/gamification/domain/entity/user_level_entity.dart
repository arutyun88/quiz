import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_level_entity.freezed.dart';

@freezed
class UserLevelEntity with _$UserLevelEntity {
  const factory UserLevelEntity({
    required int level,
    required int experience,
    required int totalPoints,
    required int questionsAnswered,
    required int correctAnswers,
    required double accuracy,
    required int streakDays,
    required StreakNoticeEntity? streakNotice,
  }) = _UserLevelEntity;
}

enum StreakNoticeType { freezeApplied, streakLost }

@freezed
class StreakNoticeEntity with _$StreakNoticeEntity {
  const factory StreakNoticeEntity({
    required StreakNoticeType type,
    required int freezesLeft,
    required int freezesTotal,
    required int lostStreakDays,
  }) = _StreakNoticeEntity;
}
