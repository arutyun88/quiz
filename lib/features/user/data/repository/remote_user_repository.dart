import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/data/converter/user_converter.dart';
import 'package:quiz/features/user/data/dto/user_dto.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';

class RemoteUserRepository implements UserRepository {
  final ApiClient _client;
  final UserConverter _userConverter;

  const RemoteUserRepository({
    required ApiClient client,
    required UserConverter userConverter,
  })  : _client = client,
        _userConverter = userConverter;

  @override
  Future<Result<UserEntity, Failure>> fetch() async => await _client.get(
        '/user',
        mapper: (json) => DataDto.fromJson(json, (json) => UserDto.fromJson(json as Json)),
        converter: _userConverter.convert,
      );

  @override
  Future<Result<UserEntity, Failure>> update({
    String? name,
    DateTime? birthDate,
  }) async {
    return await _client.post(
      '/user',
      body: {
        'name': name,
        'birth_date': birthDate?.toString(),
      },
      mapper: (json) => DataDto.fromJson(json, (json) => UserDto.fromJson(json as Json)),
      converter: _userConverter.convert,
    );
  }

  @override
  Future<Result<void, Failure>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return await _client.post(
      '/user/password',
      body: {
        'old_password': oldPassword,
        'new_password': newPassword,
      },
    );
  }
}
