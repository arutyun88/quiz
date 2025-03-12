import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz/features/authentication/data/repository/firebase_authentication_repository.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';

@module
abstract class AuthenticationModule {
  @lazySingleton
  AuthenticationRepository repository() => FirebaseAuthenticationRepository(
        auth: FirebaseAuth.instance,
      );
}
