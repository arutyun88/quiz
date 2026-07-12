import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/presentation/model/leaderboard_row_item.dart';
import 'package:quiz/gen/strings.g.dart';

class LeaderboardRow extends StatelessWidget {
  const LeaderboardRow({
    super.key,
    required this.entry,
    required this.isFirst,
    required this.isMe,
    this.rankColumnWidth = minRankColumnWidth,
  });

  static const minRankColumnWidth = 46.0;

  final LeaderboardEntity entry;
  final bool isFirst;
  final bool isMe;
  final double rankColumnWidth;

  /// Rank column width sized for the longest rank in the list, so the font
  /// size stays the same across all rows regardless of digit count.
  static double columnWidthFor(int maxRank) {
    final painter = TextPainter(
      text: TextSpan(
        text: maxRank.toString(),
        style: GoogleFonts.unbounded(
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    return math.max(minRankColumnWidth, painter.width + 8);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => isMe ? context.go('/profile') : context.push('/rating/user/${entry.userId}'),
      child: Container(
        decoration: BoxDecoration(
          color: isMe ? colors.background.dynamic : null,
          border: Border(
            top: BorderSide(
              color: isFirst ? colors.text.primary : colors.divider,
              width: isFirst ? 1.5 : 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            SizedBox(
              width: rankColumnWidth,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  _rankValueText(entry.rank),
                  maxLines: 1,
                  style: GoogleFonts.unbounded(
                    fontSize: 22,
                    fontWeight: entry.rank > 0 && entry.rank <= 3 ? FontWeight.w800 : FontWeight.w700,
                    color: _rankColor(context, entry.rank),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.spectral(
                      fontSize: 17,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    '${context.t.leaderboard.accuracy_label} ${entry.accuracyPercent}',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: colors.text.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              entry.points.toString(),
              style: GoogleFonts.unbounded(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: colors.text.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _rankColor(BuildContext context, int rank) {
    final colors = context.palette;

    if (isMe) return colors.text.accent;

    return switch (rank) {
      1 => colors.base.gold,
      2 => colors.base.silver,
      3 => colors.base.bronze,
      _ => colors.text.secondary,
    };
  }

  String _rankValueText(int rank) {
    if (rank <= 0) return '—';
    return rank.toString();
  }
}
