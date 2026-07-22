import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/daily_result/presentation/provider/daily_result_provider.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';

class MockLeaderboardRepository extends Mock implements LeaderboardRepository {}

LeaderboardEntity _entry({
  required int rank,
  int points = 0,
  int correctAnswers = 0,
}) =>
    LeaderboardEntity(
      userId: 'u1',
      email: 'u1@test.com',
      points: points,
      questionsAnswered: 10,
      correctAnswers: correctAnswers,
      accuracy: 0.9,
      rank: rank,
    );

LeaderboardOverviewEntity _overview({
  LeaderboardEntity? me,
  LeaderboardEntity? previousMe,
}) =>
    LeaderboardOverviewEntity(
      top: const [],
      me: me,
      around: const [],
      previousMe: previousMe,
      total: 100,
    );

void main() {
  late LeaderboardRepository repository;

  setUp(() {
    repository = MockLeaderboardRepository();
    getIt.registerSingleton<LeaderboardRepository>(repository);
  });

  tearDown(() => getIt.reset());

  void stub({
    required Result<LeaderboardOverviewEntity, Failure> daily,
    required Result<LeaderboardOverviewEntity, Failure> weekly,
  }) {
    when(() => repository.fetchOverview(LeaderboardPeriod.daily)).thenAnswer((_) async => daily);
    when(() => repository.fetchOverview(LeaderboardPeriod.weekly)).thenAnswer((_) async => weekly);
  }

  Future<DailyResultEntity> read() async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    return await container.read(dailyResultProvider.future);
  }

  test('takes today numbers from the live daily entry', () async {
    stub(
      daily: Result.ok(_overview(me: _entry(rank: 4, points: 95, correctAnswers: 9))),
      weekly: Result.ok(_overview()),
    );

    final result = await read();

    expect(result.correctAnswers, 9);
    expect(result.points, 95);
  });

  test('reports weekly positions gained against the previous week', () async {
    stub(
      daily: Result.ok(_overview()),
      weekly: Result.ok(_overview(me: _entry(rank: 5), previousMe: _entry(rank: 8))),
    );

    final result = await read();

    expect(result.weeklyRankGain, 3);
    expect(result.weeklyRank, 5);
  });

  test('reports no gain when the rank did not improve, but keeps the rank', () async {
    stub(
      daily: Result.ok(_overview()),
      weekly: Result.ok(_overview(me: _entry(rank: 8), previousMe: _entry(rank: 5))),
    );

    final result = await read();

    expect(result.weeklyRankGain, isNull);
    expect(result.weeklyRank, 8);
  });

  test('reports no gain for a leader holding first place', () async {
    stub(
      daily: Result.ok(_overview()),
      weekly: Result.ok(_overview(me: _entry(rank: 1), previousMe: _entry(rank: 1))),
    );

    final result = await read();

    expect(result.weeklyRankGain, isNull);
    expect(result.weeklyRank, 1);
  });

  test('reports no gain without a previous period to compare with', () async {
    stub(
      daily: Result.ok(_overview()),
      weekly: Result.ok(_overview(me: _entry(rank: 5))),
    );

    final result = await read();

    expect(result.weeklyRankGain, isNull);
    expect(result.weeklyRank, 5);
  });

  test('survives a failing leaderboard — the screen still renders', () async {
    stub(
      daily: Result.failed(const NetworkFailure(NetworkFailureReason.server('boom'))),
      weekly: Result.failed(const NetworkFailure(NetworkFailureReason.server('boom'))),
    );

    final result = await read();

    expect(result.correctAnswers, isNull);
    expect(result.points, isNull);
    expect(result.weeklyRank, isNull);
    expect(result.weeklyRankGain, isNull);
  });
}
