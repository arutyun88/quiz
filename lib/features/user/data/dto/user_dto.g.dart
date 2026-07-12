// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: json['id'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      level: (json['level'] as num).toInt(),
      experienceInLevel: (json['experience_in_level'] as num).toInt(),
      levelExperience: (json['level_experience'] as num).toInt(),
      streakDays: (json['streak_days'] as num).toInt(),
      bestStreakDays: (json['best_streak_days'] as num).toInt(),
      questionsAnswered: (json['questions_answered'] as num).toInt(),
      correctAnswers: (json['correct_answers'] as num).toInt(),
      accuracy: (json['accuracy'] as num).toDouble(),
      totalPoints: (json['total_points'] as num).toInt(),
      memberSince: DateTime.parse(json['member_since'] as String),
      achievementsUnlocked: (json['achievements_unlocked'] as num).toInt(),
      achievementsTotal: (json['achievements_total'] as num).toInt(),
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'birth_date': instance.birthDate?.toIso8601String(),
      'level': instance.level,
      'experience_in_level': instance.experienceInLevel,
      'level_experience': instance.levelExperience,
      'streak_days': instance.streakDays,
      'best_streak_days': instance.bestStreakDays,
      'questions_answered': instance.questionsAnswered,
      'correct_answers': instance.correctAnswers,
      'accuracy': instance.accuracy,
      'total_points': instance.totalPoints,
      'member_since': instance.memberSince.toIso8601String(),
      'achievements_unlocked': instance.achievementsUnlocked,
      'achievements_total': instance.achievementsTotal,
    };
