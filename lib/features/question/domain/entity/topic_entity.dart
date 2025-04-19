import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_entity.freezed.dart';

@freezed
class TopicEntity with _$TopicEntity {
  const factory TopicEntity({
    required String id,
    required String name,
    required String description,
  }) = _TopicEntity;
}
