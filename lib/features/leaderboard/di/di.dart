import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/features/leaderboard/data/converter/leaderboard_converter.dart';
import 'package:quiz/features/leaderboard/data/converter/leaderboard_timeline_converter.dart';
import 'package:quiz/features/leaderboard/data/repository/remote_leaderboard_repository.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';

@module
abstract class LeaderboardModule {
  @lazySingleton
  LeaderboardRepository leaderboardRepository({
    required ApiClient client,
    required LeaderboardConverter converter,
    required LeaderboardOverviewConverter overviewConverter,
    required LeaderboardTimelineConverter timelineConverter,
  }) =>
      RemoteLeaderboardRepository(
        client: client,
        converter: converter,
        overviewConverter: overviewConverter,
        timelineConverter: timelineConverter,
      );
}
