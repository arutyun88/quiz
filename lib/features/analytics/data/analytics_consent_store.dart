import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AnalyticsConsentStore {
  AnalyticsConsentStore(this._preferences);

  static const preferenceKey = 'privacy.product_analytics_consent.v1';

  final SharedPreferences _preferences;

  bool get granted => _preferences.getBool(preferenceKey) ?? false;

  Future<bool> setGranted(bool value) =>
      _preferences.setBool(preferenceKey, value);
}
