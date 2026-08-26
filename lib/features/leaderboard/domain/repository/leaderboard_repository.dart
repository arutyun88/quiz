import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';

abstract interface class LeaderboardRepository {
  Future<Result<LeaderboardOverviewEntity, Failure>> fetchCurrentSeason();
}
