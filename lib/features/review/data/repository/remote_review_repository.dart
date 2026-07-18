import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/review/data/converter/review_queue_converter.dart';
import 'package:quiz/features/review/data/dto/review_queue_dto.dart';
import 'package:quiz/features/review/domain/entity/review_queue_entity.dart';
import 'package:quiz/features/review/domain/repository/review_repository.dart';

class RemoteReviewRepository implements ReviewRepository {
  final ApiClient _client;
  final ReviewQueueConverter _reviewQueueConverter;

  RemoteReviewRepository({
    required ApiClient client,
    required ReviewQueueConverter reviewQueueConverter,
  })  : _client = client,
        _reviewQueueConverter = reviewQueueConverter;

  @override
  Future<Result<ReviewQueueEntity, Failure>> fetch() async => await _client.get(
        '/questions/review',
        mapper: (json) => DataDto.fromJson(json, (json) => ReviewQueueDto.fromJson(json as Json)),
        converter: _reviewQueueConverter.convert,
        enableLocale: true,
      );
}
