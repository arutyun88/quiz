// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDaoImpl _$$UserDaoImplFromJson(Map<String, dynamic> json) =>
    _$UserDaoImpl(
      id: json['id'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      birthDateIso: json['birthDateIso'] as String?,
      level: (json['level'] as num).toInt(),
      experienceInLevel: (json['experienceInLevel'] as num).toInt(),
      levelExperience: (json['levelExperience'] as num).toInt(),
      streakDays: (json['streakDays'] as num).toInt(),
      bestStreakDays: (json['bestStreakDays'] as num).toInt(),
      questionsAnswered: (json['questionsAnswered'] as num).toInt(),
      correctAnswers: (json['correctAnswers'] as num).toInt(),
      accuracy: (json['accuracy'] as num).toDouble(),
      totalPoints: (json['totalPoints'] as num).toInt(),
      memberSinceIso: json['memberSinceIso'] as String,
      achievementsUnlocked: (json['achievementsUnlocked'] as num).toInt(),
      achievementsTotal: (json['achievementsTotal'] as num).toInt(),
    );

Map<String, dynamic> _$$UserDaoImplToJson(_$UserDaoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'birthDateIso': instance.birthDateIso,
      'level': instance.level,
      'experienceInLevel': instance.experienceInLevel,
      'levelExperience': instance.levelExperience,
      'streakDays': instance.streakDays,
      'bestStreakDays': instance.bestStreakDays,
      'questionsAnswered': instance.questionsAnswered,
      'correctAnswers': instance.correctAnswers,
      'accuracy': instance.accuracy,
      'totalPoints': instance.totalPoints,
      'memberSinceIso': instance.memberSinceIso,
      'achievementsUnlocked': instance.achievementsUnlocked,
      'achievementsTotal': instance.achievementsTotal,
    };
