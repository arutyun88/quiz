// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeasonHistoryDtoImpl _$$SeasonHistoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SeasonHistoryDtoImpl(
      seasonId: json['season_id'] as String,
      startsAt: DateTime.parse(json['starts_at'] as String),
      endsAt: DateTime.parse(json['ends_at'] as String),
      isCurrent: json['is_current'] as bool,
      ratingBefore: (json['rating_before'] as num).toInt(),
      ratingAfter: (json['rating_after'] as num).toInt(),
      ratingDelta: (json['rating_delta'] as num).toInt(),
      bestRating: (json['best_rating'] as num).toInt(),
      officialAnswers: (json['official_answers'] as num).toInt(),
      correctAnswers: (json['correct_answers'] as num).toInt(),
      accuracy: (json['accuracy'] as num).toDouble(),
      rank: (json['rank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SeasonHistoryDtoImplToJson(
        _$SeasonHistoryDtoImpl instance) =>
    <String, dynamic>{
      'season_id': instance.seasonId,
      'starts_at': instance.startsAt.toIso8601String(),
      'ends_at': instance.endsAt.toIso8601String(),
      'is_current': instance.isCurrent,
      'rating_before': instance.ratingBefore,
      'rating_after': instance.ratingAfter,
      'rating_delta': instance.ratingDelta,
      'best_rating': instance.bestRating,
      'official_answers': instance.officialAnswers,
      'correct_answers': instance.correctAnswers,
      'accuracy': instance.accuracy,
      'rank': instance.rank,
    };
