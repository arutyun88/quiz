import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/services/firestore_doc_service.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/data/converter/user_converter.dart';
import 'package:quiz/features/user/data/repository/firebase_user_repository.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';

@module
abstract class UserModule {
  UserRepository userRepository() => FirebaseUserRepository(
        firestore: getIt<FirestoreDocService>(),
        userConverter: getIt<UserConverter>(),
      );
}
