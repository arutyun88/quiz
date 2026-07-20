import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_timeline_entity.freezed.dart';

enum RankTrend { up, down, flat }

/// Daily rank history of the current user over a calendar window, newest day first.
///
/// Every day of the window has an entry; days the user did not play carry no rank.
@freezed
class LeaderboardTimelineEntity with _$LeaderboardTimelineEntity {
  const factory LeaderboardTimelineEntity({
    required int? currentRank,
    required int? deltaOverPeriod,
    required List<TimelineDayEntity> days,
  }) = _LeaderboardTimelineEntity;
}

@freezed
class TimelineDayEntity with _$TimelineDayEntity {
  const factory TimelineDayEntity({
    required DateTime date,
    required int? points,
    required int? rank,
    required RankTrend? trend,
  }) = _TimelineDayEntity;

  const TimelineDayEntity._();

  bool get isPlayed => rank != null;
}
