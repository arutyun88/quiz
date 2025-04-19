// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionDtoImpl _$$QuestionDtoImplFromJson(Map<String, dynamic> json) =>
    _$QuestionDtoImpl(
      id: json['id'] as String,
      question: json['question'] as String,
      description: json['description'] as String,
      topic: TopicDto.fromJson(json['topic'] as Map<String, dynamic>),
      hint: json['hint'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionDtoImplToJson(_$QuestionDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'description': instance.description,
      'topic': instance.topic,
      'hint': instance.hint,
      'answers': instance.answers,
    };
