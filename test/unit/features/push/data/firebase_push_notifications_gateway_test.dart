import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/config/firebase/firebase_bootstrap.dart';
import 'package:quiz/app/core/services/device_id_service.dart';
import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:quiz/features/push/data/firebase_push_notifications_gateway.dart';
import 'package:quiz/features/push/domain/push_notifications_gateway.dart';
import 'package:quiz/features/push/domain/repository/push_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockPushRepository extends Mock implements PushRepository {}

class _FakeDeviceIdService implements DeviceIdService {
  @override
  String get deviceId => '00000000-0000-4000-8000-000000000001';
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('stays inert when Firebase bootstrap is unavailable', () async {
    FirebaseBootstrap.setAvailabilityForTesting(false);
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();
    final gateway = FirebasePushNotificationsGateway(
      repository: _MockPushRepository(),
      deviceIdService: _FakeDeviceIdService(),
      settingsStorage: SettingsLocalStorageService(prefs: preferences),
    );

    expect(
      await gateway.permissionStatus(),
      PushPermissionStatus.notDetermined,
    );
    expect(
      await gateway.requestPermission(),
      PushPermissionStatus.denied,
    );
    await gateway.activate();
    await gateway.deactivate();
  });
}
