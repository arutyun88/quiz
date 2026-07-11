import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';

sealed class LeaderboardRowItem {
  const LeaderboardRowItem();

  double get height;
}

class MyPositionCardItem extends LeaderboardRowItem {
  const MyPositionCardItem({
    required this.entry,
    this.previousEntry,
  });

  final LeaderboardEntity entry;
  final LeaderboardEntity? previousEntry;

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

class GapRowItem extends LeaderboardRowItem {
  const GapRowItem({required this.hiddenCount});

  final int hiddenCount;

  @override
  double get height => 44;
}

class TotalFooterItem extends LeaderboardRowItem {
  const TotalFooterItem({required this.total});

  final int total;

  @override
  double get height => 48;
}

extension LeaderboardEntryText on LeaderboardEntity {
  String get displayName {
    final trimmedName = name?.trim();
    if (trimmedName != null && trimmedName.isNotEmpty) return trimmedName;
    return email;
  }

  String get accuracyPercent => '${(accuracy * 100).round()}%';
}

List<LeaderboardRowItem> buildLeaderboardRowItems(LeaderboardOverviewEntity overview) {
  final items = <LeaderboardRowItem>[];
  final me = overview.me;
  final hasRankedMe = me != null && me.rank > 0;

  if (hasRankedMe) {
    items.add(MyPositionCardItem(entry: me, previousEntry: overview.previousMe));
  }

  if (overview.top.isEmpty) return items;

  items.add(const TableHeaderItem());

  final lastTopRank = overview.top.last.rank;

  for (final (index, entry) in overview.top.indexed) {
    items.add(EntryRowItem(
      entry: entry,
      isFirst: index == 0,
      isMe: hasRankedMe && entry.userId == me.userId,
    ));
  }

  if (hasRankedMe && me.rank > lastTopRank) {
    final around = overview.around.where((entry) => entry.rank > lastTopRank).toList();

    if (around.isNotEmpty) {
      final hiddenCount = around.first.rank - lastTopRank - 1;
      if (hiddenCount > 0) {
        items.add(GapRowItem(hiddenCount: hiddenCount));
      }

      for (final entry in around) {
        items.add(EntryRowItem(
          entry: entry,
          isFirst: false,
          isMe: entry.userId == me.userId,
        ));
      }
    }
  }

  if (overview.total > 0) {
    items.add(TotalFooterItem(total: overview.total));
  }

  return items;
}
