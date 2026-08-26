import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_dto.freezed.dart';
part 'leaderboard_dto.g.dart';

@freezed
class LeaderboardDto with _$LeaderboardDto {
  const factory LeaderboardDto({
    @JsonKey(name: 'season_id') required String seasonId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'user_name') String? userName,
    required int rating,
    @JsonKey(name: 'best_rating') required int bestRating,
    @JsonKey(name: 'official_answers') required int officialAnswers,
    required bool provisional,
    int? rank,
  }) = _LeaderboardDto;

  factory LeaderboardDto.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardDtoFromJson(json);
}
