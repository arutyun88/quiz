import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/gamification/data/dto/streak_notice_dto.dart';
import 'package:quiz/features/gamification/data/dto/user_level_dto.dart';
import 'package:quiz/features/gamification/domain/entity/user_level_entity.dart';

typedef UserLevelConverter = DtoConverter<UserLevelEntity, DataDto<UserLevelDto>>;

@Injectable(as: UserLevelConverter)
final class UserLevelConverterImpl extends UserLevelConverter {
  @override
  UserLevelEntity convert(DataDto<UserLevelDto> dto) {
    return UserLevelEntity(
      level: dto.data.level,
      experience: dto.data.experience,
      totalPoints: dto.data.totalPoints,
      questionsAnswered: dto.data.questionsAnswered,
      correctAnswers: dto.data.correctAnswers,
      accuracy: dto.data.accuracy,
      streakDays: dto.data.streakDays,
      streakNotice: _convertNotice(dto.data.streakNotice),
    );
  }

  StreakNoticeEntity? _convertNotice(StreakNoticeDto? dto) {
    if (dto == null) return null;

    final type = switch (dto.type) {
      'FREEZE_APPLIED' => StreakNoticeType.freezeApplied,
      'STREAK_LOST' => StreakNoticeType.streakLost,
      _ => null,
    };
    if (type == null) return null;

    return StreakNoticeEntity(
      type: type,
      freezesLeft: dto.freezesLeft,
      freezesTotal: dto.freezesTotal,
      lostStreakDays: dto.lostStreakDays,
    );
  }
}
