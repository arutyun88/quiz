import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_page_converter.dart';
import 'package:quiz/app/core/model/data_page/page_info_converter.dart';
import 'package:quiz/features/leaderboard/data/converter/leaderboard_converter.dart';
import 'package:quiz/features/leaderboard/data/repository/remote_leaderboard_repository.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';

@module
abstract class LeaderboardModule {
  @Injectable()
  LeaderboardPageConverter leaderboardEntryPageConverter(
    LeaderboardConverter converter,
    PageInfoConverter pageInfoConverter,
  ) {
    return DataPageConverter(
      pageInfoConverter: pageInfoConverter,
      dataConverter: converter,
    );
  }

  @lazySingleton
  LeaderboardRepository leaderboardRepository({
    required ApiClient client,
    required LeaderboardPageConverter pageConverter,
    required LeaderboardConverter converter,
  }) =>
      RemoteLeaderboardRepository(
        client: client,
        pageConverter: pageConverter,
        converter: converter,
      );
}
