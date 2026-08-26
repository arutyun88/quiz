import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';

sealed class LeaderboardRowItem {
  const LeaderboardRowItem();

  double get height;
}

class MyPositionCardItem extends LeaderboardRowItem {
  const MyPositionCardItem({required this.entry});

  final LeaderboardEntity entry;

  @override
  double get height => 104;
}

class TableHeaderItem extends LeaderboardRowItem {
  const TableHeaderItem();

  @override
  double get height => 26;
}

class EntryRowItem extends LeaderboardRowItem {
  const EntryRowItem({
    required this.entry,
    required this.isFirst,
    required this.isMe,
  });

  final LeaderboardEntity entry;

  final bool isFirst;

  final bool isMe;

  @override
  double get height => 64;
}

class TotalFooterItem extends LeaderboardRowItem {
  const TotalFooterItem({required this.total});

  final int total;

  @override
  double get height => 48;
}

extension LeaderboardEntryText on LeaderboardEntity {
  String get displayName {
    final trimmedName = userName?.trim();
    if (trimmedName != null && trimmedName.isNotEmpty) return trimmedName;
    return '—';
  }
}

List<LeaderboardRowItem> buildLeaderboardRowItems(
    LeaderboardOverviewEntity overview) {
  final items = <LeaderboardRowItem>[];
  final me = overview.me;
  items.add(MyPositionCardItem(entry: me));

  if (overview.entries.isEmpty) return items;

  items.add(const TableHeaderItem());

  for (final (index, entry) in overview.entries.indexed) {
    items.add(EntryRowItem(
      entry: entry,
      isFirst: index == 0,
      isMe: entry.userId == me.userId,
    ));
  }

  if (overview.total > 0) {
    items.add(TotalFooterItem(total: overview.total));
  }

  return items;
}
