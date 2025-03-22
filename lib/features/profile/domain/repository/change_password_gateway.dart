import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/profile/domain/repository/user_update_repository.dart';

class ChangePasswordGateway {
  final UserUpdateRepository _userUpdateRepository;

  const ChangePasswordGateway({
    required UserUpdateRepository userUpdateRepository,
  }) : _userUpdateRepository = userUpdateRepository;

  Future<Result<void, Failure>> call({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    return await _userUpdateRepository.changePassword(
      email: email,
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
