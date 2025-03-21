import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz/features/profile/data/repository/firebase_user_update_repository.dart';
import 'package:quiz/features/profile/domain/repository/user_update_repository.dart';

@module
abstract class ProfileModule {
  @lazySingleton
  UserUpdateRepository userUpdateRepository() => FirebaseUserUpdateRepository(
        auth: FirebaseAuth.instance,
      );
}
