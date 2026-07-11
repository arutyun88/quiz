import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_dto.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_overview_dto.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';

typedef LeaderboardConverter = DtoConverter<LeaderboardEntity, LeaderboardDto>;
typedef LeaderboardOverviewConverter = DtoConverter<LeaderboardOverviewEntity, LeaderboardOverviewDto>;

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

@Injectable(as: LeaderboardOverviewConverter)
final class LeaderboardOverviewConverterImpl extends LeaderboardOverviewConverter {
  final LeaderboardConverter _entryConverter;

  LeaderboardOverviewConverterImpl(this._entryConverter);

  @override
  LeaderboardOverviewEntity convert(LeaderboardOverviewDto dto) {
    final me = dto.me;
    final previousMe = dto.previousMe;

    return LeaderboardOverviewEntity(
      top: _entryConverter.convertMultiple(dto.top).toList(),
      me: me != null ? _entryConverter.convert(me) : null,
      around: _entryConverter.convertMultiple(dto.around).toList(),
      previousMe: previousMe != null ? _entryConverter.convert(previousMe) : null,
      total: dto.total,
    );
  }
}
