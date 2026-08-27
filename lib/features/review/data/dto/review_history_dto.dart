import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_history_dto.freezed.dart';
part 'review_history_dto.g.dart';

@freezed
class ReviewHistoryItemDto with _$ReviewHistoryItemDto {
  const factory ReviewHistoryItemDto({
    @JsonKey(name: 'attempt_id') required String attemptId,
    @JsonKey(name: 'question_id') required String questionId,
    @JsonKey(name: 'question_version_id') required String questionVersionId,
    @JsonKey(name: 'edition_date') required String editionDate,
    @JsonKey(name: 'answered_at') required DateTime answeredAt,
    required String action,
    @JsonKey(name: 'answer_id') required String? answerId,
    @JsonKey(name: 'correct_answer_id') required String? correctAnswerId,
    required String? question,
    required String? topic,
    required String? answer,
    @JsonKey(name: 'correct_answer') required String? correctAnswer,
    required String? description,
    required String? hint,
    @JsonKey(name: 'hint_used') required bool hintUsed,
    @JsonKey(name: 'version_status') required String versionStatus,
    @JsonKey(name: 'content_redacted') required bool contentRedacted,
  }) = _ReviewHistoryItemDto;

  factory ReviewHistoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewHistoryItemDtoFromJson(json);
}
