import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_page_converter.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_dto.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';

typedef LeaderboardPageConverter = DataPageConverter<LeaderboardEntity, LeaderboardDto>;
typedef LeaderboardConverter = DtoConverter<LeaderboardEntity, LeaderboardDto>;

@Injectable(as: LeaderboardConverter)
final class LeaderboardConverterImpl extends LeaderboardConverter {
  @override
  LeaderboardEntity convert(LeaderboardDto dto) {
    return LeaderboardEntity(
      userId: dto.userId,
      email: dto.email,
      name: dto.name,
      points: dto.points,
      questionsAnswered: dto.questionsAnswered,
      correctAnswers: dto.correctAnswers,
      accuracy: dto.accuracy,
      rank: dto.rank,
    );
  }
}
