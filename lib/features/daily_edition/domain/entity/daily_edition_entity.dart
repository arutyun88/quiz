import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_edition_entity.freezed.dart';

enum DailyRunStatus {
  inProgress,
  completed,
  abandoned,
  expired,
  systemProtected,
  unknown,
}

enum DailyAssignmentKind {
  main,
  bonus,
  review,
  unknown,
}

enum DailyAttemptAction {
  answer,
  skip,
  unknown;

  String get apiValue => switch (this) {
        DailyAttemptAction.answer => 'ANSWER',
        DailyAttemptAction.skip => 'SKIP',
        DailyAttemptAction.unknown =>
          throw StateError('Unknown attempt action cannot be submitted'),
      };
}

enum DailyContinuationAction {
  completeMain,
  playQuestion,
  watchRewarded,
  waitForRewarded,
  limitReached,
  closed,
  unknown,
}

@freezed
class DailyContinuationEntity with _$DailyContinuationEntity {
  const factory DailyContinuationEntity({
    required String runId,
    required DateTime serverTime,
    required DateTime closesAt,
    required DailyContinuationAction nextAction,
    required bool quizPlus,
    required int bonusQuestionsGranted,
    required int bonusQuestionsServed,
    required int bonusQuestionsRemaining,
    required int questionsPerReward,
    required int rewardedVideosUsed,
    required int rewardedVideosMax,
    required int rewardedVideosRemaining,
    required int rollingVideosUsed,
    required int rollingVideosMax,
    required bool rewardedAdAvailable,
    required DateTime? rewardedAdNextAvailableAt,
  }) = _DailyContinuationEntity;
}

@freezed
class DailyRunEntity with _$DailyRunEntity {
  const factory DailyRunEntity({
    required String runId,
    required String editionDate,
    required DailyRunStatus status,
    required DateTime closesAt,
    required DateTime graceEndsAt,
    required int requiredCount,
    required int resolvedCount,
    required int ratingAtOpen,
    required DailyContinuationEntity continuation,
  }) = _DailyRunEntity;
}

@freezed
class DailyAssignmentAnswerEntity with _$DailyAssignmentAnswerEntity {
  const factory DailyAssignmentAnswerEntity({
    required String id,
    required String? text,
  }) = _DailyAssignmentAnswerEntity;
}

@freezed
class DailyAssignmentEntity with _$DailyAssignmentEntity {
  const factory DailyAssignmentEntity({
    required String assignmentId,
    required String questionId,
    required String questionVersionId,
    required int position,
    required DailyAssignmentKind kind,
    required String? topic,
    required String? text,
    required List<DailyAssignmentAnswerEntity> answers,
    required bool hintUsed,
  }) = _DailyAssignmentEntity;
}

@freezed
class PartnerRecommendationEntity with _$PartnerRecommendationEntity {
  const factory PartnerRecommendationEntity({
    required String campaignId,
    required String disclosure,
    required String title,
    required String body,
    required String cta,
    required String url,
  }) = _PartnerRecommendationEntity;
}

@freezed
class DailyAttemptEntity with _$DailyAttemptEntity {
  const factory DailyAttemptEntity({
    required String clientEventId,
    required String attemptId,
    required String assignmentId,
    required String questionVersionId,
    required DailyAttemptAction action,
    required bool isCorrect,
    required String? answerId,
    required String? correctAnswerId,
    required String? description,
    required bool hintUsed,
    required int xpAwarded,
    required int? ratingBefore,
    required int? ratingAfter,
    required int? ratingDelta,
    required bool provisional,
    required bool runCompleted,
    required PartnerRecommendationEntity? partner,
  }) = _DailyAttemptEntity;
}

@freezed
class DailyHintEntity with _$DailyHintEntity {
  const factory DailyHintEntity({
    required String assignmentId,
    required String? hint,
  }) = _DailyHintEntity;
}

@freezed
class DailySummaryEntity with _$DailySummaryEntity {
  const factory DailySummaryEntity({
    required String runId,
    required String editionDate,
    required DailyRunStatus status,
    required int requiredCount,
    required int resolvedCount,
    required int correctCount,
    required int skippedCount,
    required int hintCount,
    required int answerXp,
    required int completionXp,
    required int totalXp,
    required int bonusGranted,
    required int bonusServed,
    int? ratingBefore,
    int? ratingAfter,
    int? ratingDelta,
    double? accuracy,
    double? percentile,
    int? streakBefore,
    int? streakAfter,
    int? streakDelta,
    int? seasonRankBefore,
    int? seasonRankAfter,
    int? seasonRankDelta,
    required DailyContinuationEntity continuation,
  }) = _DailySummaryEntity;
}
