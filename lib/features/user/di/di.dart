import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/features/user/data/converter/user_converter.dart';
import 'package:quiz/features/user/data/repository/cached_user_repository.dart';
import 'package:quiz/features/user/data/repository/remote_user_repository.dart';
import 'package:quiz/features/user/domain/repository/fetch_current_user_gateway.dart';
import 'package:quiz/features/user/domain/repository/local_user_repository.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class UserModule {
  UserRepository userRepository({
    required ApiClient client,
    required UserConverter userConverter,
  }) =>
      RemoteUserRepository(
        client: client,
        userConverter: userConverter,
      );

  @lazySingleton
  LocalUserRepository cachedUserRepository(
    SharedPreferences preferences,
    UserConverter converter,
  ) =>
      CachedUserRepository(
        storage: preferences,
        converter: converter,
      );

  @lazySingleton
  FetchCurrentUserGateway fetchUserGateway(
    UserRepository userRepository,
    LocalUserRepository localUserRepository,
  ) =>
      FetchCurrentUserGateway(
        userRepository: userRepository,
        localUserRepository: localUserRepository,
      );
}
