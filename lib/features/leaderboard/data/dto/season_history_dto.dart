import 'package:freezed_annotation/freezed_annotation.dart';

part 'season_history_dto.freezed.dart';
part 'season_history_dto.g.dart';

@freezed
class SeasonHistoryDto with _$SeasonHistoryDto {
  const factory SeasonHistoryDto({
    @JsonKey(name: 'season_id') required String seasonId,
    @JsonKey(name: 'starts_at') required DateTime startsAt,
    @JsonKey(name: 'ends_at') required DateTime endsAt,
    @JsonKey(name: 'is_current') required bool isCurrent,
    @JsonKey(name: 'rating_before') required int ratingBefore,
    @JsonKey(name: 'rating_after') required int ratingAfter,
    @JsonKey(name: 'rating_delta') required int ratingDelta,
    @JsonKey(name: 'best_rating') required int bestRating,
    @JsonKey(name: 'official_answers') required int officialAnswers,
    @JsonKey(name: 'correct_answers') required int correctAnswers,
    required double accuracy,
    required int? rank,
  }) = _SeasonHistoryDto;

  factory SeasonHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$SeasonHistoryDtoFromJson(json);
}
