import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_entity.freezed.dart';

@freezed
class LeaderboardEntity with _$LeaderboardEntity {
  const factory LeaderboardEntity({
    required String userId,
    required String email,
    String? name,
    required int points,
    required int questionsAnswered,
    required int correctAnswers,
    required double accuracy,
    required int rank,
  }) = _LeaderboardEntity;
}
