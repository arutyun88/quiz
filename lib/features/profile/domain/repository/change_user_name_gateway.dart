import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/profile/domain/repository/user_update_repository.dart';

class ChangeUserNameGateway {
  final UserUpdateRepository _userUpdateRepository;

  const ChangeUserNameGateway({
    required UserUpdateRepository userUpdateRepository,
  }) : _userUpdateRepository = userUpdateRepository;

  Future<Result<void, Failure>> call({
    required String name,
  }) async {
    return await _userUpdateRepository.changeName(
      name: name,
    );
  }
}
