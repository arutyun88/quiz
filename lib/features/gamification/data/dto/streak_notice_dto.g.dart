// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_notice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreakNoticeDtoImpl _$$StreakNoticeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$StreakNoticeDtoImpl(
      type: json['type'] as String,
      freezesLeft: (json['freezesLeft'] as num?)?.toInt() ?? 0,
      freezesTotal: (json['freezesTotal'] as num?)?.toInt() ?? 0,
      lostStreakDays: (json['lostStreakDays'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$StreakNoticeDtoImplToJson(
        _$StreakNoticeDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'freezesLeft': instance.freezesLeft,
      'freezesTotal': instance.freezesTotal,
      'lostStreakDays': instance.lostStreakDays,
    };
