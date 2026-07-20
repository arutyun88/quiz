// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_timeline_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardTimelineDtoImpl _$$LeaderboardTimelineDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaderboardTimelineDtoImpl(
      currentRank: (json['current_rank'] as num?)?.toInt(),
      deltaOverPeriod: (json['delta_over_period'] as num?)?.toInt(),
      days: (json['days'] as List<dynamic>?)
              ?.map((e) => TimelineDayDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$LeaderboardTimelineDtoImplToJson(
        _$LeaderboardTimelineDtoImpl instance) =>
    <String, dynamic>{
      'current_rank': instance.currentRank,
      'delta_over_period': instance.deltaOverPeriod,
      'days': instance.days,
    };

_$TimelineDayDtoImpl _$$TimelineDayDtoImplFromJson(Map<String, dynamic> json) =>
    _$TimelineDayDtoImpl(
      date: DateTime.parse(json['date'] as String),
      points: (json['points'] as num?)?.toInt(),
      rank: (json['rank'] as num?)?.toInt(),
      trend: json['trend'] as String?,
    );

Map<String, dynamic> _$$TimelineDayDtoImplToJson(
        _$TimelineDayDtoImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'points': instance.points,
      'rank': instance.rank,
      'trend': instance.trend,
    };
