import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/app_progress_ring.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/features/daily_result/presentation/provider/daily_result_provider.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';
import 'package:quiz/features/home/presentation/provider/start_day_config_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class DailyResultPage extends ConsumerWidget {
  const DailyResultPage({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.palette;
    final t = context.t.daily_result;
    final total = ref.watch(startDayConfigProvider).questionCount;
    final result = ref.watch(dailyResultProvider).valueOrNull;
    final streak = ref.watch(gamificationProvider).whenOrNull(data: (d) => d.streakDays);

    return Scaffold(
      backgroundColor: colors.background.static,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _Header(),
            const AppDivider(indent: 22, endIndent: 22),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
                child: Column(
                  children: [
                    Text(
                      t.goal_completed,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        color: colors.text.accent,
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppProgressRing(
                      size: 200,
                      progress: 1,
                      value: total.toString(),
                      label: t.ring_label(total: total),
                      valueFontSize: 64,
                    ),
                    const SizedBox(height: 30),
                    _StatsRow(
                      correctAnswers: result?.correctAnswers,
                      points: result?.points,
                      streakDays: streak,
                    ),
                    _WeeklyRankRow(rank: result?.weeklyRank, gain: result?.weeklyRankGain),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 16, 22, 30),
              child: Column(
                children: [
                  AppButtonV2(
                    label: t.continue_button,
                    onTap: (complete) {
                      complete();
                      onContinue();
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    t.footer,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      color: colors.text.secondary,
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
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: 'QUIZ',
              children: [TextSpan(text: '.', style: TextStyle(color: colors.text.accent))],
            ),
            style: GoogleFonts.unbounded(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              color: colors.text.primary,
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context.goNamed('home'),
            child: Icon(Icons.close, size: 22, color: colors.text.primary),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.correctAnswers,
    required this.points,
    required this.streakDays,
  });

  final int? correctAnswers;
  final int? points;
  final int? streakDays;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.daily_result;

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.text.primary, width: 1.5)),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            _StatCell(value: correctAnswers?.toString(), label: t.correct_label),
            _StatCell(
              value: points == null ? null : '+$points',
              label: t.points_label,
              valueColor: colors.text.accent,
              hasLeftBorder: true,
            ),
            _StatCell(
              value: streakDays?.toString(),
              label: t.streak_label,
              hasLeftBorder: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.value,
    required this.label,
    this.valueColor,
    this.hasLeftBorder = false,
  });

  /// `null` renders an em dash — the leaderboard call may have failed.
  final String? value;
  final String label;
  final Color? valueColor;
  final bool hasLeftBorder;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: hasLeftBorder ? BorderSide(color: colors.divider) : BorderSide.none,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value ?? '—',
              style: GoogleFonts.unbounded(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: valueColor ?? colors.text.primary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 9,
                fontWeight: FontWeight.w500,
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

class _WeeklyRankRow extends StatelessWidget {
  const _WeeklyRankRow({required this.rank, required this.gain});

  final int? rank;
  final int? gain;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.daily_result;
    const accent = TextStyle(fontStyle: FontStyle.italic);

    final (TextSpan text, IconData icon, Color iconColor) = switch ((rank, gain)) {
      (_, final int gain) => (
          t.rank_up(
            positions: TextSpan(text: t.rank_up_positions(n: gain), style: accent),
          ),
          Icons.trending_up,
          colors.answer.success,
        ),
      (1, _) => (
          t.rank_leader(accent: (text) => TextSpan(text: text, style: accent)),
          Icons.emoji_events,
          colors.base.gold,
        ),
      (final int rank, _) => (
          t.rank_current(rank: TextSpan(text: '#$rank', style: accent)),
          Icons.insights,
          colors.text.accent,
        ),
      _ => (
          t.rank_unknown(accent: (text) => TextSpan(text: text, style: accent)),
          Icons.insights,
          colors.text.accent,
        ),
    };

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
          Icon(icon, size: 20, color: iconColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              text,
              style: GoogleFonts.spectral(fontSize: 15, color: colors.text.primary),
            ),
          ),
        ],
      ),
    );
  }
}
