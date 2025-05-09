import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/data/converter/user_statistics_converter.dart';
import 'package:quiz/features/user/data/dto/user_statistics_dto.dart';
import 'package:quiz/features/user/domain/entity/user_statistics_entity.dart';
import 'package:quiz/features/user/domain/repository/user_statistics_repository.dart';

class RemoteUserStatisticsRepository implements UserStatisticsRepository {
  final ApiClient _client;
  final UserStatisticsConverter _userStatisticsConverter;

  const RemoteUserStatisticsRepository({
    required ApiClient client,
    required UserStatisticsConverter userStatisticsConverter,
  })  : _client = client,
        _userStatisticsConverter = userStatisticsConverter;

  @override
  Future<Result<UserStatisticsEntity, Failure>> fetch() async => await _client.get(
        '/user/statistics',
        mapper: (json) => DataDto.fromJson(json, (json) => UserStatisticsDto.fromJson(json as Json)),
        converter: _userStatisticsConverter.convert,
      );
}
