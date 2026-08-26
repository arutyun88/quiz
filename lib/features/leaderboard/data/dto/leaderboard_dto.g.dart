// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardDtoImpl _$$LeaderboardDtoImplFromJson(Map<String, dynamic> json) =>
    _$LeaderboardDtoImpl(
      seasonId: json['season_id'] as String,
      userId: json['user_id'] as String,
      userName: json['user_name'] as String?,
      rating: (json['rating'] as num).toInt(),
      bestRating: (json['best_rating'] as num).toInt(),
      officialAnswers: (json['official_answers'] as num).toInt(),
      provisional: json['provisional'] as bool,
      rank: (json['rank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LeaderboardDtoImplToJson(
        _$LeaderboardDtoImpl instance) =>
    <String, dynamic>{
      'season_id': instance.seasonId,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'rating': instance.rating,
      'best_rating': instance.bestRating,
      'official_answers': instance.officialAnswers,
      'provisional': instance.provisional,
      'rank': instance.rank,
    };
