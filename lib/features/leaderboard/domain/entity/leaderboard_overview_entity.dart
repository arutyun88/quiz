import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';

part 'leaderboard_overview_entity.freezed.dart';

@freezed
class LeaderboardOverviewEntity with _$LeaderboardOverviewEntity {
  const factory LeaderboardOverviewEntity({
    required List<LeaderboardEntity> top,
    LeaderboardEntity? me,
    required List<LeaderboardEntity> around,
    LeaderboardEntity? previousMe,
    required int total,
  }) = _LeaderboardOverviewEntity;
}
