import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';

abstract interface class UserUpdateRepository {
  Future<Result<void, Failure>> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  });
}
