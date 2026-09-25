import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/notifications/domain/entity/notification_inbox_entity.dart';
import 'package:quiz/features/notifications/domain/repository/notification_inbox_repository.dart';
import 'package:quiz/features/notifications/presentation/provider/notification_inbox_provider.dart';

void main() {
  test('does not request unread count for a signed-out user', () {
    final repository = _FakeNotificationInboxRepository();
    final notifier = NotificationInboxNotifier(
      repository: repository,
      isAuthenticated: false,
    );
    addTearDown(notifier.dispose);

    expect(repository.unreadCountCalls, 0);
  });

  test('loads the inbox and the authoritative unread count', () async {
    final repository = _FakeNotificationInboxRepository()
      ..fetchResult = Result.ok(_page([_notification()]))
      ..unreadCount = 7;
    final notifier = NotificationInboxNotifier(
      repository: repository,
      autoFetchUnread: false,
    );
    addTearDown(notifier.dispose);

    expect(await notifier.fetch(), isTrue);

    expect(notifier.state.hasLoaded, isTrue);
    expect(notifier.state.items, hasLength(1));
    expect(notifier.state.unreadCount, 7);
  });

  test('rolls back an optimistic read when persistence fails', () async {
    final repository = _FakeNotificationInboxRepository()
      ..fetchResult = Result.ok(_page([_notification()]))
      ..unreadCount = 1
      ..markReadResult = const Result.failed(Failure.unknown('failed'));
    final notifier = NotificationInboxNotifier(
      repository: repository,
      autoFetchUnread: false,
    );
    addTearDown(notifier.dispose);
    await notifier.fetch();

    expect(await notifier.markRead('notification-1'), isFalse);

    expect(notifier.state.items.single.isRead, isFalse);
    expect(notifier.state.unreadCount, 1);
  });
}

class _FakeNotificationInboxRepository implements NotificationInboxRepository {
  Result<NotificationInboxEntity, Failure> fetchResult =
      const Result.ok(NotificationInboxEntity(
    items: [],
    total: 0,
    offset: 0,
    limit: 20,
  ));
  Result<void, Failure> markReadResult = const Result.ok(null);
  int unreadCount = 0;
  int unreadCountCalls = 0;

  @override
  Future<Result<NotificationInboxEntity, Failure>> fetch({
    required int limit,
    required int offset,
  }) async =>
      fetchResult;

  @override
  Future<Result<int, Failure>> fetchUnreadCount() async {
    unreadCountCalls += 1;
    return Result.ok(unreadCount);
  }

  @override
  Future<Result<void, Failure>> markAllRead() async => const Result.ok(null);

  @override
  Future<Result<void, Failure>> markRead(String notificationId) async =>
      markReadResult;
}

NotificationInboxEntity _page(List<InboxNotificationEntity> items) =>
    NotificationInboxEntity(
      items: items,
      total: items.length,
      offset: 0,
      limit: 20,
    );

InboxNotificationEntity _notification() => InboxNotificationEntity(
      id: 'notification-1',
      type: InboxNotificationType.levelUp,
      payload: const {'new_level': 5},
      destination: InboxNotificationDestination.profile,
      isRead: false,
      createdAt: DateTime.parse('2026-09-25T00:00:00Z'),
    );
