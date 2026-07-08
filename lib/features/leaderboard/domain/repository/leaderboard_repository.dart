import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';

abstract interface class LeaderboardRepository {
  Future<Result<PageEntity<LeaderboardEntity>, Failure>> fetchBoard(LeaderboardPeriod period);

  Future<Result<LeaderboardEntity, Failure>> fetchMyEntry(LeaderboardPeriod period);

  Future<Result<LeaderboardEntity, Failure>> fetchMyLastPeriodEntry(LeaderboardPeriod period);
}
