import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';

abstract interface class AuthenticationRepository {
  Result<String, Failure> reload();

  Future<Result<String, Failure>> registerWithEmail({
    required String email,
    required String password,
  });

  Future<Result<String, Failure>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<void> logout();
}
