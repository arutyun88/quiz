import 'package:freezed_annotation/freezed_annotation.dart';

part 'season_history_entity.freezed.dart';

@freezed
class SeasonHistoryEntity with _$SeasonHistoryEntity {
  const factory SeasonHistoryEntity({
    required String seasonId,
    required DateTime startsAt,
    required DateTime endsAt,
    required bool isCurrent,
    required int ratingBefore,
    required int ratingAfter,
    required int ratingDelta,
    required int bestRating,
    required int officialAnswers,
    required int correctAnswers,
    required double accuracy,
    required int? rank,
  }) = _SeasonHistoryEntity;
}

@freezed
class SeasonHistoryPageEntity with _$SeasonHistoryPageEntity {
  const factory SeasonHistoryPageEntity({
    required List<SeasonHistoryEntity> items,
    required int total,
  }) = _SeasonHistoryPageEntity;
}
