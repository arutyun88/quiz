import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/features/notifications/data/repository/remote_notification_inbox_repository.dart';
import 'package:quiz/features/notifications/domain/repository/notification_inbox_repository.dart';

@module
abstract class NotificationInboxModule {
  @lazySingleton
  NotificationInboxRepository notificationInboxRepository({
    required ApiClient client,
  }) =>
      RemoteNotificationInboxRepository(client: client);
}
