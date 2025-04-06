import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/auth_tokens.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthTokenService {
  String? get accessToken;
  String? get refreshToken;

  Future<void> save(AuthTokens tokens);

  Future<void> clean();
}

@Singleton(as: AuthTokenService)
class AuthTokenServicePrefs implements AuthTokenService {
  final SharedPreferences _prefs;

  static const String _tokensKey = 'auth_tokens';

  AuthTokenServicePrefs({
    required SharedPreferences prefs,
  }) : _prefs = prefs {
    _load();
  }

  AuthTokens? _cachedTokens;

  @override
  String? get accessToken => _cachedTokens?.accessToken;

  @override
  String? get refreshToken => _cachedTokens?.refreshToken;

  void _load() {
    final result = _prefs.getString(_tokensKey);
    if (result case String json) {
      try {
        _cachedTokens = AuthTokens.fromJson(jsonDecode(json));
      } catch (_) {
        _cachedTokens = null;
        _prefs.remove(_tokensKey);
      }
    }
  }

  @override
  Future<void> save(AuthTokens tokens) async {
    await _prefs.setString(_tokensKey, jsonEncode(tokens.toJson()));
    _cachedTokens = tokens;
  }

  @override
  Future<void> clean() async {
    await _prefs.remove(_tokensKey);
    _cachedTokens = null;
  }
}
