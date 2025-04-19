import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_dto.freezed.dart';
part 'topic_dto.g.dart';

@freezed
class TopicDto with _$TopicDto {
  const factory TopicDto({
    required String id,
    required String name,
    required String description,
  }) = _TopicDto;

  factory TopicDto.fromJson(Map<String, dynamic> json) => _$TopicDtoFromJson(json);
}
