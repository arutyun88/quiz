// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerDtoImpl _$$AnswerDtoImplFromJson(Map<String, dynamic> json) =>
    _$AnswerDtoImpl(
      id: json['id'] as String,
      isCorrect: json['is_correct'] as bool,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$$AnswerDtoImplToJson(_$AnswerDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_correct': instance.isCorrect,
      'answer': instance.answer,
    };
