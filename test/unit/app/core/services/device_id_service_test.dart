import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/core/services/device_id_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

void main() {
  test('replaces a legacy hardware identifier with an installation UUID',
      () async {
    SharedPreferences.setMockInitialValues(
        {'device_id': 'android-hardware-id'});
    final preferences = await SharedPreferences.getInstance();

    final service = await DeviceIdServicePrefs.init(preferences);

    expect(Uuid.isValidUUID(fromString: service.deviceId), isTrue);
    expect(preferences.getString('device_id'), service.deviceId);
  });

  test('keeps an existing installation UUID stable', () async {
    const id = 'b2d27858-2825-4078-8859-badf91c857cb';
    SharedPreferences.setMockInitialValues({'device_id': id});
    final preferences = await SharedPreferences.getInstance();

    final service = await DeviceIdServicePrefs.init(preferences);

    expect(service.deviceId, id);
  });
}
