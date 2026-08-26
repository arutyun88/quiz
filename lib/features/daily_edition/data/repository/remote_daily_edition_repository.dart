import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/daily_edition/data/converter/daily_edition_converter.dart';
import 'package:quiz/features/daily_edition/data/dto/daily_edition_dto.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/features/daily_edition/domain/repository/daily_edition_repository.dart';

@LazySingleton(as: DailyEditionRepository)
class RemoteDailyEditionRepository implements DailyEditionRepository {
  const RemoteDailyEditionRepository({required ApiClient client})
      : _client = client;

  final ApiClient _client;

  @override
  Future<Result<DailyRunEntity, Failure>> open({String? timezoneId}) async =>
      await _client.post(
        '/daily-editions/open',
        headers: timezoneId == null ? null : {'X-Timezone': timezoneId},
        mapper: (json) => DataDto.fromJson(
            json, (data) => DailyOpenDto.fromJson(data as Json)),
        converter: (dto) => dto.data.toEntity(),
      );

  @override
  Future<Result<DailyAssignmentEntity, Failure>> fetchCurrent(
          String runId) async =>
      await _client.get(
        '/daily-editions/$runId/current',
        mapper: (json) => DataDto.fromJson(
            json, (data) => DailyAssignmentDto.fromJson(data as Json)),
        converter: (dto) => dto.data.toEntity(),
        enableLocale: true,
      );

  @override
  Future<Result<DailyRunEntity, Failure>> close(String runId) async =>
      await _client.post(
        '/daily-editions/$runId/close',
        mapper: (json) => DataDto.fromJson(
            json, (data) => DailyOpenDto.fromJson(data as Json)),
        converter: (dto) => dto.data.toEntity(),
      );

  @override
  Future<Result<DailyHintEntity, Failure>> useHint({
    required String runId,
    required String assignmentId,
  }) async =>
      await _client.post(
        '/daily-editions/$runId/assignments/$assignmentId/hint',
        mapper: (json) => DataDto.fromJson(
            json, (data) => DailyHintDto.fromJson(data as Json)),
        converter: (dto) => dto.data.toEntity(),
        enableLocale: true,
      );

  @override
  Future<Result<DailyAttemptEntity, Failure>> submitAttempt({
    required String runId,
    required String assignmentId,
    required String clientEventId,
    required DailyAttemptAction action,
    String? answerId,
  }) async =>
      await _client.post(
        '/daily-editions/$runId/attempts',
        body: DailyAttemptRequestDto(
          clientEventId: clientEventId,
          assignmentId: assignmentId,
          action: action.apiValue,
          answerId: answerId,
        ).toJson(),
        mapper: (json) => DataDto.fromJson(
            json, (data) => DailyAttemptDto.fromJson(data as Json)),
        converter: (dto) => dto.data.toEntity(),
        enableLocale: true,
      );

  @override
  Future<Result<DailySummaryEntity, Failure>> fetchSummary(
          String runId) async =>
      await _client.get(
        '/daily-editions/$runId/summary',
        mapper: (json) => DataDto.fromJson(
            json, (data) => DailySummaryDto.fromJson(data as Json)),
        converter: (dto) => dto.data.toEntity(),
      );

  @override
  Future<Result<DailyContinuationEntity, Failure>> fetchContinuation(
    String runId,
  ) async =>
      await _client.get(
        '/daily-editions/$runId/continuation',
        mapper: (json) => DataDto.fromJson(
          json,
          (data) => DailyContinuationDto.fromJson(data as Json),
        ),
        converter: (dto) => dto.data.toEntity(),
      );

  @override
  Future<Result<RewardedAdEntity, Failure>> confirmRewardedAd({
    required String runId,
    required String clientEventId,
    required String providerEventId,
    required String verificationToken,
  }) async =>
      await _client.post(
        '/daily-editions/$runId/rewarded-ads',
        body: RewardedAdRequestDto(
          clientEventId: clientEventId,
          providerEventId: providerEventId,
          verificationToken: verificationToken,
        ).toJson(),
        mapper: (json) => DataDto.fromJson(
            json, (data) => RewardedAdDto.fromJson(data as Json)),
        converter: (dto) => dto.data.toEntity(),
      );
}
