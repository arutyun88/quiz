// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_edition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyContinuationDtoImpl _$$DailyContinuationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyContinuationDtoImpl(
      runId: json['run_id'] as String,
      serverTime: DateTime.parse(json['server_time'] as String),
      closesAt: DateTime.parse(json['closes_at'] as String),
      nextAction: json['next_action'] as String,
      quizPlus: json['quiz_plus'] as bool,
      bonusQuestionsGranted: (json['bonus_questions_granted'] as num).toInt(),
      bonusQuestionsServed: (json['bonus_questions_served'] as num).toInt(),
      bonusQuestionsRemaining:
          (json['bonus_questions_remaining'] as num).toInt(),
      questionsPerReward: (json['questions_per_reward'] as num).toInt(),
      rewardedVideosUsed: (json['rewarded_videos_used'] as num).toInt(),
      rewardedVideosMax: (json['rewarded_videos_max'] as num).toInt(),
      rewardedVideosRemaining:
          (json['rewarded_videos_remaining'] as num).toInt(),
      rollingVideosUsed: (json['rolling_videos_used'] as num).toInt(),
      rollingVideosMax: (json['rolling_videos_max'] as num).toInt(),
      rewardedAdAvailable: json['rewarded_ad_available'] as bool,
      rewardedAdNextAvailableAt: json['rewarded_ad_next_available_at'] == null
          ? null
          : DateTime.parse(json['rewarded_ad_next_available_at'] as String),
    );

Map<String, dynamic> _$$DailyContinuationDtoImplToJson(
        _$DailyContinuationDtoImpl instance) =>
    <String, dynamic>{
      'run_id': instance.runId,
      'server_time': instance.serverTime.toIso8601String(),
      'closes_at': instance.closesAt.toIso8601String(),
      'next_action': instance.nextAction,
      'quiz_plus': instance.quizPlus,
      'bonus_questions_granted': instance.bonusQuestionsGranted,
      'bonus_questions_served': instance.bonusQuestionsServed,
      'bonus_questions_remaining': instance.bonusQuestionsRemaining,
      'questions_per_reward': instance.questionsPerReward,
      'rewarded_videos_used': instance.rewardedVideosUsed,
      'rewarded_videos_max': instance.rewardedVideosMax,
      'rewarded_videos_remaining': instance.rewardedVideosRemaining,
      'rolling_videos_used': instance.rollingVideosUsed,
      'rolling_videos_max': instance.rollingVideosMax,
      'rewarded_ad_available': instance.rewardedAdAvailable,
      'rewarded_ad_next_available_at':
          instance.rewardedAdNextAvailableAt?.toIso8601String(),
    };

_$DailyOpenDtoImpl _$$DailyOpenDtoImplFromJson(Map<String, dynamic> json) =>
    _$DailyOpenDtoImpl(
      runId: json['run_id'] as String,
      editionDate: json['edition_date'] as String,
      status: json['status'] as String,
      closesAt: DateTime.parse(json['closes_at'] as String),
      graceEndsAt: DateTime.parse(json['grace_ends_at'] as String),
      requiredCount: (json['required_count'] as num).toInt(),
      resolvedCount: (json['resolved_count'] as num).toInt(),
      ratingAtOpen: (json['rating_at_open'] as num).toInt(),
      continuation: DailyContinuationDto.fromJson(
          json['continuation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DailyOpenDtoImplToJson(_$DailyOpenDtoImpl instance) =>
    <String, dynamic>{
      'run_id': instance.runId,
      'edition_date': instance.editionDate,
      'status': instance.status,
      'closes_at': instance.closesAt.toIso8601String(),
      'grace_ends_at': instance.graceEndsAt.toIso8601String(),
      'required_count': instance.requiredCount,
      'resolved_count': instance.resolvedCount,
      'rating_at_open': instance.ratingAtOpen,
      'continuation': instance.continuation,
    };

_$DailyAssignmentAnswerDtoImpl _$$DailyAssignmentAnswerDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyAssignmentAnswerDtoImpl(
      id: json['id'] as String,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$DailyAssignmentAnswerDtoImplToJson(
        _$DailyAssignmentAnswerDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };

_$DailyAssignmentDtoImpl _$$DailyAssignmentDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyAssignmentDtoImpl(
      assignmentId: json['assignment_id'] as String,
      questionId: json['question_id'] as String,
      questionVersionId: json['question_version_id'] as String,
      position: (json['position'] as num).toInt(),
      kind: json['kind'] as String,
      topic: json['topic'] as String?,
      text: json['text'] as String?,
      answers: (json['answers'] as List<dynamic>)
          .map((e) =>
              DailyAssignmentAnswerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      hintUsed: json['hint_used'] as bool,
    );

Map<String, dynamic> _$$DailyAssignmentDtoImplToJson(
        _$DailyAssignmentDtoImpl instance) =>
    <String, dynamic>{
      'assignment_id': instance.assignmentId,
      'question_id': instance.questionId,
      'question_version_id': instance.questionVersionId,
      'position': instance.position,
      'kind': instance.kind,
      'topic': instance.topic,
      'text': instance.text,
      'answers': instance.answers,
      'hint_used': instance.hintUsed,
    };

_$PartnerRecommendationDtoImpl _$$PartnerRecommendationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PartnerRecommendationDtoImpl(
      campaignId: json['campaign_id'] as String,
      disclosure: json['disclosure'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      cta: json['cta'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PartnerRecommendationDtoImplToJson(
        _$PartnerRecommendationDtoImpl instance) =>
    <String, dynamic>{
      'campaign_id': instance.campaignId,
      'disclosure': instance.disclosure,
      'title': instance.title,
      'body': instance.body,
      'cta': instance.cta,
      'url': instance.url,
    };

_$DailyAttemptDtoImpl _$$DailyAttemptDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyAttemptDtoImpl(
      clientEventId: json['client_event_id'] as String,
      attemptId: json['attempt_id'] as String,
      assignmentId: json['assignment_id'] as String,
      questionVersionId: json['question_version_id'] as String,
      action: json['action'] as String,
      correct: json['correct'] as bool,
      answerId: json['answer_id'] as String?,
      correctAnswerId: json['correct_answer_id'] as String?,
      description: json['description'] as String?,
      hintUsed: json['hint_used'] as bool,
      xpAwarded: (json['xp_awarded'] as num).toInt(),
      ratingBefore: (json['rating_before'] as num?)?.toInt(),
      ratingAfter: (json['rating_after'] as num?)?.toInt(),
      ratingDelta: (json['rating_delta'] as num?)?.toInt(),
      provisional: json['provisional'] as bool,
      runCompleted: json['run_completed'] as bool,
      partner: json['partner'] == null
          ? null
          : PartnerRecommendationDto.fromJson(
              json['partner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DailyAttemptDtoImplToJson(
        _$DailyAttemptDtoImpl instance) =>
    <String, dynamic>{
      'client_event_id': instance.clientEventId,
      'attempt_id': instance.attemptId,
      'assignment_id': instance.assignmentId,
      'question_version_id': instance.questionVersionId,
      'action': instance.action,
      'correct': instance.correct,
      'answer_id': instance.answerId,
      'correct_answer_id': instance.correctAnswerId,
      'description': instance.description,
      'hint_used': instance.hintUsed,
      'xp_awarded': instance.xpAwarded,
      'rating_before': instance.ratingBefore,
      'rating_after': instance.ratingAfter,
      'rating_delta': instance.ratingDelta,
      'provisional': instance.provisional,
      'run_completed': instance.runCompleted,
      'partner': instance.partner,
    };

_$DailyAttemptRequestDtoImpl _$$DailyAttemptRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyAttemptRequestDtoImpl(
      clientEventId: json['client_event_id'] as String,
      assignmentId: json['assignment_id'] as String,
      action: json['action'] as String,
      answerId: json['answer_id'] as String?,
    );

Map<String, dynamic> _$$DailyAttemptRequestDtoImplToJson(
        _$DailyAttemptRequestDtoImpl instance) =>
    <String, dynamic>{
      'client_event_id': instance.clientEventId,
      'assignment_id': instance.assignmentId,
      'action': instance.action,
      if (instance.answerId case final value?) 'answer_id': value,
    };

_$DailyHintDtoImpl _$$DailyHintDtoImplFromJson(Map<String, dynamic> json) =>
    _$DailyHintDtoImpl(
      assignmentId: json['assignment_id'] as String,
      hint: json['hint'] as String?,
    );

Map<String, dynamic> _$$DailyHintDtoImplToJson(_$DailyHintDtoImpl instance) =>
    <String, dynamic>{
      'assignment_id': instance.assignmentId,
      'hint': instance.hint,
    };

_$DailySummaryDtoImpl _$$DailySummaryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DailySummaryDtoImpl(
      runId: json['run_id'] as String,
      editionDate: json['edition_date'] as String,
      status: json['status'] as String,
      requiredCount: (json['required_count'] as num).toInt(),
      resolvedCount: (json['resolved_count'] as num).toInt(),
      correctCount: (json['correct_count'] as num).toInt(),
      skippedCount: (json['skipped_count'] as num).toInt(),
      hintCount: (json['hint_count'] as num).toInt(),
      answerXp: (json['answer_xp'] as num).toInt(),
      completionXp: (json['completion_xp'] as num).toInt(),
      totalXp: (json['total_xp'] as num).toInt(),
      bonusGranted: (json['bonus_granted'] as num).toInt(),
      bonusServed: (json['bonus_served'] as num).toInt(),
      continuation: DailyContinuationDto.fromJson(
          json['continuation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DailySummaryDtoImplToJson(
        _$DailySummaryDtoImpl instance) =>
    <String, dynamic>{
      'run_id': instance.runId,
      'edition_date': instance.editionDate,
      'status': instance.status,
      'required_count': instance.requiredCount,
      'resolved_count': instance.resolvedCount,
      'correct_count': instance.correctCount,
      'skipped_count': instance.skippedCount,
      'hint_count': instance.hintCount,
      'answer_xp': instance.answerXp,
      'completion_xp': instance.completionXp,
      'total_xp': instance.totalXp,
      'bonus_granted': instance.bonusGranted,
      'bonus_served': instance.bonusServed,
      'continuation': instance.continuation,
    };

_$RewardedAdRequestDtoImpl _$$RewardedAdRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RewardedAdRequestDtoImpl(
      clientEventId: json['client_event_id'] as String,
      providerEventId: json['provider_event_id'] as String,
      verificationToken: json['verification_token'] as String,
    );

Map<String, dynamic> _$$RewardedAdRequestDtoImplToJson(
        _$RewardedAdRequestDtoImpl instance) =>
    <String, dynamic>{
      'client_event_id': instance.clientEventId,
      'provider_event_id': instance.providerEventId,
      'verification_token': instance.verificationToken,
    };

_$RewardedAdDtoImpl _$$RewardedAdDtoImplFromJson(Map<String, dynamic> json) =>
    _$RewardedAdDtoImpl(
      clientEventId: json['client_event_id'] as String,
      grantedQuestions: (json['granted_questions'] as num).toInt(),
      continuation: DailyContinuationDto.fromJson(
          json['continuation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RewardedAdDtoImplToJson(_$RewardedAdDtoImpl instance) =>
    <String, dynamic>{
      'client_event_id': instance.clientEventId,
      'granted_questions': instance.grantedQuestions,
      'continuation': instance.continuation,
    };
