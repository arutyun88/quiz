import 'package:quiz/features/daily_edition/data/dto/daily_edition_dto.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';

extension DailyOpenDtoConverter on DailyOpenDto {
  DailyRunEntity toEntity() => DailyRunEntity(
        runId: runId,
        editionDate: editionDate,
        status: _runStatus(status),
        closesAt: closesAt,
        graceEndsAt: graceEndsAt,
        requiredCount: requiredCount,
        resolvedCount: resolvedCount,
        ratingAtOpen: ratingAtOpen,
        continuation: continuation.toEntity(),
      );
}

extension DailyContinuationDtoConverter on DailyContinuationDto {
  DailyContinuationEntity toEntity() => DailyContinuationEntity(
        runId: runId,
        serverTime: serverTime,
        closesAt: closesAt,
        nextAction: _continuationAction(nextAction),
        quizPlus: quizPlus,
        bonusQuestionsGranted: bonusQuestionsGranted,
        bonusQuestionsServed: bonusQuestionsServed,
        bonusQuestionsRemaining: bonusQuestionsRemaining,
        questionsPerReward: questionsPerReward,
        rewardedVideosUsed: rewardedVideosUsed,
        rewardedVideosMax: rewardedVideosMax,
        rewardedVideosRemaining: rewardedVideosRemaining,
        rollingVideosUsed: rollingVideosUsed,
        rollingVideosMax: rollingVideosMax,
        rewardedAdAvailable: rewardedAdAvailable,
        rewardedAdNextAvailableAt: rewardedAdNextAvailableAt,
      );
}

extension DailyAssignmentDtoConverter on DailyAssignmentDto {
  DailyAssignmentEntity toEntity() => DailyAssignmentEntity(
        assignmentId: assignmentId,
        questionId: questionId,
        questionVersionId: questionVersionId,
        position: position,
        kind: _assignmentKind(kind),
        topic: topic,
        text: text,
        answers: answers
            .map(
              (answer) => DailyAssignmentAnswerEntity(
                id: answer.id,
                text: answer.text,
              ),
            )
            .toList(growable: false),
        hintUsed: hintUsed,
      );
}

extension DailyAttemptDtoConverter on DailyAttemptDto {
  DailyAttemptEntity toEntity() => DailyAttemptEntity(
        clientEventId: clientEventId,
        attemptId: attemptId,
        assignmentId: assignmentId,
        questionVersionId: questionVersionId,
        action: _attemptAction(action),
        isCorrect: correct,
        answerId: answerId,
        correctAnswerId: correctAnswerId,
        description: description,
        hintUsed: hintUsed,
        xpAwarded: xpAwarded,
        ratingBefore: ratingBefore,
        ratingAfter: ratingAfter,
        ratingDelta: ratingDelta,
        provisional: provisional,
        runCompleted: runCompleted,
        partner: partner?.toEntity(),
      );
}

extension PartnerRecommendationDtoConverter on PartnerRecommendationDto {
  PartnerRecommendationEntity toEntity() => PartnerRecommendationEntity(
        campaignId: campaignId,
        disclosure: disclosure,
        title: title,
        body: body,
        cta: cta,
        url: url,
      );
}

extension DailyHintDtoConverter on DailyHintDto {
  DailyHintEntity toEntity() => DailyHintEntity(
        assignmentId: assignmentId,
        hint: hint,
      );
}

extension DailySummaryDtoConverter on DailySummaryDto {
  DailySummaryEntity toEntity() => DailySummaryEntity(
        runId: runId,
        editionDate: editionDate,
        status: _runStatus(status),
        requiredCount: requiredCount,
        resolvedCount: resolvedCount,
        correctCount: correctCount,
        skippedCount: skippedCount,
        hintCount: hintCount,
        answerXp: answerXp,
        completionXp: completionXp,
        totalXp: totalXp,
        bonusGranted: bonusGranted,
        bonusServed: bonusServed,
        ratingBefore: ratingBefore,
        ratingAfter: ratingAfter,
        ratingDelta: ratingDelta,
        accuracy: accuracy,
        percentile: percentile,
        streakBefore: streakBefore,
        streakAfter: streakAfter,
        streakDelta: streakDelta,
        seasonRankBefore: seasonRankBefore,
        seasonRankAfter: seasonRankAfter,
        seasonRankDelta: seasonRankDelta,
        continuation: continuation.toEntity(),
      );
}

extension RewardedAdDtoConverter on RewardedAdDto {
  RewardedAdEntity toEntity() => RewardedAdEntity(
        clientEventId: clientEventId,
        grantedQuestions: grantedQuestions,
        continuation: continuation.toEntity(),
      );
}

DailyRunStatus _runStatus(String value) => switch (value) {
      'IN_PROGRESS' => DailyRunStatus.inProgress,
      'COMPLETED' => DailyRunStatus.completed,
      'ABANDONED' => DailyRunStatus.abandoned,
      'EXPIRED' => DailyRunStatus.expired,
      'SYSTEM_PROTECTED' => DailyRunStatus.systemProtected,
      _ => DailyRunStatus.unknown,
    };

DailyAssignmentKind _assignmentKind(String value) => switch (value) {
      'MAIN' => DailyAssignmentKind.main,
      'BONUS' => DailyAssignmentKind.bonus,
      _ => DailyAssignmentKind.unknown,
    };

DailyAttemptAction _attemptAction(String value) => switch (value) {
      'ANSWER' => DailyAttemptAction.answer,
      'SKIP' => DailyAttemptAction.skip,
      _ => DailyAttemptAction.unknown,
    };

DailyContinuationAction _continuationAction(String value) => switch (value) {
      'COMPLETE_MAIN' => DailyContinuationAction.completeMain,
      'PLAY_QUESTION' => DailyContinuationAction.playQuestion,
      'WATCH_REWARDED' => DailyContinuationAction.watchRewarded,
      'WAIT_FOR_REWARDED' => DailyContinuationAction.waitForRewarded,
      'LIMIT_REACHED' => DailyContinuationAction.limitReached,
      'CLOSED' => DailyContinuationAction.closed,
      _ => DailyContinuationAction.unknown,
    };
