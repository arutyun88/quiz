import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/data/converter/user_converter.dart';
import 'package:quiz/features/user/data/dto/user_dto.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  final ApiClient _client;
  final UserConverter _userConverter;

  const FirebaseUserRepository({
    required ApiClient client,
    required UserConverter userConverter,
  })  : _client = client,
        _userConverter = userConverter;

  @override
  Future<Result<UserEntity, Failure>> fetch() async => await _client.get(
        '/user',
        mapper: UserDto.fromJson,
        converter: _userConverter.convert,
      );
}
