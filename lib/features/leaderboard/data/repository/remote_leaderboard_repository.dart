import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/leaderboard/data/converter/leaderboard_converter.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_dto.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';

class RemoteLeaderboardRepository implements LeaderboardRepository {
  final ApiClient _client;
  final LeaderboardPageConverter _pageConverter;
  final LeaderboardConverter _converter;

  const RemoteLeaderboardRepository({
    required ApiClient client,
    required LeaderboardPageConverter pageConverter,
    required LeaderboardConverter converter,
  })  : _client = client,
        _pageConverter = pageConverter,
        _converter = converter;

  @override
  Future<Result<PageEntity<LeaderboardEntity>, Failure>> fetchBoard(
    LeaderboardPeriod period,
  ) async =>
      await _client.get(
        '/gamification/leaderboard',
        queryParameters: {'period': period.toApiValue()},
        mapper: (json) => DataPageDto.fromJson(
          json,
          (json) => LeaderboardDto.fromJson(json as Json),
        ),
        converter: _pageConverter.convert,
      );

  @override
  Future<Result<LeaderboardEntity, Failure>> fetchMyEntry(
    LeaderboardPeriod period,
  ) async =>
      await _client.get(
        '/gamification/leaderboard/me',
        queryParameters: {'period': period.toApiValue()},
        mapper: (json) => DataDto.fromJson(
          json,
          (json) => LeaderboardDto.fromJson(json as Json),
        ),
        converter: (dto) => _converter.convert(dto.data),
      );

  @override
  Future<Result<LeaderboardEntity, Failure>> fetchMyLastPeriodEntry(
    LeaderboardPeriod period,
  ) async =>
      await _client.get(
        '/gamification/leaderboard/me/history',
        queryParameters: {'period': period.toApiValue()},
        mapper: (json) => DataDto.fromJson(
          json,
          (json) => LeaderboardDto.fromJson(json as Json),
        ),
        converter: (dto) => _converter.convert(dto.data),
      );
}
