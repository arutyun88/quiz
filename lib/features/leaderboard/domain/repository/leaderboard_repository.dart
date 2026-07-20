import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_timeline_entity.dart';

abstract interface class LeaderboardRepository {
  Future<Result<LeaderboardOverviewEntity, Failure>> fetchOverview(LeaderboardPeriod period);

  Future<Result<LeaderboardEntity, Failure>> fetchMyLastPeriodEntry(LeaderboardPeriod period);

  Future<Result<LeaderboardTimelineEntity, Failure>> fetchTimeline({int days});
}
