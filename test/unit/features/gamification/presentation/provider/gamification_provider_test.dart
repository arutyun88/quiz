import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/gamification/domain/entity/user_level_entity.dart';
import 'package:quiz/features/gamification/domain/repository/gamification_repository.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';

class _MockGamificationRepository extends Mock
    implements GamificationRepository {}

void main() {
  test('loads the level only when explicitly requested', () async {
    final repository = _MockGamificationRepository();
    const level = UserLevelEntity(
      level: 4,
      experience: 20,
      totalPoints: 120,
      questionsAnswered: 10,
      correctAnswers: 8,
      accuracy: 0.8,
      streakDays: 3,
      streakNotice: null,
    );
    when(() => repository.fetchLevel())
        .thenAnswer((_) async => const Result.ok(level));
    final notifier = GamificationNotifier(
      gamificationRepository: repository,
    );
    addTearDown(notifier.dispose);

    verifyNever(() => repository.fetchLevel());

    await notifier.fetch();

    verify(() => repository.fetchLevel()).called(1);
    expect((notifier.state as BaseDataState<UserLevelEntity>).data, level);
  });

  test('coalesces concurrent refreshes into one server request', () async {
    final repository = _MockGamificationRepository();
    final result = Completer<Result<UserLevelEntity, Failure>>();
    when(() => repository.fetchLevel()).thenAnswer((_) => result.future);
    final notifier = GamificationNotifier(
      gamificationRepository: repository,
    );
    addTearDown(notifier.dispose);

    final first = notifier.fetch();
    final second = notifier.fetch();

    verify(() => repository.fetchLevel()).called(1);
    result.complete(
      const Result.ok(
        UserLevelEntity(
          level: 2,
          experience: 5,
          totalPoints: 50,
          questionsAnswered: 4,
          correctAnswers: 3,
          accuracy: 0.75,
          streakDays: 1,
          streakNotice: null,
        ),
      ),
    );
    await Future.wait([first, second]);
  });
}
