import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';

abstract interface class PasswordResetGateway {
  Future<Result<void, Failure>> sendPasswordResetEmail(String email);
}
