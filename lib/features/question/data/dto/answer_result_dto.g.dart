// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerResultDtoImpl _$$AnswerResultDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AnswerResultDtoImpl(
      userAnswerId: json['answer_id'] as String,
      correctAnswerId: json['correct_answer_id'] as String,
      description: json['description'] as String,
      isCorrect: json['is_correct'] as bool,
    );

Map<String, dynamic> _$$AnswerResultDtoImplToJson(
        _$AnswerResultDtoImpl instance) =>
    <String, dynamic>{
      'answer_id': instance.userAnswerId,
      'correct_answer_id': instance.correctAnswerId,
      'description': instance.description,
      'is_correct': instance.isCorrect,
    };
