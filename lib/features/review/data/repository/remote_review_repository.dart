import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/review/data/converter/review_history_converter.dart';
import 'package:quiz/features/review/data/dto/review_history_dto.dart';
import 'package:quiz/features/review/domain/entity/review_history_entity.dart';
import 'package:quiz/features/review/domain/repository/review_repository.dart';

class RemoteReviewRepository implements ReviewRepository {
  final ApiClient _client;
  final ReviewHistoryConverter _reviewHistoryConverter;

  RemoteReviewRepository({
    required ApiClient client,
    required ReviewHistoryConverter reviewHistoryConverter,
  })  : _client = client,
        _reviewHistoryConverter = reviewHistoryConverter;

  @override
  Future<Result<ReviewHistoryEntity, Failure>> fetch({
    required int limit,
    required int offset,
  }) async =>
      await _client.get(
        '/questions/review/history',
        queryParameters: {'limit': limit, 'offset': offset},
        mapper: (json) => DataPageDto.fromJson(
          json,
          (json) => ReviewHistoryItemDto.fromJson(json as Json),
        ),
        converter: _reviewHistoryConverter.convert,
        enableLocale: true,
      );
}
