import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_entity.dart';
import 'package:quiz/features/leaderboard/presentation/model/leaderboard_row_item.dart';
import 'package:quiz/gen/strings.g.dart';

class MyPositionCard extends StatelessWidget {
  const MyPositionCard({
    super.key,
    required this.entry,
    this.previousEntry,
    this.onTap,
  });

  final LeaderboardEntity entry;
  final LeaderboardEntity? previousEntry;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final foreground = colors.background.static;
    final mutedForeground = Color.lerp(foreground, colors.text.primary, 0.42)!;
    final rankDelta = _rankDeltaText(entry, previousEntry);
    final title = [
      context.t.leaderboard.my_position.toUpperCase(),
      if (rankDelta != null) rankDelta,
    ].join(' · ');

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        color: colors.text.primary,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            ConstrainedBox(
              // Не даём длинному рангу (#12345) отжать имя — за пределами
              // лимита число ужимается, а не растягивает колонку.
              constraints: const BoxConstraints(maxWidth: 132),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  _rankText(entry.rank),
                  maxLines: 1,
                  style: GoogleFonts.unbounded(
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                    height: 0.9,
                    color: foreground,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                      color: colors.text.accent,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    entry.displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.spectral(
                      fontSize: 19,
                      color: foreground,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _summaryText(context, entry),
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _summaryText(BuildContext context, LeaderboardEntity entry) {
    final pointsLabel = context.t.leaderboard.points_header;

    return '${entry.points} $pointsLabel · ${entry.accuracyPercent} · ${entry.correctAnswers}/${entry.questionsAnswered}';
  }

  String _rankText(int rank) {
    if (rank <= 0) return '#—';
    return '#$rank';
  }

  String? _rankDeltaText(
    LeaderboardEntity current,
    LeaderboardEntity? previous,
  ) {
    if (previous == null || current.rank <= 0 || previous.rank <= 0) {
      return null;
    }

    final delta = previous.rank - current.rank;
    if (delta > 0) return '↑$delta';
    if (delta < 0) return '↓${delta.abs()}';
    return null;
  }
}
