import 'package:quiz/features/leaderboard/data/dto/season_history_dto.dart';
import 'package:quiz/features/leaderboard/domain/entity/season_history_entity.dart';

extension SeasonHistoryDtoConverter on SeasonHistoryDto {
  SeasonHistoryEntity toEntity() => SeasonHistoryEntity(
        seasonId: seasonId,
        startsAt: startsAt,
        endsAt: endsAt,
        isCurrent: isCurrent,
        ratingBefore: ratingBefore,
        ratingAfter: ratingAfter,
        ratingDelta: ratingDelta,
        bestRating: bestRating,
        officialAnswers: officialAnswers,
        correctAnswers: correctAnswers,
        accuracy: accuracy,
        rank: rank,
      );
}
