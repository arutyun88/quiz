import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/local_user_repository.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';

class FetchCurrentUserGateway {
  final UserRepository _userRepository;
  final LocalUserRepository _localUserRepository;

  FetchCurrentUserGateway({
    required UserRepository userRepository,
    required LocalUserRepository localUserRepository,
  })  : _userRepository = userRepository,
        _localUserRepository = localUserRepository;

  Future<Result<UserEntity, Failure>> call() async {
    final rUser = await _userRepository.fetch();

    switch (rUser) {
      case ResultOk(data: final user):
        _localUserRepository.saveUser(user);

        return Result.ok(user);

      case ResultFailed(error: final failure):
        final cUser = await _localUserRepository.fetchUser();

        if (cUser case UserEntity user) {
          return Result.ok(user);
        }

        return Result.failed(failure);
    }
  }
}
