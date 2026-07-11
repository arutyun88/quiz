// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_overview_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardOverviewDtoImpl _$$LeaderboardOverviewDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaderboardOverviewDtoImpl(
      top: (json['top'] as List<dynamic>?)
              ?.map((e) => LeaderboardDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      me: json['me'] == null
          ? null
          : LeaderboardDto.fromJson(json['me'] as Map<String, dynamic>),
      around: (json['around'] as List<dynamic>?)
              ?.map((e) => LeaderboardDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      previousMe: json['previousMe'] == null
          ? null
          : LeaderboardDto.fromJson(json['previousMe'] as Map<String, dynamic>),
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeaderboardOverviewDtoImplToJson(
        _$LeaderboardOverviewDtoImpl instance) =>
    <String, dynamic>{
      'top': instance.top,
      'me': instance.me,
      'around': instance.around,
      'previousMe': instance.previousMe,
      'total': instance.total,
    };
