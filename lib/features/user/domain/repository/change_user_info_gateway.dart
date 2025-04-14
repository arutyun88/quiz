import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';

class ChangeUserInfoGateway {
  final UserRepository _userRepository;

  const ChangeUserInfoGateway({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<Result<void, Failure>> call({
    String? name,
    DateTime? birthDate,
  }) async {
    return await _userRepository.update(
      name: name,
      birthDate: birthDate,
    );
  }
}
