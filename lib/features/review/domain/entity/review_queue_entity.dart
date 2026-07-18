import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_queue_entity.freezed.dart';

@freezed
class ReviewQueueEntity with _$ReviewQueueEntity {
  const factory ReviewQueueEntity({
    required List<ReviewItemEntity> queued,
    required int queuedTotal,
    required int masteredTotal,
  }) = _ReviewQueueEntity;
}

@freezed
class ReviewItemEntity with _$ReviewItemEntity {
  const factory ReviewItemEntity({
    required String question,
    required String topic,
    required int wrongCount,
    required int correctCount,
    required int dueInDays,
  }) = _ReviewItemEntity;
}
