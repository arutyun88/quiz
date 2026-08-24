import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/features/user/data/converter/user_converter.dart';
import 'package:quiz/features/user/data/converter/user_dao_converter.dart';
import 'package:quiz/features/user/data/dao/user_dao.dart';
import 'package:quiz/features/user/data/dto/user_dto.dart';
import 'package:quiz/features/user/domain/entity/age_access_entity.dart';

void main() {
  test('own profile maps server age access, timezone, and rating fields', () {
    final dto = UserDto.fromJson({
      'id': 'user-1',
      'email': 'user@example.test',
      'name': 'User',
      'age_access': {
        'adult_eligible_at': '2026-08-25',
        'age_signal_source': 'SELF_DECLARED',
        'store_age_signal': 'ADULT',
        'adult_eligible': true,
        'adult_content_enabled': false,
        'confirmed_at': null,
        'policy_version': null,
        'revoked_at': null,
        'override': 'NONE',
        'current_policy_version': 'adult-content-v1',
      },
      'timezone_id': 'Asia/Yekaterinburg',
      'level': 3,
      'experience_in_level': 10,
      'level_experience': 100,
      'streak_days': 2,
      'best_streak_days': 5,
      'questions_answered': 7,
      'correct_answers': 6,
      'accuracy': 0.85,
      'total_points': 60,
      'member_since': '2026-01-01T00:00:00Z',
      'achievements_unlocked': 1,
      'achievements_total': 10,
      'rating': 1120,
      'best_rating': 1150,
      'rating_official_answers': 7,
      'rating_provisional': true,
      'subscription': null,
    });

    final user = UserConverterImpl().convert(DataDto(data: dto));

    expect(user.ageAccess?.ageSignalSource, AgeSignalSource.selfDeclared);
    expect(user.ageAccess?.storeAgeSignal, StoreAgeSignal.adult);
    expect(user.ageAccess?.adultEligible, isTrue);
    expect(user.ageAccess?.adultContentEnabled, isFalse);
    expect(user.timezoneId, 'Asia/Yekaterinburg');
    expect(user.rating, 1120);
    expect(user.bestRating, 1150);
    expect(user.ratingOfficialAnswers, 7);
    expect(user.ratingProvisional, isTrue);

    final cached = UserDaoConverterImpl().toDao(user);
    final restored = UserDaoConverterImpl().toEntity(
      UserDao.fromJsonString(cached.toJsonString()),
    );
    expect(cached.ageAccess?.adultEligibleAt, '2026-08-25');
    expect(restored.ageAccess?.adultEligibleAt, '2026-08-25');
    expect(restored.ageAccess?.adultContentEnabled, isFalse);
  });

  test('public profile accepts null private age and timezone fields', () {
    final dto = UserDto.fromJson({
      'id': 'user-2',
      'email': null,
      'name': 'Public User',
      'age_access': null,
      'timezone_id': null,
      'level': 1,
      'experience_in_level': 0,
      'level_experience': 100,
      'streak_days': 0,
      'best_streak_days': 0,
      'questions_answered': 0,
      'correct_answers': 0,
      'accuracy': 0.0,
      'total_points': 0,
      'member_since': '2026-01-01T00:00:00Z',
      'achievements_unlocked': 0,
      'achievements_total': 10,
      'rating': 1000,
      'best_rating': 1000,
      'rating_official_answers': 0,
      'rating_provisional': true,
      'subscription': null,
    });

    final user = UserConverterImpl().convert(DataDto(data: dto));

    expect(user.ageAccess, isNull);
    expect(user.timezoneId, isNull);
  });

  test('legacy cached profile is readable and age access fails closed', () {
    final dao = UserDao.fromJson({
      'id': 'legacy-user',
      'email': 'legacy@example.test',
      'name': 'Legacy',
      'birthDateIso': '2000-02-03T00:00:00.000',
      'level': 2,
      'experienceInLevel': 5,
      'levelExperience': 100,
      'streakDays': 1,
      'bestStreakDays': 4,
      'questionsAnswered': 8,
      'correctAnswers': 5,
      'accuracy': 0.625,
      'totalPoints': 50,
      'memberSinceIso': '2025-01-01T00:00:00.000Z',
      'achievementsUnlocked': 1,
      'achievementsTotal': 10,
    });

    final user = UserDaoConverterImpl().toEntity(dao);

    expect(user.ageAccess, isNull);
    expect(user.timezoneId, isNull);
    expect(user.rating, 1000);
    expect(user.bestRating, 1000);
    expect(user.ratingOfficialAnswers, 0);
    expect(user.ratingProvisional, isTrue);
  });
}
