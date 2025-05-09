// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatisticsDtoImpl _$$UserStatisticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserStatisticsDtoImpl(
      rightCount: (json['right_count'] as num).toInt(),
      wrongCount: (json['wrong_count'] as num).toInt(),
    );

Map<String, dynamic> _$$UserStatisticsDtoImplToJson(
        _$UserStatisticsDtoImpl instance) =>
    <String, dynamic>{
      'right_count': instance.rightCount,
      'wrong_count': instance.wrongCount,
    };
