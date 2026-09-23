import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/gen/strings.g.dart';

class LeaderboardGapRow extends StatelessWidget {
  const LeaderboardGapRow({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.divider)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Text(
            '⋯',
            style: GoogleFonts.spectral(
              fontSize: 24,
              color: colors.text.secondary,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            context.t.leaderboard.gap_row(n: count),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              color: colors.text.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
