import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/leaderboard_season_view.dart';
import 'package:quiz/gen/strings.g.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Scaffold(
      backgroundColor: colors.background.static,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 16, 22, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.t.leaderboard.title.toUpperCase(),
                    style: GoogleFonts.unbounded(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      height: 1,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.t.leaderboard.current_season.toUpperCase(),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
                      letterSpacing: 2,
                      color: colors.text.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const AppDivider(indent: 22, endIndent: 22),
            const Expanded(child: LeaderboardSeasonView()),
          ],
        ),
      ),
    );
  }
}
