import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/leaderboard/data/dto/leaderboard_timeline_dto.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_timeline_entity.dart';

typedef LeaderboardTimelineConverter = DtoConverter<LeaderboardTimelineEntity, DataDto<LeaderboardTimelineDto>>;

@Injectable(as: LeaderboardTimelineConverter)
final class LeaderboardTimelineConverterImpl extends LeaderboardTimelineConverter {
  @override
  LeaderboardTimelineEntity convert(DataDto<LeaderboardTimelineDto> dto) {
    return LeaderboardTimelineEntity(
      currentRank: dto.data.currentRank,
      deltaOverPeriod: dto.data.deltaOverPeriod,
      days: dto.data.days.map(_convertDay).toList(),
    );
  }

  TimelineDayEntity _convertDay(TimelineDayDto dto) {
    return TimelineDayEntity(
      date: dto.date,
      points: dto.points,
      rank: dto.rank,
      trend: switch (dto.trend) {
        'UP' => RankTrend.up,
        'DOWN' => RankTrend.down,
        'FLAT' => RankTrend.flat,
        _ => null,
      },
    );
  }
}
