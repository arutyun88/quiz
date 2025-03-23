import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/services/firestore_doc_service.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/profile/data/repository/firebase_user_update_repository.dart';
import 'package:quiz/features/profile/domain/repository/change_password_gateway.dart';
import 'package:quiz/features/profile/domain/repository/change_user_name_gateway.dart';
import 'package:quiz/features/profile/domain/repository/user_update_repository.dart';

@module
abstract class ProfileModule {
  @lazySingleton
  UserUpdateRepository userUpdateRepository() => FirebaseUserUpdateRepository(
        auth: FirebaseAuth.instance,
        firestore: getIt<FirestoreDocService>(),
      );

  @lazySingleton
  ChangePasswordGateway changePasswordGateway() => ChangePasswordGateway(
        userUpdateRepository: getIt<UserUpdateRepository>(),
      );

  @lazySingleton
  ChangeUserNameGateway changeUserNameGateway() => ChangeUserNameGateway(
        userUpdateRepository: getIt<UserUpdateRepository>(),
      );
}
