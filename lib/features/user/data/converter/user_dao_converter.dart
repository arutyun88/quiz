import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/dao/dao_converter.dart';
import 'package:quiz/features/user/data/dao/user_dao.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';

typedef UserDaoConverter = DaoConverter<UserEntity, UserDao>;

@Injectable(as: UserDaoConverter)
final class UserDaoConverterImpl extends UserDaoConverter {
  @override
  UserEntity toEntity(UserDao dao) {
    return UserEntity(
      id: dao.id,
      email: dao.email,
      name: dao.name,
      birthDate: dao.birthDate,
      level: dao.level,
      experienceInLevel: dao.experienceInLevel,
      levelExperience: dao.levelExperience,
      streakDays: dao.streakDays,
      bestStreakDays: dao.bestStreakDays,
      questionsAnswered: dao.questionsAnswered,
      correctAnswers: dao.correctAnswers,
      accuracy: dao.accuracy,
      totalPoints: dao.totalPoints,
      memberSince: dao.memberSince,
      achievementsUnlocked: dao.achievementsUnlocked,
      achievementsTotal: dao.achievementsTotal,
    );
  }

  @override
  UserDao toDao(UserEntity entity) {
    return UserDao(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      birthDateIso: entity.birthDate?.toIso8601String(),
      level: entity.level,
      experienceInLevel: entity.experienceInLevel,
      levelExperience: entity.levelExperience,
      streakDays: entity.streakDays,
      bestStreakDays: entity.bestStreakDays,
      questionsAnswered: entity.questionsAnswered,
      correctAnswers: entity.correctAnswers,
      accuracy: entity.accuracy,
      totalPoints: entity.totalPoints,
      memberSinceIso: entity.memberSince.toIso8601String(),
      achievementsUnlocked: entity.achievementsUnlocked,
      achievementsTotal: entity.achievementsTotal,
    );
  }
}
