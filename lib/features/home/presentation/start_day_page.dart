import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';
import 'package:quiz/features/home/presentation/provider/start_day_config_provider.dart';
import 'package:quiz/features/home/presentation/widgets/start_day_header.dart';
import 'package:quiz/features/leaderboard/presentation/provider/last_session_leaderboard_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class StartDayPage extends ConsumerWidget {
  const StartDayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.palette;
    final gamification = ref.watch(gamificationProvider);
    final lastSession = ref.watch(lastSessionLeaderboardProvider);

    final level = gamification.whenOrNull(data: (d) => d.level);
    final streak = gamification.whenOrNull(data: (d) => d.streakDays) ?? 0;
    final points = lastSession.whenOrNull(data: (e) => e?.points);
    final accuracy = lastSession.whenOrNull(data: (e) => e?.accuracy);
    final rank = lastSession.whenOrNull(data: (e) => e?.rank);

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: colors.background.static,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StartDayHeader(streak: streak, level: level),
              AppDivider(indent: 22, endIndent: 22),
              Expanded(
                child: _Body(
                  rank: rank,
                  points: points,
                  accuracy: accuracy,
                  streakDays: streak,
                ),
              ),
              const _StartDayButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.rank,
    required this.points,
    required this.accuracy,
    required this.streakDays,
  });

  final int? rank;
  final int? points;
  final double? accuracy;
  final int streakDays;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 24, 22, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.t.start_day.ready_title,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                letterSpacing: 2,
                color: context.palette.text.accent,
              ),
            ),
            const SizedBox(height: 8),
            const _IssueCountRow(),
            const SizedBox(height: 24),
            Text(
              context.t.start_day.last_session_stats_title,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                letterSpacing: 2,
                color: context.palette.text.accent,
              ),
            ),
            const SizedBox(height: 8),
            _StatsRow(rank: rank, points: points, accuracy: accuracy),
            if (streakDays > 0) const _StreakWarning(),
          ],
        ),
      ),
    );
  }
}

class _IssueCountRow extends ConsumerWidget {
  const _IssueCountRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.palette;
    final config = ref.watch(startDayConfigProvider);
    final t = context.t.start_day;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          config.questionCount.toString(),
          style: GoogleFonts.unbounded(
            fontSize: 92,
            fontWeight: FontWeight.w800,
            color: colors.text.primary,
            height: 0.8,
            letterSpacing: -2,
          ),
        ),
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                t.question_count_label(n: config.questionCount),
                style: GoogleFonts.unbounded(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: colors.text.primary,
                  height: 1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                t.estimated_time(n: config.estimatedMinutes),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
                  letterSpacing: 1,
                  color: colors.text.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.rank,
    required this.points,
    required this.accuracy,
  });

  final int? rank;
  final int? points;
  final double? accuracy;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.start_day;
    final accuracyText = accuracy != null ? '${(accuracy! * 100).round()}%' : '—';
    final rankText = rank != null ? '#$rank' : '—';
    final pointsText = points?.toString() ?? '—';

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colors.text.primary, width: 1.5),
        ),
      ),
      child: Row(
        children: [
          _StatCell(value: rankText, label: t.rank_label, valueColor: colors.text.primary),
          _StatCell(value: pointsText, label: t.points_label, valueColor: colors.text.primary, leftBorder: true),
          _StatCell(value: accuracyText, label: t.accuracy_label, valueColor: colors.text.accent, leftBorder: true),
        ],
      ),
    );
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.value,
    required this.label,
    required this.valueColor,
    this.leftBorder = false,
  });

  final String value;
  final String label;
  final Color valueColor;
  final bool leftBorder;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Expanded(
      child: Container(
        decoration: leftBorder ? BoxDecoration(border: Border(left: BorderSide(color: colors.divider))) : null,
        padding: EdgeInsets.fromLTRB(leftBorder ? 16 : 0, 14, 0, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: GoogleFonts.unbounded(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: valueColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 9,
                letterSpacing: 0.5,
                color: colors.text.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StreakWarning extends StatelessWidget {
  const _StreakWarning();

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final textStyle = GoogleFonts.spectral(
      fontSize: 15,
      color: colors.text.primary,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colors.divider),
          bottom: BorderSide(color: colors.text.primary, width: 1.5),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
      child: Row(
        children: [
          Icon(Icons.local_fire_department, size: 20, color: colors.base.gold),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              context.t.start_day.streak_warning(
                accent: (text) => TextSpan(
                  text: text,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class _StartDayButton extends StatelessWidget {
  const _StartDayButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
      child: AppButtonV2(
        label: context.t.start_day.start_button,
        onTap: (complete) {
          complete();
          context.goNamed('quiz');
          return null;
        },
      ),
    );
  }
}
