import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_dto.freezed.dart';
part 'leaderboard_dto.g.dart';

@freezed
class LeaderboardDto with _$LeaderboardDto {
  const factory LeaderboardDto({
    required String userId,
    @JsonKey(name: 'userEmail') required String email,
    @JsonKey(name: 'userName') String? name,
    @JsonKey(defaultValue: 0) required int points,
    @JsonKey(defaultValue: 0) required int questionsAnswered,
    @JsonKey(defaultValue: 0) required int correctAnswers,
    @JsonKey(defaultValue: 0.0) required double accuracy,
    @JsonKey(name: 'rank', defaultValue: 0) required int rank,
  }) = _LeaderboardDto;

  factory LeaderboardDto.fromJson(Map<String, dynamic> json) => _$LeaderboardDtoFromJson(json);
}
