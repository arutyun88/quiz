import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/question/data/dto/topic_dto.dart';
import 'package:quiz/features/question/domain/entity/topic_entity.dart';

typedef TopicConverter = DtoConverter<TopicEntity, TopicDto>;

@Injectable(as: TopicConverter)
final class TopicConverterImpl extends TopicConverter {
  @override
  TopicEntity convert(TopicDto dto) {
    return TopicEntity(
      id: dto.id,
      name: dto.name,
      description: dto.description,
    );
  }
}
