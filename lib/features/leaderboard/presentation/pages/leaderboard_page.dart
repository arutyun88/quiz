import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';
import 'package:quiz/features/leaderboard/presentation/provider/leaderboard_provider.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/leaderboard_period_tabs.dart';
import 'package:quiz/features/leaderboard/presentation/widgets/leaderboard_period_view.dart';
import 'package:quiz/gen/strings.g.dart';

class LeaderboardPage extends ConsumerStatefulWidget {
  const LeaderboardPage({super.key});

  @override
  ConsumerState<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends ConsumerState<LeaderboardPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: LeaderboardPeriod.values.length,
      initialIndex: LeaderboardPeriod.values.indexOf(
        ref.read(leaderboardProvider).currentPeriod,
      ),
      vsync: this,
    );
    _tabController.addListener(_onTabIndexChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabIndexChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabIndexChanged() {
    ref.read(leaderboardProvider.notifier).changePeriod(LeaderboardPeriod.values[_tabController.index]);
  }

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
              padding: const EdgeInsets.fromLTRB(22, 16, 22, 0),
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
                  LeaderboardPeriodTabs(controller: _tabController),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const AppDivider(indent: 22, endIndent: 22),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  for (final period in LeaderboardPeriod.values) LeaderboardPeriodView(period: period),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
