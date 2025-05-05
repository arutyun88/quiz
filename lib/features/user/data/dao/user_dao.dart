import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/core/model/dao/dao.dart';
import 'package:quiz/app/core/model/dao/dao_mixin.dart';

part 'user_dao.freezed.dart';
part 'user_dao.g.dart';

@freezed
class UserDao with _$UserDao, DaoMixin<UserDao> implements Dao<UserDao> {
  const UserDao._();

  const factory UserDao({
    required String id,
    required String email,
    String? name,
    String? birthDateIso,
  }) = _UserDao;

  factory UserDao.fromJson(Map<String, dynamic> json) => _$UserDaoFromJson(json);

  DateTime? get birthDate => birthDateIso != null ? DateTime.parse(birthDateIso!) : null;

  static UserDao fromJsonString(String jsonString) => UserDao.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
}
