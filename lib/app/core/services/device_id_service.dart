import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract interface class DeviceIdService {
  String get deviceId;
}

class DeviceIdServicePrefs implements DeviceIdService {
  final String _deviceId;

  static const String _tokensKey = 'device_id';

  DeviceIdServicePrefs._({
    required String deviceId,
  }) : _deviceId = deviceId;

  @override
  String get deviceId => _deviceId;

  static Future<DeviceIdServicePrefs> init(SharedPreferences prefs) async {
    final id = prefs.getString(_tokensKey);
    if (id case String id when Uuid.isValidUUID(fromString: id)) {
      return DeviceIdServicePrefs._(deviceId: id);
    }

    // Server installation identifiers are UUIDs. Do not reuse hardware IDs:
    // they are platform-specific, can be reset, and are unnecessary PII.
    final deviceId = const Uuid().v4();

    await prefs.setString(_tokensKey, deviceId);

    return DeviceIdServicePrefs._(deviceId: deviceId);
  }
}
