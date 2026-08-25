// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_edition_dto.freezed.dart';
part 'daily_edition_dto.g.dart';

@freezed
class DailyOpenDto with _$DailyOpenDto {
  const factory DailyOpenDto({
    @JsonKey(name: 'run_id') required String runId,
    @JsonKey(name: 'edition_date') required String editionDate,
    required String status,
    @JsonKey(name: 'closes_at') required DateTime closesAt,
    @JsonKey(name: 'grace_ends_at') required DateTime graceEndsAt,
    @JsonKey(name: 'required_count') required int requiredCount,
    @JsonKey(name: 'resolved_count') required int resolvedCount,
    @JsonKey(name: 'rating_at_open') required int ratingAtOpen,
  }) = _DailyOpenDto;

  factory DailyOpenDto.fromJson(Map<String, dynamic> json) =>
      _$DailyOpenDtoFromJson(json);
}

@freezed
class DailyAssignmentAnswerDto with _$DailyAssignmentAnswerDto {
  const factory DailyAssignmentAnswerDto({
    required String id,
    String? text,
  }) = _DailyAssignmentAnswerDto;

  factory DailyAssignmentAnswerDto.fromJson(Map<String, dynamic> json) =>
      _$DailyAssignmentAnswerDtoFromJson(json);
}

@freezed
class DailyAssignmentDto with _$DailyAssignmentDto {
  const factory DailyAssignmentDto({
    @JsonKey(name: 'assignment_id') required String assignmentId,
    @JsonKey(name: 'question_id') required String questionId,
    @JsonKey(name: 'question_version_id') required String questionVersionId,
    required int position,
    required String kind,
    String? topic,
    String? text,
    required List<DailyAssignmentAnswerDto> answers,
    @JsonKey(name: 'hint_used') required bool hintUsed,
  }) = _DailyAssignmentDto;

  factory DailyAssignmentDto.fromJson(Map<String, dynamic> json) =>
      _$DailyAssignmentDtoFromJson(json);
}

@freezed
class PartnerRecommendationDto with _$PartnerRecommendationDto {
  const factory PartnerRecommendationDto({
    @JsonKey(name: 'campaign_id') required String campaignId,
    required String disclosure,
    required String title,
    required String body,
    required String cta,
    required String url,
  }) = _PartnerRecommendationDto;

  factory PartnerRecommendationDto.fromJson(Map<String, dynamic> json) =>
      _$PartnerRecommendationDtoFromJson(json);
}

@freezed
class DailyAttemptDto with _$DailyAttemptDto {
  const factory DailyAttemptDto({
    @JsonKey(name: 'client_event_id') required String clientEventId,
    @JsonKey(name: 'attempt_id') required String attemptId,
    @JsonKey(name: 'assignment_id') required String assignmentId,
    @JsonKey(name: 'question_version_id') required String questionVersionId,
    required String action,
    required bool correct,
    @JsonKey(name: 'answer_id') String? answerId,
    @JsonKey(name: 'correct_answer_id') String? correctAnswerId,
    String? description,
    @JsonKey(name: 'hint_used') required bool hintUsed,
    @JsonKey(name: 'xp_awarded') required int xpAwarded,
    @JsonKey(name: 'rating_before') int? ratingBefore,
    @JsonKey(name: 'rating_after') int? ratingAfter,
    @JsonKey(name: 'rating_delta') int? ratingDelta,
    required bool provisional,
    @JsonKey(name: 'run_completed') required bool runCompleted,
    PartnerRecommendationDto? partner,
  }) = _DailyAttemptDto;

  factory DailyAttemptDto.fromJson(Map<String, dynamic> json) =>
      _$DailyAttemptDtoFromJson(json);
}

@freezed
class DailyAttemptRequestDto with _$DailyAttemptRequestDto {
  const factory DailyAttemptRequestDto({
    @JsonKey(name: 'client_event_id') required String clientEventId,
    @JsonKey(name: 'assignment_id') required String assignmentId,
    required String action,
    @JsonKey(name: 'answer_id', includeIfNull: false) String? answerId,
  }) = _DailyAttemptRequestDto;

  factory DailyAttemptRequestDto.fromJson(Map<String, dynamic> json) =>
      _$DailyAttemptRequestDtoFromJson(json);
}

@freezed
class DailyHintDto with _$DailyHintDto {
  const factory DailyHintDto({
    @JsonKey(name: 'assignment_id') required String assignmentId,
    String? hint,
  }) = _DailyHintDto;

  factory DailyHintDto.fromJson(Map<String, dynamic> json) =>
      _$DailyHintDtoFromJson(json);
}

@freezed
class DailySummaryDto with _$DailySummaryDto {
  const factory DailySummaryDto({
    @JsonKey(name: 'run_id') required String runId,
    @JsonKey(name: 'edition_date') required String editionDate,
    required String status,
    @JsonKey(name: 'required_count') required int requiredCount,
    @JsonKey(name: 'resolved_count') required int resolvedCount,
    @JsonKey(name: 'correct_count') required int correctCount,
    @JsonKey(name: 'skipped_count') required int skippedCount,
    @JsonKey(name: 'hint_count') required int hintCount,
    @JsonKey(name: 'answer_xp') required int answerXp,
    @JsonKey(name: 'completion_xp') required int completionXp,
    @JsonKey(name: 'total_xp') required int totalXp,
    @JsonKey(name: 'bonus_granted') required int bonusGranted,
    @JsonKey(name: 'bonus_served') required int bonusServed,
  }) = _DailySummaryDto;

  factory DailySummaryDto.fromJson(Map<String, dynamic> json) =>
      _$DailySummaryDtoFromJson(json);
}

@freezed
class RewardedAdRequestDto with _$RewardedAdRequestDto {
  const factory RewardedAdRequestDto({
    @JsonKey(name: 'client_event_id') required String clientEventId,
    @JsonKey(name: 'provider_event_id') required String providerEventId,
    @JsonKey(name: 'verification_token') required String verificationToken,
  }) = _RewardedAdRequestDto;

  factory RewardedAdRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RewardedAdRequestDtoFromJson(json);
}

@freezed
class RewardedAdDto with _$RewardedAdDto {
  const factory RewardedAdDto({
    @JsonKey(name: 'client_event_id') required String clientEventId,
    @JsonKey(name: 'granted_questions') required int grantedQuestions,
  }) = _RewardedAdDto;

  factory RewardedAdDto.fromJson(Map<String, dynamic> json) =>
      _$RewardedAdDtoFromJson(json);
}
