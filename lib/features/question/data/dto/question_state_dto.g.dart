// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_state_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionStateDtoImpl _$$QuestionStateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionStateDtoImpl(
      questionId: json['question_id'] as String,
      isAnswered: json['is_answered'] as bool,
    );

Map<String, dynamic> _$$QuestionStateDtoImplToJson(
        _$QuestionStateDtoImpl instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'is_answered': instance.isAnswered,
    };
