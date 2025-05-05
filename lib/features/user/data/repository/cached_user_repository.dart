import 'package:quiz/features/user/data/converter/user_dao_converter.dart';
import 'package:quiz/features/user/data/dao/user_dao.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/local_user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachedUserRepository implements LocalUserRepository {
  static const String _key = 'user';

  final SharedPreferences _prefs;
  final UserDaoConverter _converter;

  CachedUserRepository({
    required SharedPreferences storage,
    required UserDaoConverter converter,
  })  : _prefs = storage,
        _converter = converter;

  @override
  Future<UserEntity?> fetchUser() async {
    final user = _prefs.getString(_key);
    if (user case String user) {
      return _converter.toEntity(UserDao.fromJsonString(user));
    }
    return null;
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    await _prefs.setString(
      _key,
      _converter.toDao(user).toJsonString(),
    );
  }
}
