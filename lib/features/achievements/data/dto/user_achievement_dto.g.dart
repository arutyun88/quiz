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
    );

Map<String, dynamic> _$$UserAchievementDtoImplToJson(
        _$UserAchievementDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'points': instance.points,
    };
