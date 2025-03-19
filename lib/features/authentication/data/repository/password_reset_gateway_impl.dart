import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/authentication/domain/repository/authentication_repository.dart';
import 'package:quiz/features/authentication/domain/repository/password_reset_gateway.dart';

class PasswordResetGatewayImpl implements PasswordResetGateway {
  final AuthenticationRepository _repository;

  PasswordResetGatewayImpl({
    required AuthenticationRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<void, Failure>> sendPasswordResetEmail(String email) => _repository.sendPasswordResetEmail(email);
}
