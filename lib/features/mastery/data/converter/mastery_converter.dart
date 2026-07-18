import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/mastery/data/dto/mastery_dto.dart';
import 'package:quiz/features/mastery/domain/entity/mastery_entity.dart';

typedef MasteryConverter = DtoConverter<MasteryEntity, DataDto<MasteryDto>>;

@Injectable(as: MasteryConverter)
final class MasteryConverterImpl extends MasteryConverter {
  @override
  MasteryEntity convert(DataDto<MasteryDto> dto) {
    return MasteryEntity(
      topics: dto.data.topics.map(_convertTopic).toList(),
      weakest: dto.data.weakest == null ? null : _convertTopic(dto.data.weakest!),
      weeklyAccuracyDelta: dto.data.weeklyAccuracyDelta,
      bestDayOfWeek: dto.data.bestDayOfWeek,
    );
  }

  MasteryTopicEntity _convertTopic(MasteryTopicDto dto) {
    return MasteryTopicEntity(
      name: dto.name,
      accuracy: dto.accuracy,
      answers: dto.answers,
    );
  }
}
