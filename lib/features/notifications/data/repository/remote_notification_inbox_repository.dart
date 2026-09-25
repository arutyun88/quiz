import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/notifications/data/dto/inbox_notification_dto.dart';
import 'package:quiz/features/notifications/domain/entity/notification_inbox_entity.dart';
import 'package:quiz/features/notifications/domain/repository/notification_inbox_repository.dart';

class RemoteNotificationInboxRepository implements NotificationInboxRepository {
  RemoteNotificationInboxRepository({required ApiClient client})
      : _client = client;

  final ApiClient _client;

  @override
  Future<Result<NotificationInboxEntity, Failure>> fetch({
    required int limit,
    required int offset,
  }) =>
      _client.get(
        '/user/notifications',
        queryParameters: {'limit': limit, 'offset': offset},
        mapper: (json) => DataPageDto.fromJson(
          json,
          (item) => InboxNotificationDto.fromJson(item as Json),
        ),
        converter: (page) => NotificationInboxEntity(
          items: page.data.map(_convert).toList(growable: false),
          total: page.meta.total,
          offset: page.meta.offset,
          limit: page.meta.limit,
        ),
      );

  @override
  Future<Result<int, Failure>> fetchUnreadCount() => _client.get(
        '/user/notifications/unread-count',
        mapper: (json) => (json['data'] as Json)['count'] as int,
        converter: (count) => count,
      );

  @override
  Future<Result<void, Failure>> markRead(String notificationId) =>
      _client.put<void, void>('/user/notifications/$notificationId/read');

  @override
  Future<Result<void, Failure>> markAllRead() =>
      _client.put<void, void>('/user/notifications/read-all');

  InboxNotificationEntity _convert(InboxNotificationDto dto) =>
      InboxNotificationEntity(
        id: dto.id,
        type: switch (dto.type) {
          'ACHIEVEMENT_UNLOCKED' => InboxNotificationType.achievementUnlocked,
          'LEVEL_UP' => InboxNotificationType.levelUp,
          'SYSTEM' => InboxNotificationType.system,
          _ => InboxNotificationType.unknown,
        },
        payload: dto.payload,
        destination: switch (dto.destination) {
          'HOME' => InboxNotificationDestination.home,
          'RATING' => InboxNotificationDestination.rating,
          'PROFILE' => InboxNotificationDestination.profile,
          'PROFILE_ACHIEVEMENTS' => InboxNotificationDestination.achievements,
          'REVIEW' => InboxNotificationDestination.review,
          _ => InboxNotificationDestination.none,
        },
        isRead: dto.isRead,
        createdAt: dto.createdAt,
      );
}
