import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_dto.dart';

part 'leaderboard_overview_dto.freezed.dart';
part 'leaderboard_overview_dto.g.dart';

@freezed
class LeaderboardOverviewDto with _$LeaderboardOverviewDto {
  const factory LeaderboardOverviewDto({
    @JsonKey(defaultValue: []) required List<LeaderboardDto> top,
    LeaderboardDto? me,
    @JsonKey(defaultValue: []) required List<LeaderboardDto> around,
    LeaderboardDto? previousMe,
    @JsonKey(defaultValue: 0) required int total,
  }) = _LeaderboardOverviewDto;

  factory LeaderboardOverviewDto.fromJson(Map<String, dynamic> json) => _$LeaderboardOverviewDtoFromJson(json);
}
