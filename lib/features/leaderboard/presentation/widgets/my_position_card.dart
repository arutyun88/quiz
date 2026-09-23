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
    this.onTap,
  });

  final LeaderboardEntity entry;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final foreground = colors.background.static;
    final accent = colors.text.inverseAccent;
    final mutedForeground = Color.lerp(foreground, colors.text.primary, 0.38)!;
    final canShowInList = entry.rank != null && onTap != null;
    final title = entry.provisional
        ? context.t.leaderboard.provisional.toUpperCase()
        : context.t.leaderboard.my_position.toUpperCase();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: canShowInList ? onTap : null,
        child: Container(
          decoration: BoxDecoration(
            color: colors.text.primary,
          ),
          padding: const EdgeInsets.fromLTRB(16, 13, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        color: accent,
                      ),
                    ),
                  ),
                  if (canShowInList) ...[
                    Text(
                      context.t.leaderboard.show_in_list,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: accent,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_downward,
                      size: 13,
                      color: accent,
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _rankText(entry.rank),
                    style: GoogleFonts.unbounded(
                      fontSize: 33,
                      fontWeight: FontWeight.w800,
                      height: 1,
                      color: foreground,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        entry.displayName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.spectral(
                          fontSize: 19,
                          height: 1,
                          color: foreground,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(height: 1, color: mutedForeground),
              const SizedBox(height: 8),
              Row(
                children: [
                  _Metric(
                    value: entry.rating.toString(),
                    label: context.t.leaderboard.rating_header,
                    foreground: foreground,
                    mutedForeground: mutedForeground,
                  ),
                  _Metric(
                    value: entry.bestRating.toString(),
                    label: context.t.leaderboard.best_rating,
                    foreground: foreground,
                    mutedForeground: mutedForeground,
                  ),
                  _Metric(
                    value: entry.officialAnswers.toString(),
                    label: context.t.leaderboard.answers_header,
                    foreground: foreground,
                    mutedForeground: mutedForeground,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _rankText(int? rank) => rank == null ? '#—' : '#$rank';
}

class _Metric extends StatelessWidget {
  const _Metric({
    required this.value,
    required this.label,
    required this.foreground,
    required this.mutedForeground,
  });

  final String value;
  final String label;
  final Color foreground;
  final Color mutedForeground;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: GoogleFonts.unbounded(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: foreground,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.1,
              color: mutedForeground,
            ),
          ),
        ],
      ),
    );
  }
}
