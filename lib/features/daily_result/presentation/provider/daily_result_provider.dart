import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';
import 'package:quiz/features/leaderboard/domain/repository/leaderboard_repository.dart';

/// Everything is nullable on purpose: the screen is reachable right after the
/// last answer of the day and must render even when the leaderboard call fails
/// — the ring, the streak and the CTA do not depend on it.
class DailyResultEntity {
  const DailyResultEntity({
    this.correctAnswers,
    this.points,
    this.weeklyRank,
    this.weeklyRankGain,
  });

  final int? correctAnswers;
  final int? points;

  /// Current position in the weekly leaderboard.
  final int? weeklyRank;

  /// Positions gained against the previous week — `null` unless the rank actually improved.
  /// A loss is not surfaced as a number: the row switches to an encouraging line instead.
  final int? weeklyRankGain;
}

/// Refetched on every entry: the day has just been closed, cached numbers would be stale.
final dailyResultProvider = FutureProvider.autoDispose<DailyResultEntity>((ref) async {
  final repository = getIt<LeaderboardRepository>();

  final results = await Future.wait([
    repository.fetchOverview(LeaderboardPeriod.daily),
    repository.fetchOverview(LeaderboardPeriod.weekly),
  ]);

  final today = _dataOrNull(results[0])?.me;
  final weekly = _dataOrNull(results[1]);

  return DailyResultEntity(
    correctAnswers: today?.correctAnswers,
    points: today?.points,
    weeklyRank: weekly?.me?.rank,
    weeklyRankGain: _rankGain(weekly),
  );
});

LeaderboardOverviewEntity? _dataOrNull(Result<LeaderboardOverviewEntity, Failure> result) {
  return switch (result) {
    ResultOk(:final data) => data,
    ResultFailed() => null,
  };
}

int? _rankGain(LeaderboardOverviewEntity? overview) {
  final me = overview?.me;
  final previousMe = overview?.previousMe;
  if (me == null || previousMe == null) return null;

  final gain = previousMe.rank - me.rank;
  return gain > 0 ? gain : null;
}
