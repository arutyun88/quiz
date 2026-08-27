import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/leaderboard/data/converter/leaderboard_converter.dart';
import 'package:quiz/features/leaderboard/data/converter/season_history_converter.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_dto.dart';
import 'package:quiz/features/leaderboard/data/dto/season_history_dto.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/season_history_entity.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';

class RemoteLeaderboardRepository implements LeaderboardRepository {
  final ApiClient _client;
  final LeaderboardConverter _converter;

  const RemoteLeaderboardRepository({
    required ApiClient client,
    required LeaderboardConverter converter,
  })  : _client = client,
        _converter = converter;

  @override
  Future<Result<LeaderboardOverviewEntity, Failure>>
      fetchCurrentSeason() async {
    final pageResult = await _client.get(
      '/gamification/leaderboard',
      queryParameters: const {'limit': 100, 'offset': 0},
      mapper: (json) => DataPageDto.fromJson(
        json,
        (json) => LeaderboardDto.fromJson(json as Json),
      ),
      converter: (dto) => dto,
    );

    final DataPageDto<LeaderboardDto> page;
    switch (pageResult) {
      case ResultOk(data: final data):
        page = data;
      case ResultFailed(error: final failure):
        return Result.failed(failure);
    }
    final meResult = await _client.get(
      '/gamification/leaderboard/me',
      mapper: (json) => DataDto.fromJson(
        json,
        (json) => LeaderboardDto.fromJson(json as Json),
      ),
      converter: (dto) => _converter.convert(dto.data),
    );

    return switch (meResult) {
      ResultOk(data: final me) => Result.ok(
          LeaderboardOverviewEntity(
            entries: _converter.convertMultiple(page.data).toList(),
            me: me,
            total: page.meta.total,
          ),
        ),
      ResultFailed(error: final failure) => Result.failed(failure),
    };
  }

  @override
  Future<Result<SeasonHistoryPageEntity, Failure>> fetchSeasonHistory({
    required int limit,
    required int offset,
  }) async =>
      await _client.get(
        '/gamification/leaderboard/me/seasons',
        queryParameters: {'limit': limit, 'offset': offset},
        mapper: (json) => DataPageDto.fromJson(
          json,
          (json) => SeasonHistoryDto.fromJson(json as Json),
        ),
        converter: (page) => SeasonHistoryPageEntity(
          items: page.data.map((item) => item.toEntity()).toList(),
          total: page.meta.total,
        ),
      );
}
