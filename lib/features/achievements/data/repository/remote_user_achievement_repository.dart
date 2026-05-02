import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/achievements/data/converter/user_achievement_converter.dart';
import 'package:quiz/features/achievements/data/dto/user_achievement_dto.dart';
import 'package:quiz/features/achievements/domain/entity/user_achievement_entity.dart';
import 'package:quiz/features/achievements/domain/repository/user_achievement_repository.dart';

class RemoteUserAchievementRepository implements UserAchievementRepository {
  final ApiClient _client;
  final UserAchievementPageConverter _userAchievementPageConverter;

  RemoteUserAchievementRepository({
    required ApiClient client,
    required UserAchievementPageConverter userAchievementPageConverter,
  })  : _client = client,
        _userAchievementPageConverter = userAchievementPageConverter;

  @override
  Future<Result<PageEntity<UserAchievementEntity>, Failure>> fetch() async => await _client.get(
        '/user/achievements',
        mapper: (json) => DataPageDto.fromJson(json, (json) => UserAchievementDto.fromJson(json as Json)),
        converter: _userAchievementPageConverter.convert,
        enableLocale: true,
      );

  @override
  Future<Result<PageEntity<UserAchievementEntity>, Failure>> fetchByUserId(String userId) async => await _client.get(
        '/user/$userId/achievements',
        mapper: (json) => DataPageDto.fromJson(json, (json) => UserAchievementDto.fromJson(json as Json)),
        converter: _userAchievementPageConverter.convert,
        enableLocale: true,
      );
}
