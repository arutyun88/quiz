import 'package:quiz/features/daily_edition/domain/entity/pending_daily_attempt_entity.dart';

abstract interface class DailyAttemptOutbox {
  Future<PendingDailyAttemptEntity?> load({required String accountId});

  Future<void> save(PendingDailyAttemptEntity attempt);

  Future<void> clear({
    required String accountId,
    required String clientEventId,
  });
}
