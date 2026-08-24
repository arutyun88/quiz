import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/app/core/model/dao/dao.dart';
import 'package:quiz/app/core/model/dao/dao_mixin.dart';
import 'package:quiz/features/user/data/dao/age_access_dao.dart';

part 'user_dao.freezed.dart';
part 'user_dao.g.dart';

@freezed
class UserDao with _$UserDao, DaoMixin<UserDao> implements Dao<UserDao> {
  const UserDao._();

  const factory UserDao({
    required String id,
    String? email,
    String? name,
    AgeAccessDao? ageAccess,
    String? timezoneId,
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
    @Default(1000) int rating,
    @Default(1000) int bestRating,
    @Default(0) int ratingOfficialAnswers,
    @Default(true) bool ratingProvisional,
  }) = _UserDao;

  factory UserDao.fromJson(Map<String, dynamic> json) =>
      _$UserDaoFromJson(json);

  DateTime get memberSince => DateTime.parse(memberSinceIso);

  static UserDao fromJsonString(String jsonString) =>
      UserDao.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
}
