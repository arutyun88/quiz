import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
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
    if (id case String id) {
      return DeviceIdServicePrefs._(deviceId: id);
    }

    final String deviceId;
    final plugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final info = await plugin.androidInfo;
      deviceId = info.id;
    } else if (Platform.isIOS) {
      final info = await plugin.iosInfo;
      deviceId = info.identifierForVendor ?? const Uuid().v4();
    } else {
      deviceId = const Uuid().v4();
    }

    await prefs.setString(_tokensKey, deviceId);

    return DeviceIdServicePrefs._(deviceId: deviceId);
  }
}
