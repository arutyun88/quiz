import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/data/repository/remote_authentication_repository.dart';
import 'package:quiz/features/authentication/data/repository/password_reset_gateway_impl.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';
import 'package:quiz/features/authentication/domain/repository/password_reset_gateway.dart';

@module
abstract class AuthenticationModule {
  @lazySingleton
  AuthenticationRepository repository({
    required ApiClient client,
  }) =>
      RemoteAuthenticationRepository(
        client: client,
      );

  @lazySingleton
  PasswordResetGateway passwordResetGateway() => PasswordResetGatewayImpl(
        repository: getIt<AuthenticationRepository>(),
      );
}
