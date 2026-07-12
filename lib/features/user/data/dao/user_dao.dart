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
    String? email,
    String? name,
    String? birthDateIso,
    required int level,
    required int experienceInLevel,
    required int levelExperience,
    required int streakDays,
    required int bestStreakDays,
    required int questionsAnswered,
    required int correctAnswers,
    required double accuracy,
    required int totalPoints,
    required String memberSinceIso,
    required int achievementsUnlocked,
    required int achievementsTotal,
  }) = _UserDao;

  factory UserDao.fromJson(Map<String, dynamic> json) => _$UserDaoFromJson(json);

  DateTime? get birthDate => birthDateIso != null ? DateTime.parse(birthDateIso!) : null;

  DateTime get memberSince => DateTime.parse(memberSinceIso);

  static UserDao fromJsonString(String jsonString) => UserDao.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
}
