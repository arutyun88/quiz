import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/data_page/page_entity.dart';
import 'package:quiz/app/core/model/data_page/page_info.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/achievements/domain/entity/user_achievement_entity.dart';
import 'package:quiz/features/achievements/domain/repository/user_achievement_repository.dart';
import 'package:quiz/features/achievements/presentation/provider/achievements_provider.dart';

class _MockUserAchievementRepository extends Mock
    implements UserAchievementRepository {}

void main() {
  test('coalesces initial refresh and preserves data when refresh fails',
      () async {
    final repository = _MockUserAchievementRepository();
    final page = PageEntity<UserAchievementEntity>(
      items: const [],
      info: PageInfo(page: 0, limit: 20, hasNextPage: false),
    );
    when(repository.fetch).thenAnswer((_) async => Result.ok(page));
    final notifier = AchievementsNotifier(
      userAchievementRepository: repository,
    );
    addTearDown(notifier.dispose);

    expect(await notifier.refresh(), isTrue);

    verify(repository.fetch).called(1);
    expect((notifier.state as BaseDataState).data, page);

    when(repository.fetch).thenAnswer(
      (_) async => const Result.failed(Failure.noConnection()),
    );
    expect(await notifier.refresh(), isFalse);

    expect((notifier.state as BaseDataState).data, page);
  });

  test('keeps public achievements error visible while retry is pending',
      () async {
    final repository = _MockUserAchievementRepository();
    final retry =
        Completer<Result<PageEntity<UserAchievementEntity>, Failure>>();
    final page = PageEntity<UserAchievementEntity>(
      items: const [],
      info: PageInfo(page: 0, limit: 20, hasNextPage: false),
    );
    var callCount = 0;
    when(() => repository.fetchByUserId('user-1')).thenAnswer((_) {
      callCount += 1;
      return callCount == 1
          ? Future.value(
              const Result.failed(Failure.unknown('failed')),
            )
          : retry.future;
    });
    final notifier = PublicAchievementsNotifier(
      userAchievementRepository: repository,
      userId: 'user-1',
    );
    addTearDown(notifier.dispose);

    await Future<void>.delayed(Duration.zero);
    expect(
      notifier.state,
      isA<BaseFailedState<PageEntity<UserAchievementEntity>>>(),
    );

    final pendingRetry = notifier.fetch();
    expect(
      notifier.state,
      isA<BaseFailedState<PageEntity<UserAchievementEntity>>>(),
    );

    retry.complete(Result.ok(page));
    expect(await pendingRetry, isTrue);
    expect(
      notifier.state,
      isA<BaseDataState<PageEntity<UserAchievementEntity>>>(),
    );
  });
}
