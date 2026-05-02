import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_page_converter.dart';
import 'package:quiz/app/core/model/data_page/page_info_converter.dart';
import 'package:quiz/features/achievements/data/converter/user_achievement_converter.dart';
import 'package:quiz/features/achievements/data/repository/remote_user_achievement_repository.dart';
import 'package:quiz/features/achievements/domain/repository/user_achievement_repository.dart';

@module
abstract class AchievementsModule {
  @Injectable()
  UserAchievementPageConverter userAchievementPageConverter(
    UserAchievementConverter userAchievementConverter,
    PageInfoConverter pageInfoConverter,
  ) {
    return DataPageConverter(
      pageInfoConverter: pageInfoConverter,
      dataConverter: userAchievementConverter,
    );
  }

  @lazySingleton
  UserAchievementRepository userAchievementRepository({
    required ApiClient client,
    required UserAchievementPageConverter userAchievementPageConverter,
  }) =>
      RemoteUserAchievementRepository(
        client: client,
        userAchievementPageConverter: userAchievementPageConverter,
      );
}
