import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/leaderboard/data/converter/leaderboard_converter.dart';
import 'package:quiz/features/leaderboard/data/converter/leaderboard_timeline_converter.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_dto.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_overview_dto.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_timeline_dto.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_timeline_entity.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';

class RemoteLeaderboardRepository implements LeaderboardRepository {
  final ApiClient _client;
  final LeaderboardConverter _converter;
  final LeaderboardOverviewConverter _overviewConverter;
  final LeaderboardTimelineConverter _timelineConverter;

  const RemoteLeaderboardRepository({
    required ApiClient client,
    required LeaderboardConverter converter,
    required LeaderboardOverviewConverter overviewConverter,
    required LeaderboardTimelineConverter timelineConverter,
  })  : _client = client,
        _converter = converter,
        _overviewConverter = overviewConverter,
        _timelineConverter = timelineConverter;

  @override
  Future<Result<LeaderboardOverviewEntity, Failure>> fetchOverview(
    LeaderboardPeriod period,
  ) async =>
      await _client.get(
        '/gamification/leaderboard/overview',
        queryParameters: {'period': period.toApiValue()},
        mapper: (json) => DataDto.fromJson(
          json,
          (json) => LeaderboardOverviewDto.fromJson(json as Json),
        ),
        converter: (dto) => _overviewConverter.convert(dto.data),
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

  @override
  Future<Result<LeaderboardTimelineEntity, Failure>> fetchTimeline({
    int days = 14,
  }) async =>
      await _client.get(
        '/gamification/leaderboard/me/timeline',
        queryParameters: {'days': days},
        mapper: (json) => DataDto.fromJson(
          json,
          (json) => LeaderboardTimelineDto.fromJson(json as Json),
        ),
        converter: _timelineConverter.convert,
      );
}
