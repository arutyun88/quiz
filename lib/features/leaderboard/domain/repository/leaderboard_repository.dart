import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/season_history_entity.dart';

abstract interface class LeaderboardRepository {
  Future<Result<LeaderboardOverviewEntity, Failure>> fetchCurrentSeason();

  Future<Result<SeasonHistoryPageEntity, Failure>> fetchSeasonHistory({
    required int limit,
    required int offset,
  });
}
