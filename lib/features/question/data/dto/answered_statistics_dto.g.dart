// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answered_statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnsweredStatisticsDtoImpl _$$AnsweredStatisticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AnsweredStatisticsDtoImpl(
      lastIsCorrect: json['last_is_correct'] as bool,
      statistics: UserStatisticsDto.fromJson(
          json['statistics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AnsweredStatisticsDtoImplToJson(
        _$AnsweredStatisticsDtoImpl instance) =>
    <String, dynamic>{
      'last_is_correct': instance.lastIsCorrect,
      'statistics': instance.statistics,
    };
