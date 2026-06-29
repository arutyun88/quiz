import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalStorageService {
  static const String _themeKey = 'theme';
  static const String _localeKey = 'locale';
  static const String _onboardingSeenKey = 'onboarding_seen';
  final SharedPreferences _prefs;

  SettingsLocalStorageService({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  String? fetchTheme() => _prefs.getString(_themeKey);

  void saveTheme(String value) => _prefs.setString(_themeKey, value);

  String? fetchLocale() => _prefs.getString(_localeKey);

  void saveLocale(String value) => _prefs.setString(_localeKey, value);

  bool get isOnboardingSeen => _prefs.getBool(_onboardingSeenKey) ?? false;

  Future<void> markOnboardingSeen() => _prefs.setBool(_onboardingSeenKey, true);

  Future<void> resetOnboardingSeen() => _prefs.remove(_onboardingSeenKey);
}
