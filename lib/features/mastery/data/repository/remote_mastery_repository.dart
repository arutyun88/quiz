import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/mastery/data/converter/mastery_converter.dart';
import 'package:quiz/features/mastery/data/dto/mastery_dto.dart';
import 'package:quiz/features/mastery/domain/entity/mastery_entity.dart';
import 'package:quiz/features/mastery/domain/repository/mastery_repository.dart';

class RemoteMasteryRepository implements MasteryRepository {
  final ApiClient _client;
  final MasteryConverter _masteryConverter;

  RemoteMasteryRepository({
    required ApiClient client,
    required MasteryConverter masteryConverter,
  })  : _client = client,
        _masteryConverter = masteryConverter;

  @override
  Future<Result<MasteryEntity, Failure>> fetch() async => await _client.get(
        '/gamification/mastery',
        mapper: (json) => DataDto.fromJson(json, (json) => MasteryDto.fromJson(json as Json)),
        converter: _masteryConverter.convert,
        enableLocale: true,
      );
}
