import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/data/converter/age_access_converter.dart';
import 'package:quiz/features/user/data/dto/age_access_dto.dart';
import 'package:quiz/features/user/domain/entity/age_access_entity.dart';
import 'package:quiz/features/user/domain/repository/age_access_repository.dart';

@LazySingleton(as: AgeAccessRepository)
final class RemoteAgeAccessRepository implements AgeAccessRepository {
  const RemoteAgeAccessRepository({required ApiClient client})
      : _client = client;

  final ApiClient _client;

  @override
  Future<Result<AgeAccessEntity, Failure>> fetch() async => await _client.get(
        '/user/age-access',
        mapper: _mapResponse,
        converter: _convertResponse,
      );

  @override
  Future<Result<AgeAccessEntity, Failure>> confirm({
    required String policyVersion,
  }) async =>
      await _client.post(
        '/user/adult-content/confirm',
        body: {'policyVersion': policyVersion},
        mapper: _mapResponse,
        converter: _convertResponse,
      );

  @override
  Future<Result<AgeAccessEntity, Failure>> revoke() async => await _client.post(
        '/user/adult-content/revoke',
        mapper: _mapResponse,
        converter: _convertResponse,
      );

  static DataDto<AgeAccessDto> _mapResponse(Json json) =>
      DataDto.fromJson(json, (data) => AgeAccessDto.fromJson(data as Json));

  static AgeAccessEntity _convertResponse(DataDto<AgeAccessDto> dto) =>
      dto.data.toEntity();
}
