import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/database/converter/db_converter.dart';
import 'package:quiz/features/question/domain/entity/topic_entity.dart';

typedef TopicDbConverter = DbConverter<TopicEntity, Topic>;

@Injectable(as: TopicDbConverter)
final class TopicDbConverterImpl extends TopicDbConverter {
  @override
  Topic toDao(TopicEntity entity) {
    return Topic(
      id: entity.id,
      name: entity.name,
      description: entity.description,
    );
  }

  @override
  TopicEntity toEntity(Topic dao) {
    return TopicEntity(
      id: dao.id,
      name: dao.name,
      description: dao.description,
    );
  }
}
