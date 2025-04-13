import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/services/firestore_doc_service.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/user/data/converter/user_converter.dart';
import 'package:quiz/features/user/data/repository/cached_user_repository.dart';
import 'package:quiz/features/user/data/repository/firebase_user_repository.dart';
import 'package:quiz/features/user/domain/repository/fetch_current_user_gateway.dart';
import 'package:quiz/features/user/domain/repository/local_user_repository.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class UserModule {
  UserRepository userRepository() => FirebaseUserRepository(
        firestore: getIt<FirestoreDocService>(),
        userConverter: getIt<UserConverter>(),
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
