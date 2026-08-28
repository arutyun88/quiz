import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/push/data/dto/notification_preferences_dto.dart';
import 'package:quiz/features/push/data/repository/remote_push_repository.dart';
import 'package:quiz/features/push/domain/entity/notification_preferences_entity.dart';

import '../../../../../support/mock_api_client.dart';

void main() {
  late MockApiClient client;
  late RemotePushRepository repository;

  const preferences = NotificationPreferencesEntity(
    dailyEdition: true,
    streakRisk: false,
    rankChange: true,
    promotions: false,
  );

  setUpAll(() => registerFallbackValue(<String, dynamic>{}));

  setUp(() {
    client = MockApiClient();
    repository = RemotePushRepository(client: client);
  });

  test('registers an FCM token against the stable installation UUID', () async {
    when(
      () => client.put<void, dynamic>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
      ),
    ).thenAnswer((_) async => const Result.ok(null));

    await repository.registerDevice(
      installationId: 'b2d27858-2825-4078-8859-badf91c857cb',
      registrationToken: 'secret-fcm-token',
      platform: 'IOS',
      locale: 'ru',
    );

    final body = verify(
      () => client.put<void, dynamic>(
        '/user/push-devices/b2d27858-2825-4078-8859-badf91c857cb',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
      ),
    ).captured.single;

    expect(body, {
      'provider': 'FCM',
      'registration_token': 'secret-fcm-token',
      'platform': 'IOS',
      'locale': 'ru',
    });
  });

  test('updates every server-owned notification preference', () async {
    when(
      () => client.put<NotificationPreferencesEntity,
          DataDto<NotificationPreferencesDto>>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
      ),
    ).thenAnswer((_) async => const Result.ok(preferences));

    await repository.updatePreferences(preferences);

    final body = verify(
      () => client.put<NotificationPreferencesEntity,
          DataDto<NotificationPreferencesDto>>(
        '/user/notification-preferences',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
      ),
    ).captured.single;

    expect(body, {
      'daily_edition': true,
      'streak_risk': false,
      'rank_change': true,
      'promotions': false,
    });
  });

  test('unregisters only the current installation', () async {
    when(
      () => client.delete(
        any(),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
      ),
    ).thenAnswer((_) async => const Result.ok(null));

    await repository.unregisterDevice('b2d27858-2825-4078-8859-badf91c857cb');

    verify(
      () => client.delete(
        '/user/push-devices/b2d27858-2825-4078-8859-badf91c857cb',
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
      ),
    ).called(1);
  });
}
