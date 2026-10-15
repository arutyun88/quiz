import 'package:flutter_timezone/flutter_timezone.dart';

abstract interface class DeviceTimezoneService {
  Future<String?> currentIanaIdentifier();
}

class FlutterDeviceTimezoneService implements DeviceTimezoneService {
  const FlutterDeviceTimezoneService();

  @override
  Future<String?> currentIanaIdentifier() async {
    try {
      final identifier =
          (await FlutterTimezone.getLocalTimezone()).identifier.trim();
      return identifier.isEmpty ? null : identifier;
    } catch (_) {
      return null;
    }
  }
}
