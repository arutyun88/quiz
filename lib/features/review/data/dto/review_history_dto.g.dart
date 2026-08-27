// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewHistoryItemDtoImpl _$$ReviewHistoryItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewHistoryItemDtoImpl(
      attemptId: json['attempt_id'] as String,
      questionId: json['question_id'] as String,
      questionVersionId: json['question_version_id'] as String,
      editionDate: json['edition_date'] as String,
      answeredAt: DateTime.parse(json['answered_at'] as String),
      action: json['action'] as String,
      answerId: json['answer_id'] as String?,
      correctAnswerId: json['correct_answer_id'] as String?,
      question: json['question'] as String?,
      topic: json['topic'] as String?,
      answer: json['answer'] as String?,
      correctAnswer: json['correct_answer'] as String?,
      description: json['description'] as String?,
      hint: json['hint'] as String?,
      hintUsed: json['hint_used'] as bool,
      versionStatus: json['version_status'] as String,
      contentRedacted: json['content_redacted'] as bool,
    );

Map<String, dynamic> _$$ReviewHistoryItemDtoImplToJson(
        _$ReviewHistoryItemDtoImpl instance) =>
    <String, dynamic>{
      'attempt_id': instance.attemptId,
      'question_id': instance.questionId,
      'question_version_id': instance.questionVersionId,
      'edition_date': instance.editionDate,
      'answered_at': instance.answeredAt.toIso8601String(),
      'action': instance.action,
      'answer_id': instance.answerId,
      'correct_answer_id': instance.correctAnswerId,
      'question': instance.question,
      'topic': instance.topic,
      'answer': instance.answer,
      'correct_answer': instance.correctAnswer,
      'description': instance.description,
      'hint': instance.hint,
      'hint_used': instance.hintUsed,
      'version_status': instance.versionStatus,
      'content_redacted': instance.contentRedacted,
    };
