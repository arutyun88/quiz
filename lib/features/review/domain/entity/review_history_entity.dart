import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_history_entity.freezed.dart';

enum ReviewVersionStatus { current, updated, withdrawn, unknown }

@freezed
class ReviewHistoryEntity with _$ReviewHistoryEntity {
  const factory ReviewHistoryEntity({
    required List<ReviewHistoryItemEntity> items,
    required int total,
    required int offset,
    required int limit,
  }) = _ReviewHistoryEntity;
}

@freezed
class ReviewHistoryItemEntity with _$ReviewHistoryItemEntity {
  const factory ReviewHistoryItemEntity({
    required String attemptId,
    required String questionId,
    required String questionVersionId,
    required String editionDate,
    required DateTime answeredAt,
    required String action,
    required String? answerId,
    required String? correctAnswerId,
    required String? question,
    required String? topic,
    required String? answer,
    required String? correctAnswer,
    required String? description,
    required String? hint,
    required bool hintUsed,
    required ReviewVersionStatus versionStatus,
    required bool contentRedacted,
  }) = _ReviewHistoryItemEntity;
}
