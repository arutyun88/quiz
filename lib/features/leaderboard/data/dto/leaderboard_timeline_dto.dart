import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_timeline_dto.freezed.dart';
part 'leaderboard_timeline_dto.g.dart';

@freezed
class LeaderboardTimelineDto with _$LeaderboardTimelineDto {
  const factory LeaderboardTimelineDto({
    @JsonKey(name: 'current_rank') int? currentRank,
    @JsonKey(name: 'delta_over_period') int? deltaOverPeriod,
    @JsonKey(defaultValue: []) required List<TimelineDayDto> days,
  }) = _LeaderboardTimelineDto;

  factory LeaderboardTimelineDto.fromJson(Map<String, dynamic> json) => _$LeaderboardTimelineDtoFromJson(json);
}

@freezed
class TimelineDayDto with _$TimelineDayDto {
  const factory TimelineDayDto({
    required DateTime date,
    int? points,
    int? rank,
    String? trend,
  }) = _TimelineDayDto;

  factory TimelineDayDto.fromJson(Map<String, dynamic> json) => _$TimelineDayDtoFromJson(json);
}
