import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_overview_entity.dart';
import 'package:quiz/features/leaderboard/presentation/model/leaderboard_row_item.dart';
import 'package:quiz/features/leaderboard/presentation/provider/leaderboard_provider.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/leaderboard_placeholders.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/leaderboard_row.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/leaderboard_table_header.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/leaderboard_total_footer.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/my_position_card.dart';

class LeaderboardSeasonView extends ConsumerStatefulWidget {
  const LeaderboardSeasonView({super.key});

  @override
  ConsumerState<LeaderboardSeasonView> createState() =>
      _LeaderboardSeasonViewState();
}

class _LeaderboardSeasonViewState extends ConsumerState<LeaderboardSeasonView> {
  static const _topPadding = 14.0;

  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final seasonState = ref.watch(leaderboardProvider);

    return switch (seasonState) {
      BaseLoadingState() => const LeaderboardLoading(),
      BaseDataState(:final data) => _DataView(
          overview: data,
          scrollController: _scrollController,
          onScrollToMe: _scrollToMe,
        ),
      _ => LeaderboardError(
          onRetry: () => ref.read(leaderboardProvider.notifier).fetch(),
        ),
    };
  }

  void _scrollToMe(List<LeaderboardRowItem> items) {
    final myIndex =
        items.indexWhere((item) => item is EntryRowItem && item.isMe);
    if (myIndex < 0 || !_scrollController.hasClients) return;

    var offset = _topPadding;
    for (var i = 0; i < myIndex; i++) {
      offset += items[i].height;
    }

    final position = _scrollController.position;
    final centered =
        offset - (position.viewportDimension - items[myIndex].height) / 2;
    final target = centered.clamp(0.0, position.maxScrollExtent);

    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
    );
  }
}

class _DataView extends StatelessWidget {
  const _DataView({
    required this.overview,
    required this.scrollController,
    required this.onScrollToMe,
  });

  final LeaderboardOverviewEntity overview;
  final ScrollController scrollController;
  final ValueChanged<List<LeaderboardRowItem>> onScrollToMe;

  @override
  Widget build(BuildContext context) {
    final items = buildLeaderboardRowItems(overview);
    if (items.isEmpty) return const LeaderboardEmpty();

    final maxRank = items.whereType<EntryRowItem>().fold(
          0,
          (max, item) => math.max(max, item.entry.rank ?? 0),
        );
    final rankColumnWidth = LeaderboardRow.columnWidthFor(maxRank);

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(
        22,
        _LeaderboardSeasonViewState._topPadding,
        22,
        24,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        final child = switch (item) {
          MyPositionCardItem(:final entry) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: MyPositionCard(
                entry: entry,
                onTap: () => onScrollToMe(items),
              ),
            ),
          TableHeaderItem() =>
            LeaderboardTableHeader(rankColumnWidth: rankColumnWidth),
          EntryRowItem(:final entry, :final isFirst, :final isMe) =>
            LeaderboardRow(
              entry: entry,
              isFirst: isFirst,
              isMe: isMe,
              rankColumnWidth: rankColumnWidth,
            ),
          TotalFooterItem(:final total) => LeaderboardTotalFooter(total: total),
        };

        return SizedBox(height: item.height, child: child);
      },
    );
  }
}
