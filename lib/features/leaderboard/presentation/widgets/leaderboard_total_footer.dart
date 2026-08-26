import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/gen/strings.g.dart';

class LeaderboardTotalFooter extends StatelessWidget {
  const LeaderboardTotalFooter({super.key, required this.total});

  final int total;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colors.text.primary, width: 1.5),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        context.t.leaderboard.total_participants(n: total),
        style: GoogleFonts.jetBrainsMono(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
          color: colors.text.secondary,
        ),
      ),
    );
  }
}
