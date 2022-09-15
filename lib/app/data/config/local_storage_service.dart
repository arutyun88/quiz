import 'package:quiz/app/data/model/preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late final SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> setValue(PreferenceKey key, String value) async {
    return _setString(key.toString(), value);
  }

  static Future<bool> setListValues(
      PreferenceKey key, List<String> values) async {
    return await _prefs.setStringList(key.toString(), values);
  }

  static String getValue(PreferenceKey key, [String defValue = ""]) {
    return _getString(key.toString());
  }

  static List<String>? getListValues(PreferenceKey key) {
    return _prefs.getStringList(key.toString());
  }

  static Future<bool> _setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  static String _getString(String key, [String defValue = ""]) {
    return _prefs.getString(key) ?? defValue;
  }

  static bool getBool(PreferenceKey key, [bool defValue = false]) {
    return _prefs.getBool(key.toString()) ?? defValue;
  }

  static Future<bool> setBool(PreferenceKey key, bool value) async {
    return await _prefs.setBool(key.toString(), value);
  }

  static Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  static Future<bool> clear() async {
    return await _prefs.clear();
  }

  static Future<Set<String>> getKeys() async {
    return _prefs.getKeys();
  }
}
