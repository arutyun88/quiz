import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/push/domain/entity/notification_preferences_entity.dart';
import 'package:quiz/features/push/domain/push_notifications_gateway.dart';
import 'package:quiz/features/push/domain/repository/push_repository.dart';
import 'package:quiz/features/settings/presentation/provider/notification_settings_provider.dart';

void main() {
  const serverPreferences = NotificationPreferencesEntity(
    dailyEdition: false,
    streakRisk: true,
    rankChange: true,
    promotions: false,
  );

  test('loads account preferences instead of legacy local toggles', () async {
    final repository = _FakePushRepository(preferences: serverPreferences);
    final notifier = NotificationSettingsNotifier(
      repository: repository,
      gateway: _FakePushGateway(PushPermissionStatus.denied),
    );

    await notifier.reload();

    expect(notifier.state.preferences, same(serverPreferences));
    expect(notifier.state.permission, PushPermissionStatus.denied);
    expect(notifier.state.loading, isFalse);
  });

  test('uses only the snapshot returned by the server after an update',
      () async {
    const authoritative = NotificationPreferencesEntity(
      dailyEdition: false,
      streakRisk: true,
      rankChange: true,
      promotions: true,
    );
    final repository = _FakePushRepository(
      preferences: serverPreferences,
      updatedPreferences: authoritative,
    );
    final notifier = NotificationSettingsNotifier(
      repository: repository,
      gateway: _FakePushGateway(PushPermissionStatus.authorized),
    );
    await notifier.reload();

    await notifier.toggle(NotificationSetting.promo, true);

    expect(repository.lastUpdate?.promotions, isTrue);
    expect(notifier.state.preferences, same(authoritative));
  });

  test('does not change a preference locally when the server rejects it',
      () async {
    final repository = _FakePushRepository(
      preferences: serverPreferences,
      failUpdate: true,
    );
    final notifier = NotificationSettingsNotifier(
      repository: repository,
      gateway: _FakePushGateway(PushPermissionStatus.authorized),
    );
    await notifier.reload();

    await notifier.toggle(NotificationSetting.promo, true);

    expect(notifier.state.preferences, same(serverPreferences));
    expect(notifier.state.failed, isTrue);
  });
}

class _FakePushRepository implements PushRepository {
  _FakePushRepository({
    required this.preferences,
    this.updatedPreferences,
    this.failUpdate = false,
  });

  final NotificationPreferencesEntity preferences;
  final NotificationPreferencesEntity? updatedPreferences;
  final bool failUpdate;
  NotificationPreferencesEntity? lastUpdate;

  @override
  Future<Result<NotificationPreferencesEntity, Failure>>
      fetchPreferences() async => Result.ok(preferences);

  @override
  Future<Result<NotificationPreferencesEntity, Failure>> updatePreferences(
    NotificationPreferencesEntity preferences,
  ) async {
    lastUpdate = preferences;
    if (failUpdate) {
      return const Result.failed(
        Failure.network(NetworkFailureReason.server('offline')),
      );
    }
    return Result.ok(updatedPreferences ?? preferences);
  }

  @override
  Future<Result<void, Failure>> registerDevice({
    required String installationId,
    required String registrationToken,
    required String platform,
    String? locale,
  }) async =>
      const Result.ok(null);

  @override
  Future<Result<void, Failure>> unregisterDevice(String installationId) async =>
      const Result.ok(null);
}

class _FakePushGateway implements PushNotificationsGateway {
  _FakePushGateway(this.status);

  PushPermissionStatus status;

  @override
  Stream<PushDestination> get openedDestinations => const Stream.empty();

  @override
  Future<PushPermissionStatus> permissionStatus() async => status;

  @override
  Future<PushPermissionStatus> requestPermission() async =>
      status = PushPermissionStatus.authorized;

  @override
  Future<void> activate() async {}

  @override
  Future<void> deactivate() async {}

  @override
  Future<void> unregister() async {}
}
