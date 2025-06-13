// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answered_question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnsweredQuestionDtoImpl _$$AnsweredQuestionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AnsweredQuestionDtoImpl(
      questionId: json['question_id'] as String,
      answerId: json['answer_id'] as String,
      answeredAt: json['answered_at'] == null
          ? null
          : DateTime.parse(json['answered_at'] as String),
    );

Map<String, dynamic> _$$AnsweredQuestionDtoImplToJson(
        _$AnsweredQuestionDtoImpl instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'answer_id': instance.answerId,
      'answered_at': instance.answeredAt?.toIso8601String(),
    };
