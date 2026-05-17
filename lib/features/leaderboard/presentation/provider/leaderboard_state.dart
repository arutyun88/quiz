import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';

part 'leaderboard_state.freezed.dart';

@freezed
class LeaderboardData with _$LeaderboardData {
  const factory LeaderboardData({
    required LeaderboardPeriod period,
    required List<LeaderboardEntity> entries,
    LeaderboardEntity? myEntry,
  }) = _LeaderboardData;
}
