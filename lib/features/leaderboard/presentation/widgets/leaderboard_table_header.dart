import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/leaderboard_row.dart';
import 'package:quiz/gen/strings.g.dart';

class LeaderboardTableHeader extends StatelessWidget {
  const LeaderboardTableHeader({
    super.key,
    this.rankColumnWidth = LeaderboardRow.minRankColumnWidth,
  });

  final double rankColumnWidth;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.leaderboard;
    final style = GoogleFonts.jetBrainsMono(
      fontSize: 9,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
      color: colors.text.secondary,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: rankColumnWidth,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(t.rank_header, style: style),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(t.participant_header, style: style),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(t.points_header, style: style),
          ),
        ],
      ),
    );
  }
}
