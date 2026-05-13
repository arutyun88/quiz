import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/gamification/data/converter/user_level_converter.dart';
import 'package:quiz/features/gamification/data/dto/user_level_dto.dart';
import 'package:quiz/features/gamification/domain/entity/user_level_entity.dart';
import 'package:quiz/features/gamification/domain/repository/gamification_repository.dart';

class RemoteGamificationRepository implements GamificationRepository {
  final ApiClient _client;
  final UserLevelConverter _userLevelConverter;

  const RemoteGamificationRepository({
    required ApiClient client,
    required UserLevelConverter userLevelConverter,
  })  : _client = client,
        _userLevelConverter = userLevelConverter;

  @override
  Future<Result<UserLevelEntity, Failure>> fetchLevel() async => await _client.get(
        '/gamification/level',
        mapper: (json) => DataDto.fromJson(json, (json) => UserLevelDto.fromJson(json as Json)),
        converter: _userLevelConverter.convert,
      );
}
