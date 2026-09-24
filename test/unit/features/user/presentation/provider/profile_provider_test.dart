import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/gamification/domain/entity/user_level_entity.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/user_repository.dart';
import 'package:quiz/features/user/presentation/provider/profile_provider.dart';

class _MockUserRepository extends Mock implements UserRepository {}

void main() {
  test('uses the shared gamification snapshot for own profile statistics',
      () async {
    final repository = _MockUserRepository();
    final profile = UserEntity(
      id: 'user-1',
      email: 'user@example.com',
      name: 'User',
      level: 1,
      experienceInLevel: 10,
      levelExperience: 100,
      streakDays: 1,
      bestStreakDays: 2,
      questionsAnswered: 3,
      correctAnswers: 2,
      accuracy: 2 / 3,
      totalPoints: 30,
      memberSince: DateTime.utc(2026),
      achievementsUnlocked: 1,
      achievementsTotal: 10,
    );
    const gamification = UserLevelEntity(
      level: 3,
      experience: 350,
      experienceInLevel: 50,
      levelExperience: 300,
      totalPoints: 500,
      questionsAnswered: 20,
      correctAnswers: 15,
      accuracy: 0.75,
      streakDays: 5,
      bestStreakDays: 8,
      streakNotice: null,
    );
    when(() => repository.fetch()).thenAnswer((_) async => Result.ok(profile));
    final notifier = ProfileNotifier(repository: repository);
    addTearDown(notifier.dispose);

    verifyNever(() => repository.fetch());
    notifier.updateGamification(gamification);
    await notifier.refresh();

    final merged = (notifier.state as BaseDataState<UserEntity>).data;
    expect(merged.email, profile.email);
    expect(merged.achievementsUnlocked, profile.achievementsUnlocked);
    expect(merged.level, gamification.level);
    expect(merged.experienceInLevel, gamification.experienceInLevel);
    expect(merged.levelExperience, gamification.levelExperience);
    expect(merged.streakDays, gamification.streakDays);
    expect(merged.bestStreakDays, gamification.bestStreakDays);
    expect(merged.questionsAnswered, gamification.questionsAnswered);
    expect(merged.correctAnswers, gamification.correctAnswers);
    expect(merged.accuracy, gamification.accuracy);
    expect(merged.totalPoints, gamification.totalPoints);
    verify(() => repository.fetch()).called(1);
  });

  test('updates a loaded profile when gamification changes', () {
    final repository = _MockUserRepository();
    final notifier = ProfileNotifier(repository: repository);
    addTearDown(notifier.dispose);
    notifier.state = BaseState.data(
      UserEntity(
        id: 'user-1',
        email: null,
        name: null,
        level: 1,
        experienceInLevel: 0,
        levelExperience: 100,
        streakDays: 0,
        bestStreakDays: 0,
        questionsAnswered: 0,
        correctAnswers: 0,
        accuracy: 0,
        totalPoints: 0,
        memberSince: DateTime.utc(2026),
        achievementsUnlocked: 0,
        achievementsTotal: 10,
      ),
    );

    notifier.updateGamification(
      const UserLevelEntity(
        level: 2,
        experience: 120,
        experienceInLevel: 20,
        levelExperience: 200,
        totalPoints: 120,
        questionsAnswered: 4,
        correctAnswers: 3,
        accuracy: 0.75,
        streakDays: 1,
        bestStreakDays: 1,
        streakNotice: null,
      ),
    );

    final updated = (notifier.state as BaseDataState<UserEntity>).data;
    expect(updated.level, 2);
    expect(updated.totalPoints, 120);
  });

  test('keeps own profile error visible while retry is pending', () async {
    final repository = _MockUserRepository();
    final retry = Completer<Result<UserEntity, Failure>>();
    var callCount = 0;
    when(() => repository.fetch()).thenAnswer((_) {
      callCount += 1;
      return callCount == 1
          ? Future.value(Result.failed(const Failure.unknown('failed')))
          : retry.future;
    });
    final notifier = ProfileNotifier(repository: repository);
    addTearDown(notifier.dispose);

    await notifier.refresh();
    expect(notifier.state, isA<BaseFailedState<UserEntity>>());

    final pendingRetry = notifier.fetch();
    expect(notifier.state, isA<BaseFailedState<UserEntity>>());

    retry.complete(Result.ok(_profile()));
    await pendingRetry;

    expect(notifier.state, isA<BaseDataState<UserEntity>>());
  });

  test('keeps public profile error visible while retry is pending', () async {
    final repository = _MockUserRepository();
    final retry = Completer<Result<UserEntity, Failure>>();
    var callCount = 0;
    when(() => repository.fetchUser('user-1')).thenAnswer((_) {
      callCount += 1;
      return callCount == 1
          ? Future.value(Result.failed(const Failure.unknown('failed')))
          : retry.future;
    });
    final notifier = PublicProfileNotifier(
      repository: repository,
      userId: 'user-1',
    );
    addTearDown(notifier.dispose);

    await Future<void>.delayed(Duration.zero);
    expect(notifier.state, isA<BaseFailedState<UserEntity>>());

    final pendingRetry = notifier.fetch();
    expect(notifier.state, isA<BaseFailedState<UserEntity>>());

    retry.complete(Result.ok(_profile()));
    await pendingRetry;

    expect(notifier.state, isA<BaseDataState<UserEntity>>());
  });
}

UserEntity _profile() => UserEntity(
      id: 'user-1',
      email: 'user@example.com',
      name: 'User',
      level: 1,
      experienceInLevel: 0,
      levelExperience: 100,
      streakDays: 0,
      bestStreakDays: 0,
      questionsAnswered: 0,
      correctAnswers: 0,
      accuracy: 0,
      totalPoints: 0,
      memberSince: DateTime.utc(2026),
      achievementsUnlocked: 0,
      achievementsTotal: 10,
    );
