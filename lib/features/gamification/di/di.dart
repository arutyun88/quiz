import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/features/gamification/data/converter/user_level_converter.dart';
import 'package:quiz/features/gamification/data/repository/remote_gamification_repository.dart';
import 'package:quiz/features/gamification/domain/repository/gamification_repository.dart';

@module
abstract class GamificationModule {
  @lazySingleton
  GamificationRepository gamificationRepository(
    ApiClient client,
    UserLevelConverter userLevelConverter,
  ) =>
      RemoteGamificationRepository(
        client: client,
        userLevelConverter: userLevelConverter,
      );
}
