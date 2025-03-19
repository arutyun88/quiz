import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/data/repository/firebase_authentication_repository.dart';
import 'package:quiz/features/authentication/data/repository/password_reset_gateway_impl.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';
import 'package:quiz/features/authentication/domain/repository/password_reset_gateway.dart';

@module
abstract class AuthenticationModule {
  @lazySingleton
  AuthenticationRepository repository() => FirebaseAuthenticationRepository(
        auth: FirebaseAuth.instance,
      );

  @lazySingleton
  PasswordResetGateway passwordResetGateway() => PasswordResetGatewayImpl(
        repository: getIt<AuthenticationRepository>(),
      );
}
