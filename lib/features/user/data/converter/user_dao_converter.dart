import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/dao/dao_converter.dart';
import 'package:quiz/features/user/data/converter/age_access_converter.dart';
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
      ageAccess: dao.ageAccess?.toEntity(),
      timezoneId: dao.timezoneId,
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
      rating: dao.rating,
      bestRating: dao.bestRating,
      ratingOfficialAnswers: dao.ratingOfficialAnswers,
      ratingProvisional: dao.ratingProvisional,
    );
  }

  @override
  UserDao toDao(UserEntity entity) {
    return UserDao(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      ageAccess: entity.ageAccess?.toDao(),
      timezoneId: entity.timezoneId,
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
      rating: entity.rating,
      bestRating: entity.bestRating,
      ratingOfficialAnswers: entity.ratingOfficialAnswers,
      ratingProvisional: entity.ratingProvisional,
    );
  }
}
