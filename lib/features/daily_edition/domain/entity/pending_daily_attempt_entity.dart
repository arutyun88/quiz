import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';

class PendingDailyAttemptEntity {
  const PendingDailyAttemptEntity({
    required this.accountId,
    required this.runId,
    required this.assignmentId,
    required this.clientEventId,
    required this.action,
    required this.answerId,
    required this.createdAt,
  });

  final String accountId;
  final String runId;
  final String assignmentId;
  final String clientEventId;
  final DailyAttemptAction action;
  final String? answerId;
  final DateTime createdAt;
}
