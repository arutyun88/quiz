import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/notifications/domain/entity/notification_inbox_entity.dart';
import 'package:quiz/features/notifications/domain/repository/notification_inbox_repository.dart';
import 'package:quiz/features/notifications/presentation/notification_inbox_page.dart';
import 'package:quiz/features/notifications/presentation/provider/notification_inbox_provider.dart';
import 'package:quiz/gen/strings.g.dart';

void main() {
  testWidgets('shows the dedicated empty inbox state', (tester) async {
    final repository = _FakeRepository(const NotificationInboxEntity(
      items: [],
      total: 0,
      offset: 0,
      limit: 20,
    ));

    await tester.pumpWidget(_app(repository));
    await tester.pumpAndSettle();

    expect(find.text(t.notifications.empty_title), findsOneWidget);
    expect(find.text(t.notifications.empty_message), findsOneWidget);
  });

  testWidgets('shows unread achievement content', (tester) async {
    final repository = _FakeRepository(NotificationInboxEntity(
      items: [
        InboxNotificationEntity(
          id: 'notification-1',
          type: InboxNotificationType.achievementUnlocked,
          payload: const {
            'achievement_name': 'First win',
            'achievement_points': 25,
          },
          destination: InboxNotificationDestination.achievements,
          isRead: false,
          createdAt: DateTime.now(),
        ),
      ],
      total: 1,
      offset: 0,
      limit: 20,
    ));

    await tester.pumpWidget(_app(repository));
    await tester.pumpAndSettle();

    expect(find.text(t.notifications.achievement_title), findsOneWidget);
    expect(find.text('First win · +25 XP'), findsOneWidget);
    expect(find.text(t.notifications.mark_all_read), findsOneWidget);
  });
}

Widget _app(NotificationInboxRepository repository) => ProviderScope(
      overrides: [
        notificationInboxProvider.overrideWith(
          (ref) => NotificationInboxNotifier(
            repository: repository,
            autoFetchUnread: false,
          ),
        ),
      ],
      child: TranslationProvider(
        child: MaterialApp(
          theme: AppTheme.light,
          home: const NotificationInboxPage(),
        ),
      ),
    );

class _FakeRepository implements NotificationInboxRepository {
  _FakeRepository(this.page);

  final NotificationInboxEntity page;

  @override
  Future<Result<NotificationInboxEntity, Failure>> fetch({
    required int limit,
    required int offset,
  }) async =>
      Result.ok(page);

  @override
  Future<Result<int, Failure>> fetchUnreadCount() async =>
      Result.ok(page.items.where((item) => !item.isRead).length);

  @override
  Future<Result<void, Failure>> markAllRead() async => const Result.ok(null);

  @override
  Future<Result<void, Failure>> markRead(String notificationId) async =>
      const Result.ok(null);
}
