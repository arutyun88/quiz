import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';
import 'package:quiz/gen/strings.g.dart';

class LeaderboardPeriodTabs extends StatelessWidget {
  const LeaderboardPeriodTabs({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final labelStyle = GoogleFonts.jetBrainsMono(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 1,
    );

    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: controller,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        padding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.only(right: 16),
        labelColor: colors.text.primary,
        unselectedLabelColor: colors.text.secondary,
        labelStyle: labelStyle,
        unselectedLabelStyle: labelStyle,
        dividerColor: Colors.transparent,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2, color: colors.text.accent),
          insets: const EdgeInsets.only(bottom: 2),
        ),
        tabs: [
          for (final period in LeaderboardPeriod.values) Tab(height: 28, text: _periodLabel(context, period)),
        ],
      ),
    );
  }

  String _periodLabel(BuildContext context, LeaderboardPeriod period) {
    final tabs = context.t.leaderboard.period_tabs;

    return switch (period) {
      LeaderboardPeriod.daily => tabs.daily,
      LeaderboardPeriod.weekly => tabs.weekly,
      LeaderboardPeriod.monthly => tabs.monthly,
      LeaderboardPeriod.yearly => tabs.yearly,
    };
  }
}
