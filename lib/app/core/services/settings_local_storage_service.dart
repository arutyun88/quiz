import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalStorageService {
  static const String _themeKey = 'theme';
  static const String _localeKey = 'locale';
  final SharedPreferences _prefs;

  SettingsLocalStorageService({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  String? fetchTheme() => _prefs.getString(_themeKey);

  void saveTheme(String value) => _prefs.setString(_themeKey, value);

  String? fetchLocale() => _prefs.getString(_localeKey);

  void saveLocale(String value) => _prefs.setString(_localeKey, value);
}
