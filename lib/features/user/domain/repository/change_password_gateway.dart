import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';

class ChangePasswordGateway {
  final UserRepository _userRepository;

  const ChangePasswordGateway({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<Result<void, Failure>> call({
    required String oldPassword,
    required String newPassword,
  }) async {
    return await _userRepository.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
