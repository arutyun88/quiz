import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/profile/domain/repository/user_update_repository.dart';

class ChangeUserInfoGateway {
  final UserUpdateRepository _userUpdateRepository;

  const ChangeUserInfoGateway({
    required UserUpdateRepository userUpdateRepository,
  }) : _userUpdateRepository = userUpdateRepository;

  Future<Result<void, Failure>> call({
    String? name,
    DateTime? birthDate,
  }) async {
    return await _userUpdateRepository.changeInfo(
      name: name,
      birthDate: birthDate,
    );
  }
}
