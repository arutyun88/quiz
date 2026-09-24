import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/mastery/domain/entity/mastery_entity.dart';
import 'package:quiz/features/mastery/domain/repository/mastery_repository.dart';
import 'package:quiz/features/mastery/presentation/provider/mastery_provider.dart';

class _MockMasteryRepository extends Mock implements MasteryRepository {}

void main() {
  test('does not fetch without an authenticated user', () {
    final repository = _MockMasteryRepository();
    final notifier = MasteryNotifier(
      masteryRepository: repository,
      autoFetch: false,
    );
    addTearDown(notifier.dispose);

    verifyNever(repository.fetch);
  });

  test('coalesces initial refresh and preserves data when refresh fails',
      () async {
    final repository = _MockMasteryRepository();
    const mastery = MasteryEntity(topics: []);
    when(repository.fetch).thenAnswer((_) async => const Result.ok(mastery));
    final notifier = MasteryNotifier(masteryRepository: repository);
    addTearDown(notifier.dispose);

    expect(await notifier.refresh(), isTrue);

    verify(repository.fetch).called(1);
    expect((notifier.state as BaseDataState).data, mastery);

    when(repository.fetch).thenAnswer(
      (_) async => const Result.failed(Failure.noConnection()),
    );
    expect(await notifier.refresh(), isFalse);

    expect((notifier.state as BaseDataState).data, mastery);
  });

  test('keeps error visible while retry is pending', () async {
    final repository = _MockMasteryRepository();
    final retry = Completer<Result<MasteryEntity, Failure>>();
    var callCount = 0;
    when(repository.fetch).thenAnswer((_) {
      callCount += 1;
      return callCount == 1
          ? Future.value(
              const Result.failed(Failure.unknown('failed')),
            )
          : retry.future;
    });
    final notifier = MasteryNotifier(masteryRepository: repository);
    addTearDown(notifier.dispose);

    await Future<void>.delayed(Duration.zero);
    expect(notifier.state, isA<BaseFailedState<MasteryEntity>>());

    final pendingRetry = notifier.fetch();
    expect(notifier.state, isA<BaseFailedState<MasteryEntity>>());

    retry.complete(const Result.ok(MasteryEntity(topics: [])));
    expect(await pendingRetry, isTrue);
    expect(notifier.state, isA<BaseDataState<MasteryEntity>>());
  });
}
