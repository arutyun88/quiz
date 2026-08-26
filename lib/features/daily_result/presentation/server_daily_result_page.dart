import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/app_progress_ring.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/gen/strings.g.dart';

class ServerDailyResultPage extends StatelessWidget {
  const ServerDailyResultPage({
    super.key,
    required this.summary,
    required this.onContinue,
  });

  final DailySummaryEntity summary;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.daily_result;
    final requiredCount = summary.requiredCount;
    final progress = requiredCount == 0
        ? 0.0
        : (summary.resolvedCount / requiredCount).clamp(0.0, 1.0);

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
                      progress: progress,
                      value: summary.resolvedCount.toString(),
                      label: t.ring_label(total: requiredCount),
                      valueFontSize: 64,
                    ),
                    const SizedBox(height: 30),
                    _StatsGrid(summary: summary),
                    if (summary.streakAfter != null) ...[
                      const SizedBox(height: 18),
                      _StreakSnapshot(days: summary.streakAfter!),
                    ],
                    if (summary.percentile != null ||
                        summary.seasonRankDelta != null) ...[
                      const SizedBox(height: 18),
                      _ExtendedStats(summary: summary),
                    ],
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
              children: [
                TextSpan(
                  text: '.',
                  style: TextStyle(color: colors.text.accent),
                ),
              ],
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

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.summary});

  final DailySummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.daily_result;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colors.text.primary, width: 1.5),
          bottom: BorderSide(color: colors.text.primary, width: 1.5),
        ),
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                _StatCell(
                  value: '${summary.correctCount}/${summary.requiredCount}',
                  label: t.correct_label,
                ),
                _StatCell(
                  value: summary.hintCount.toString(),
                  label: t.hints_label,
                  hasLeftBorder: true,
                ),
              ],
            ),
          ),
          Divider(height: 1, color: colors.divider),
          IntrinsicHeight(
            child: Row(
              children: [
                _StatCell(
                  value: _signed(summary.ratingDelta),
                  label: t.rating_label,
                  valueColor: colors.text.accent,
                ),
                _StatCell(
                  value: _percentage(summary.accuracy),
                  label: t.accuracy_label,
                  hasLeftBorder: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static String _signed(int? value) {
    if (value == null) return '—';
    if (value > 0) return '+$value';
    if (value < 0) return '−${value.abs()}';
    return '0';
  }

  static String _percentage(double? value) {
    if (value == null) return '—';
    return '${(value * 100).round()}%';
  }
}

class _StreakSnapshot extends StatelessWidget {
  const _StreakSnapshot({required this.days});

  final int days;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.local_fire_department, color: colors.base.gold),
        const SizedBox(width: 8),
        Text(
          context.t.daily_result.streak_value(n: days),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            color: colors.text.primary,
          ),
        ),
      ],
    );
  }
}

class _ExtendedStats extends StatelessWidget {
  const _ExtendedStats({required this.summary});

  final DailySummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    final t = context.t.daily_result;
    return Row(
      children: [
        if (summary.percentile case final double percentile)
          _ExtendedStat(
            label: t.percentile_label,
            value: '${percentile.round()}%',
          ),
        if (summary.percentile != null && summary.seasonRankDelta != null)
          const SizedBox(width: 12),
        if (summary.seasonRankDelta case final int delta)
          _ExtendedStat(
            label: t.season_rank_label,
            value: delta > 0 ? '+$delta' : delta.toString(),
          ),
      ],
    );
  }
}

class _ExtendedStat extends StatelessWidget {
  const _ExtendedStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: colors.card.background,
          border: Border.all(color: colors.card.border),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Column(
          children: [
            Text(
              value,
              style: GoogleFonts.unbounded(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: colors.text.primary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 8,
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

class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.value,
    required this.label,
    this.valueColor,
    this.hasLeftBorder = false,
  });

  final String value;
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
            left: hasLeftBorder
                ? BorderSide(color: colors.divider)
                : BorderSide.none,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: GoogleFonts.unbounded(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: valueColor ?? colors.text.primary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
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
