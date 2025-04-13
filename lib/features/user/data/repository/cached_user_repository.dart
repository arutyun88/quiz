import 'dart:convert';

import 'package:quiz/features/user/data/converter/user_converter.dart';
import 'package:quiz/features/user/data/dto/user_dto.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/local_user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachedUserRepository implements LocalUserRepository {
  static const String _key = 'user';

  final SharedPreferences _prefs;
  final UserConverter _converter;

  CachedUserRepository({
    required SharedPreferences storage,
    required UserConverter converter,
  })  : _prefs = storage,
        _converter = converter;

  @override
  Future<UserEntity?> fetchUser() async {
    final user = _prefs.getString(_key);
    if (user case String user) {
      return _converter.convert(UserDto.fromJson(jsonDecode(user)));
    }
    return null;
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    await _prefs.setString(
      _key,
      jsonEncode(_converter.revert(user).toJson()),
    );
  }
}
