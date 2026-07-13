// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_achievement_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAchievementDtoImpl _$$UserAchievementDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAchievementDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      points: (json['points'] as num?)?.toInt(),
      unlocked: json['unlocked'] as bool? ?? false,
      unlockedAt: json['unlocked_at'] == null
          ? null
          : DateTime.parse(json['unlocked_at'] as String),
      progressCurrent: (json['progress_current'] as num?)?.toInt(),
      progressTarget: (json['progress_target'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserAchievementDtoImplToJson(
        _$UserAchievementDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'points': instance.points,
      'unlocked': instance.unlocked,
      'unlocked_at': instance.unlockedAt?.toIso8601String(),
      'progress_current': instance.progressCurrent,
      'progress_target': instance.progressTarget,
    };
