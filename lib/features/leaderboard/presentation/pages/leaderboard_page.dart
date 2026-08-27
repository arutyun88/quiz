import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/leaderboard_season_view.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/season_history_view.dart';
import 'package:quiz/gen/strings.g.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  var _historySelected = false;

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
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      _SectionTab(
                        label: context.t.leaderboard.current_tab,
                        selected: !_historySelected,
                        onTap: () => setState(() => _historySelected = false),
                      ),
                      const SizedBox(width: 20),
                      _SectionTab(
                        label: context.t.leaderboard.history_tab,
                        selected: _historySelected,
                        onTap: () => setState(() => _historySelected = true),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const AppDivider(indent: 22, endIndent: 22),
            Expanded(
              child: _historySelected
                  ? const SeasonHistoryView()
                  : const LeaderboardSeasonView(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTab extends StatelessWidget {
  const _SectionTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            label.toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 10,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              letterSpacing: 1.5,
              color: selected
                  ? context.palette.text.accent
                  : context.palette.text.secondary,
              decoration: selected ? TextDecoration.underline : null,
              decorationThickness: 2,
            ),
          ),
        ),
      );
}
