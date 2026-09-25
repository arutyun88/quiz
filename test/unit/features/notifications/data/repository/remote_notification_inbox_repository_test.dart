import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/notifications/data/dto/inbox_notification_dto.dart';
import 'package:quiz/features/notifications/data/repository/remote_notification_inbox_repository.dart';
import 'package:quiz/features/notifications/domain/entity/notification_inbox_entity.dart';

import '../../../../../support/mock_api_client.dart';

void main() {
  late MockApiClient client;
  late RemoteNotificationInboxRepository repository;

  setUp(() {
    client = MockApiClient();
    repository = RemoteNotificationInboxRepository(client: client);
  });

  test('fetches the authenticated notification page', () async {
    const page = NotificationInboxEntity(
      items: [],
      total: 41,
      offset: 20,
      limit: 20,
    );
    when(
      () => client
          .get<NotificationInboxEntity, DataPageDto<InboxNotificationDto>>(
        any(),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
      ),
    ).thenAnswer((_) async => const Result.ok(page));

    expect(
        await repository.fetch(limit: 20, offset: 20), const Result.ok(page));

    final query = verify(
      () => client
          .get<NotificationInboxEntity, DataPageDto<InboxNotificationDto>>(
        '/user/notifications',
        queryParameters: captureAny(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
      ),
    ).captured.single as Map<String, dynamic>;
    expect(query, {'limit': 20, 'offset': 20});
  });

  test('reads unread count from the response data envelope', () async {
    when(
      () => client.get<int, int>(
        any(),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
      ),
    ).thenAnswer((_) async => const Result.ok(3));

    expect(await repository.fetchUnreadCount(), const Result.ok(3));

    final mapper = verify(
      () => client.get<int, int>(
        '/user/notifications/unread-count',
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: captureAny(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
      ),
    ).captured.single as JsonMapper<int>;

    expect(
        mapper({
          'data': {'count': 3}
        }),
        3);
  });

  test('marks one notification as read', () async {
    when(
      () => client.put<void, void>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
      ),
    ).thenAnswer((_) async => const Result.ok(null));

    await repository.markRead('notification-1');

    verify(
      () => client.put<void, void>(
        '/user/notifications/notification-1/read',
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
      ),
    ).called(1);
  });
}
