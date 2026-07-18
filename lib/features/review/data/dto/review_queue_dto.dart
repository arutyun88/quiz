import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_queue_dto.freezed.dart';
part 'review_queue_dto.g.dart';

@freezed
class ReviewQueueDto with _$ReviewQueueDto {
  const factory ReviewQueueDto({
    required List<ReviewItemDto> queued,
    @JsonKey(name: 'queued_total') required int queuedTotal,
    @JsonKey(name: 'mastered_total') required int masteredTotal,
  }) = _ReviewQueueDto;

  factory ReviewQueueDto.fromJson(Map<String, dynamic> json) => _$ReviewQueueDtoFromJson(json);
}

@freezed
class ReviewItemDto with _$ReviewItemDto {
  const factory ReviewItemDto({
    required String question,
    required String topic,
    @JsonKey(name: 'wrong_count') required int wrongCount,
    @JsonKey(name: 'correct_count') required int correctCount,
    @JsonKey(name: 'due_in_days') required int dueInDays,
  }) = _ReviewItemDto;

  factory ReviewItemDto.fromJson(Map<String, dynamic> json) => _$ReviewItemDtoFromJson(json);
}
