import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/leaderboard/domain/entity/season_history_entity.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';
import 'package:quiz/features/leaderboard/presentation/provider/season_history_provider.dart';

class MockLeaderboardRepository extends Mock implements LeaderboardRepository {}

void main() {
  late MockLeaderboardRepository repository;
  late SeasonHistoryNotifier notifier;

  final first = SeasonHistoryEntity(
    seasonId: 'season-2',
    startsAt: _startTwo,
    endsAt: _endTwo,
    isCurrent: true,
    ratingBefore: 1000,
    ratingAfter: 1050,
    ratingDelta: 50,
    bestRating: 1060,
    officialAnswers: 10,
    correctAnswers: 7,
    accuracy: 0.7,
    rank: null,
  );
  final second = SeasonHistoryEntity(
    seasonId: 'season-1',
    startsAt: _startOne,
    endsAt: _endOne,
    isCurrent: false,
    ratingBefore: 980,
    ratingAfter: 1000,
    ratingDelta: 20,
    bestRating: 1020,
    officialAnswers: 20,
    correctAnswers: 15,
    accuracy: 0.75,
    rank: 8,
  );

  setUp(() {
    repository = MockLeaderboardRepository();
    when(() => repository.fetchSeasonHistory(limit: 20, offset: 0)).thenAnswer(
      (_) async => Result.ok(
        SeasonHistoryPageEntity(items: [first], total: 2),
      ),
    );
    notifier = SeasonHistoryNotifier(repository: repository);
  });

  tearDown(() => notifier.dispose());

  test('appends the next server page without recomputing season data',
      () async {
    await pumpEventQueue();
    when(() => repository.fetchSeasonHistory(limit: 20, offset: 1)).thenAnswer(
      (_) async => Result.ok(
        SeasonHistoryPageEntity(items: [second], total: 2),
      ),
    );

    await notifier.loadMore();

    final state = notifier.state as SeasonHistoryDataState;
    expect(state.items, [first, second]);
    expect(state.items.last.rank, 8);
    verify(() => repository.fetchSeasonHistory(limit: 20, offset: 1)).called(1);
  });
}

final _startOne = DateTime.utc(2026, 7, 1);
final _endOne = DateTime.utc(2026, 7, 29);
final _startTwo = DateTime.utc(2026, 7, 29);
final _endTwo = DateTime.utc(2026, 8, 26);
