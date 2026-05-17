// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardDtoImpl _$$LeaderboardDtoImplFromJson(Map<String, dynamic> json) =>
    _$LeaderboardDtoImpl(
      userId: json['userId'] as String,
      email: json['userEmail'] as String,
      name: json['userName'] as String?,
      points: (json['points'] as num?)?.toInt() ?? 0,
      questionsAnswered: (json['questionsAnswered'] as num?)?.toInt() ?? 0,
      correctAnswers: (json['correctAnswers'] as num?)?.toInt() ?? 0,
      accuracy: (json['accuracy'] as num?)?.toDouble() ?? 0.0,
      rank: (json['rank'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeaderboardDtoImplToJson(
        _$LeaderboardDtoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userEmail': instance.email,
      'userName': instance.name,
      'points': instance.points,
      'questionsAnswered': instance.questionsAnswered,
      'correctAnswers': instance.correctAnswers,
      'accuracy': instance.accuracy,
      'rank': instance.rank,
    };
