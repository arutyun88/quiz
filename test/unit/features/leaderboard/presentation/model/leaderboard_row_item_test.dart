import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';
import 'package:quiz/features/leaderboard/presentation/model/leaderboard_row_item.dart';

void main() {
  test('adds the current user with gaps when rank is outside loaded page', () {
    final entries = List.generate(
      100,
      (index) => _entry(userId: 'user-$index', rank: index + 1),
    );
    final me = _entry(userId: 'me', rank: 115);

    final items = buildLeaderboardRowItems(LeaderboardOverviewEntity(
      entries: entries,
      me: me,
      total: 201,
    ));

    final gaps = items.whereType<GapRowItem>().toList();
    final myRows =
        items.whereType<EntryRowItem>().where((item) => item.isMe).toList();

    expect(gaps.map((gap) => gap.count), [14, 86]);
    expect(myRows, hasLength(1));
    expect(myRows.single.entry.rank, 115);
  });

  test('does not duplicate the current user already present in loaded page',
      () {
    final me = _entry(userId: 'me', rank: 2);
    final items = buildLeaderboardRowItems(LeaderboardOverviewEntity(
      entries: [_entry(userId: 'first', rank: 1), me],
      me: me,
      total: 2,
    ));

    expect(items.whereType<GapRowItem>(), isEmpty);
    expect(
      items.whereType<EntryRowItem>().where((item) => item.isMe),
      hasLength(1),
    );
  });
}

LeaderboardEntity _entry({required String userId, required int rank}) =>
    LeaderboardEntity(
      seasonId: 'season',
      userId: userId,
      userName: userId,
      rating: 1200 - rank,
      bestRating: 1250,
      officialAnswers: 40,
      provisional: false,
      rank: rank,
    );
