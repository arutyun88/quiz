import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_entity.freezed.dart';

@freezed
class LeaderboardEntity with _$LeaderboardEntity {
  const factory LeaderboardEntity({
    required String seasonId,
    required String userId,
    String? userName,
    required int rating,
    required int bestRating,
    required int officialAnswers,
    required bool provisional,
    int? rank,
  }) = _LeaderboardEntity;
}
