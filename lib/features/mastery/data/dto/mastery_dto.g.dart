// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastery_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MasteryDtoImpl _$$MasteryDtoImplFromJson(Map<String, dynamic> json) =>
    _$MasteryDtoImpl(
      topics: (json['topics'] as List<dynamic>)
          .map((e) => MasteryTopicDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      weakest: json['weakest'] == null
          ? null
          : MasteryTopicDto.fromJson(json['weakest'] as Map<String, dynamic>),
      weeklyAccuracyDelta: (json['weekly_accuracy_delta'] as num?)?.toDouble(),
      bestDayOfWeek: (json['best_day_of_week'] as num?)?.toInt(),
      dailyAccuracy: (json['daily_accuracy'] as List<dynamic>?)
              ?.map((e) => MasteryDayDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      bestDay: json['best_day'] == null
          ? null
          : MasteryBestDayDto.fromJson(
              json['best_day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MasteryDtoImplToJson(_$MasteryDtoImpl instance) =>
    <String, dynamic>{
      'topics': instance.topics,
      'weakest': instance.weakest,
      'weekly_accuracy_delta': instance.weeklyAccuracyDelta,
      'best_day_of_week': instance.bestDayOfWeek,
      'daily_accuracy': instance.dailyAccuracy,
      'best_day': instance.bestDay,
    };

_$MasteryDayDtoImpl _$$MasteryDayDtoImplFromJson(Map<String, dynamic> json) =>
    _$MasteryDayDtoImpl(
      dayOfWeek: (json['day_of_week'] as num).toInt(),
      accuracy: (json['accuracy'] as num).toDouble(),
      answers: (json['answers'] as num).toInt(),
    );

Map<String, dynamic> _$$MasteryDayDtoImplToJson(_$MasteryDayDtoImpl instance) =>
    <String, dynamic>{
      'day_of_week': instance.dayOfWeek,
      'accuracy': instance.accuracy,
      'answers': instance.answers,
    };

_$MasteryBestDayDtoImpl _$$MasteryBestDayDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MasteryBestDayDtoImpl(
      date: DateTime.parse(json['date'] as String),
      accuracy: (json['accuracy'] as num).toDouble(),
      answers: (json['answers'] as num).toInt(),
    );

Map<String, dynamic> _$$MasteryBestDayDtoImplToJson(
        _$MasteryBestDayDtoImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'accuracy': instance.accuracy,
      'answers': instance.answers,
    };

_$MasteryTopicDtoImpl _$$MasteryTopicDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MasteryTopicDtoImpl(
      name: json['name'] as String,
      accuracy: (json['accuracy'] as num).toDouble(),
      answers: (json['answers'] as num).toInt(),
    );

Map<String, dynamic> _$$MasteryTopicDtoImplToJson(
        _$MasteryTopicDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'accuracy': instance.accuracy,
      'answers': instance.answers,
    };
