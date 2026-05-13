// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_level_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLevelDtoImpl _$$UserLevelDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserLevelDtoImpl(
      level: (json['level'] as num?)?.toInt() ?? 1,
      experience: (json['experience'] as num?)?.toInt() ?? 0,
      totalPoints: (json['totalPoints'] as num?)?.toInt() ?? 0,
      questionsAnswered: (json['questionsAnswered'] as num?)?.toInt() ?? 0,
      correctAnswers: (json['correctAnswers'] as num?)?.toInt() ?? 0,
      accuracy: (json['accuracy'] as num?)?.toDouble() ?? 0.0,
      streakDays: (json['streakDays'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserLevelDtoImplToJson(_$UserLevelDtoImpl instance) =>
    <String, dynamic>{
      'level': instance.level,
      'experience': instance.experience,
      'totalPoints': instance.totalPoints,
      'questionsAnswered': instance.questionsAnswered,
      'correctAnswers': instance.correctAnswers,
      'accuracy': instance.accuracy,
      'streakDays': instance.streakDays,
    };
