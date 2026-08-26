import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';

abstract interface class DailyEditionRepository {
  Future<Result<DailyRunEntity, Failure>> open({String? timezoneId});

  Future<Result<DailyAssignmentEntity, Failure>> fetchCurrent(String runId);

  Future<Result<DailyRunEntity, Failure>> close(String runId);

  Future<Result<DailyHintEntity, Failure>> useHint({
    required String runId,
    required String assignmentId,
  });

  Future<Result<DailyAttemptEntity, Failure>> submitAttempt({
    required String runId,
    required String assignmentId,
    required String clientEventId,
    required DailyAttemptAction action,
    String? answerId,
  });

  Future<Result<DailySummaryEntity, Failure>> fetchSummary(String runId);

  Future<Result<DailyContinuationEntity, Failure>> fetchContinuation(
    String runId,
  );

  Future<Result<RewardedAdEntity, Failure>> confirmRewardedAd({
    required String runId,
    required String clientEventId,
    required String providerEventId,
    required String verificationToken,
  });
}
