import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/notifications/domain/entity/notification_inbox_entity.dart';

abstract interface class NotificationInboxRepository {
  Future<Result<NotificationInboxEntity, Failure>> fetch({
    required int limit,
    required int offset,
  });

  Future<Result<int, Failure>> fetchUnreadCount();

  Future<Result<void, Failure>> markRead(String notificationId);

  Future<Result<void, Failure>> markAllRead();
}
