import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';
import 'package:quiz/features/leaderboard/presentation/provider/leaderboard_provider.dart';

class MockLeaderboardRepository extends Mock implements LeaderboardRepository {}

void main() {
  late MockLeaderboardRepository repository;
  late LeaderboardNotifier notifier;

  final initial = _overview(rating: 1000);
  final refreshed = _overview(rating: 1015);

  setUp(() {
    repository = MockLeaderboardRepository();
    when(repository.fetchCurrentSeason).thenAnswer(
      (_) async => Result.ok(initial),
    );
    notifier = LeaderboardNotifier(repository: repository);
  });

  tearDown(() => notifier.dispose());

  test('refresh keeps current data visible and replaces it on success',
      () async {
    await pumpEventQueue();
    final completer = Completer<Result<LeaderboardOverviewEntity, Failure>>();
    when(repository.fetchCurrentSeason).thenAnswer((_) => completer.future);

    final refresh = notifier.refresh();

    expect(notifier.state, BaseState.data(initial));

    completer.complete(Result.ok(refreshed));
    await refresh;

    expect(notifier.state, BaseState.data(refreshed));
  });
}

LeaderboardOverviewEntity _overview({required int rating}) {
  final me = LeaderboardEntity(
    seasonId: 'season',
    userId: 'me',
    userName: 'Me',
    rating: rating,
    bestRating: rating,
    officialAnswers: 10,
    rank: 1,
    provisional: false,
  );
  return LeaderboardOverviewEntity(entries: [me], me: me, total: 1);
}
