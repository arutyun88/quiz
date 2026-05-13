// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_level_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLevelDtoImpl _$$UserLevelDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserLevelDtoImpl(
      level: (json['level'] as num?)?.toInt() ?? 1,
      experience: (json['experience'] as num?)?.toInt() ?? 0,
      totalPoints: (json['total_points'] as num?)?.toInt() ?? 0,
      questionsAnswered: (json['questions_answered'] as num?)?.toInt() ?? 0,
      correctAnswers: (json['correct_answers'] as num?)?.toInt() ?? 0,
      accuracy: (json['accuracy'] as num?)?.toDouble() ?? 0.0,
      streakDays: (json['streak_days'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserLevelDtoImplToJson(_$UserLevelDtoImpl instance) =>
    <String, dynamic>{
      'level': instance.level,
      'experience': instance.experience,
      'total_points': instance.totalPoints,
      'questions_answered': instance.questionsAnswered,
      'correct_answers': instance.correctAnswers,
      'accuracy': instance.accuracy,
      'streak_days': instance.streakDays,
    };
