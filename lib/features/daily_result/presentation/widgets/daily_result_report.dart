import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/utils/localized_ordinal_day.dart';
import 'package:quiz/features/daily_edition/domain/entity/daily_edition_entity.dart';
import 'package:quiz/gen/strings.g.dart';

class DailyResultReport extends StatelessWidget {
  const DailyResultReport({super.key, required this.summary});

  final DailySummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.daily_result;
    final accuracy = ((summary.accuracy ?? 0) * 100).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        Text.rich(
          TextSpan(
            text: summary.correctCount.toString(),
            children: [
              TextSpan(
                text: ' / ${summary.requiredCount}',
                style: GoogleFonts.unbounded(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: colors.text.secondary,
                ),
              ),
            ],
          ),
          style: GoogleFonts.unbounded(
            fontSize: 64,
            fontWeight: FontWeight.w800,
            height: 1,
            color: colors.text.primary,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          t.score_caption(accuracy: accuracy),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
            color: colors.text.secondary,
          ),
        ),
        const SizedBox(height: 18),
        _AnswerSegments(summary: summary),
        const SizedBox(height: 30),
        _ResultStats(summary: summary),
        const SizedBox(height: 18),
        _ResultInsight(summary: summary),
      ],
    );
  }
}

class _AnswerSegments extends StatelessWidget {
  const _AnswerSegments({required this.summary});

  final DailySummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final total = summary.requiredCount;
    if (total <= 0) return const SizedBox.shrink();

    final answered =
        (summary.resolvedCount - summary.skippedCount).clamp(0, total);
    final correct = summary.correctCount.clamp(0, answered);

    return Semantics(
      label: context.t.daily_result.score_semantics(
        correct: correct,
        total: total,
      ),
      child: Row(
        children: List.generate(total, (index) {
          final Color color;
          if (index < correct) {
            color = colors.text.accent;
          } else if (index < answered) {
            color = colors.text.primary;
          } else {
            color = colors.divider;
          }
          return Expanded(
            child: Container(
              height: 8,
              margin: EdgeInsets.only(right: index == total - 1 ? 0 : 4),
              color: color,
            ),
          );
        }),
      ),
    );
  }
}

class _ResultStats extends StatelessWidget {
  const _ResultStats({required this.summary});

  final DailySummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    final t = context.t.daily_result;
    final stats = <({String value, String label})>[
      (value: '+${summary.totalXp}', label: t.xp_label),
      if (summary.ratingDelta case final ratingDelta?)
        (value: _signed(ratingDelta), label: t.rating_label),
      if (summary.streakAfter != null)
        (
          value: _signed(summary.streakDelta ?? 1),
          label: t.streak_stat_label,
        ),
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: context.palette.text.primary, width: 1.5),
          bottom: BorderSide(color: context.palette.text.primary, width: 1.5),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            for (var index = 0; index < stats.length; index++)
              Expanded(
                child: _ResultStat(
                  value: stats[index].value,
                  label: stats[index].label,
                  showDivider: index > 0,
                ),
              ),
          ],
        ),
      ),
    );
  }

  static String _signed(int value) {
    if (value > 0) return '+$value';
    if (value < 0) return '−${value.abs()}';
    return '0';
  }
}

class _ResultStat extends StatelessWidget {
  const _ResultStat({
    required this.value,
    required this.label,
    required this.showDivider,
  });

  final String value;
  final String label;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left:
              showDivider ? BorderSide(color: colors.divider) : BorderSide.none,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: GoogleFonts.unbounded(
              fontSize: 24,
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
              fontWeight: FontWeight.w500,
              letterSpacing: 0.6,
              color: colors.text.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultInsight extends StatelessWidget {
  const _ResultInsight({required this.summary});

  final DailySummaryEntity summary;

  @override
  Widget build(BuildContext context) {
    final t = context.t.daily_result;
    final text = switch ((summary.percentile, summary.streakAfter)) {
      (final percentile?, _) =>
        t.percentile_insight(percentile: percentile.round()),
      (_, final streak?) => t.streak_insight(
          day: localizedOrdinalDay(
            streak + 1,
            Localizations.localeOf(context).languageCode,
          ),
        ),
      _ => t.completed_insight,
    };

    return Text(
      text,
      style: GoogleFonts.spectral(
        fontSize: 15,
        fontStyle: FontStyle.italic,
        color: context.palette.text.primary,
      ),
    );
  }
}
