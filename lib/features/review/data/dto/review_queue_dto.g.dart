// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_queue_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewQueueDtoImpl _$$ReviewQueueDtoImplFromJson(Map<String, dynamic> json) =>
    _$ReviewQueueDtoImpl(
      queued: (json['queued'] as List<dynamic>)
          .map((e) => ReviewItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      queuedTotal: (json['queued_total'] as num).toInt(),
      masteredTotal: (json['mastered_total'] as num).toInt(),
    );

Map<String, dynamic> _$$ReviewQueueDtoImplToJson(
        _$ReviewQueueDtoImpl instance) =>
    <String, dynamic>{
      'queued': instance.queued,
      'queued_total': instance.queuedTotal,
      'mastered_total': instance.masteredTotal,
    };

_$ReviewItemDtoImpl _$$ReviewItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$ReviewItemDtoImpl(
      question: json['question'] as String,
      topic: json['topic'] as String,
      wrongCount: (json['wrong_count'] as num).toInt(),
      correctCount: (json['correct_count'] as num).toInt(),
      dueInDays: (json['due_in_days'] as num).toInt(),
    );

Map<String, dynamic> _$$ReviewItemDtoImplToJson(_$ReviewItemDtoImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'topic': instance.topic,
      'wrong_count': instance.wrongCount,
      'correct_count': instance.correctCount,
      'due_in_days': instance.dueInDays,
    };
