import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_dto.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';

typedef LeaderboardConverter = DtoConverter<LeaderboardEntity, LeaderboardDto>;

@Injectable(as: LeaderboardConverter)
final class LeaderboardConverterImpl extends LeaderboardConverter {
  @override
  LeaderboardEntity convert(LeaderboardDto dto) {
    return LeaderboardEntity(
      seasonId: dto.seasonId,
      userId: dto.userId,
      userName: dto.userName,
      rating: dto.rating,
      bestRating: dto.bestRating,
      officialAnswers: dto.officialAnswers,
      provisional: dto.provisional,
      rank: dto.rank,
    );
  }
}
