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
                    _StatsRow(
                      correctAnswers: summary.correctCount,
                      totalXp: summary.totalXp,
                    ),
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

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.correctAnswers,
    required this.totalXp,
  });

  final int correctAnswers;
  final int totalXp;

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
      child: IntrinsicHeight(
        child: Row(
          children: [
            _StatCell(
              value: correctAnswers.toString(),
              label: t.correct_label,
            ),
            _StatCell(
              value: '+$totalXp',
              label: 'XP',
              valueColor: colors.text.accent,
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
