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
  }) = _DailySummaryEntity;
}

@freezed
class RewardedAdEntity with _$RewardedAdEntity {
  const factory RewardedAdEntity({
    required String clientEventId,
    required int grantedQuestions,
  }) = _RewardedAdEntity;
}
