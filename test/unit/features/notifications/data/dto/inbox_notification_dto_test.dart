import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/notifications/data/dto/inbox_notification_dto.dart';

void main() {
  test('parses the notification API response', () {
    final notification = InboxNotificationDto.fromJson({
      'id': 'd202753a-f472-44d4-ba0c-ab73363bdddb',
      'type': 'SYSTEM',
      'payload': {
        'title': 'Выпуск дня готов',
        'message': 'Новый выпуск уже ждёт вас',
      },
      'destination': 'HOME',
      'read': false,
      'createdAt': '2026-09-25T06:42:16.477609Z',
    });

    expect(notification.id, 'd202753a-f472-44d4-ba0c-ab73363bdddb');
    expect(notification.type, 'SYSTEM');
    expect(notification.payload['title'], 'Выпуск дня готов');
    expect(notification.destination, 'HOME');
    expect(notification.isRead, isFalse);
    expect(
      notification.createdAt,
      DateTime.utc(2026, 9, 25, 6, 42, 16, 477, 609),
    );
  });
}
