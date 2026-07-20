import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_timeline_entity.dart';
import 'package:quiz/gen/strings.g.dart';

/// Rank over a calendar window: one vertical line per day, a dot on the days the user played.
///
/// Days keep their calendar slot even when they were not played, so the spacing between dots is real time.
///
/// The scale is logarithmic — a single bad day can sit thousands of places below the usual range, and on a linear
/// scale that outlier flattens everything else into a couple of pixels.
class RankSparkline extends StatelessWidget {
  const RankSparkline({super.key, required this.days});

  final List<TimelineDayEntity> days;

  static const _height = 110.0;
  static const _labelsHeight = 16.0;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final oldestFirst = days.reversed.toList();

    return SizedBox(
      height: _height + _labelsHeight,
      child: CustomPaint(
        size: Size.infinite,
        painter: _RankSparklinePainter(
          ranks: oldestFirst.map((day) => day.rank).toList(),
          dateLabels: _dateLabels(context, oldestFirst),
          chartHeight: _height,
          lineColor: colors.text.accent,
          gridColor: colors.divider,
          dayLineColor: Color.alphaBlend(colors.divider.withValues(alpha: 0.5), colors.background.static),
          labelStyle: GoogleFonts.jetBrainsMono(fontSize: 9, color: colors.text.secondary),
          todayLabelStyle: GoogleFonts.jetBrainsMono(fontSize: 9, color: colors.text.primary),
        ),
      ),
    );
  }

  /// Only a few days are labelled — a label under every vertical line would not fit.
  Map<int, String> _dateLabels(BuildContext context, List<TimelineDayEntity> oldestFirst) {
    if (oldestFirst.isEmpty) return const {};

    final last = oldestFirst.length - 1;
    final format = DateFormat('d MMMM', LocaleSettings.instance.currentLocale.languageCode);

    return {
      for (final index in {0, (last / 3).round(), (last * 2 / 3).round()})
        if (index < last) index: format.format(oldestFirst[index].date),
      last: context.t.leaderboard.history.chart_end,
    };
  }
}

class _RankSparklinePainter extends CustomPainter {
  _RankSparklinePainter({
    required this.ranks,
    required this.dateLabels,
    required this.chartHeight,
    required this.lineColor,
    required this.gridColor,
    required this.dayLineColor,
    required this.labelStyle,
    required this.todayLabelStyle,
  });

  final List<int?> ranks;
  final Map<int, String> dateLabels;
  final double chartHeight;
  final Color lineColor;
  final Color gridColor;
  final Color dayLineColor;
  final TextStyle labelStyle;
  final TextStyle todayLabelStyle;

  static const _plainGridLines = 3;
  static const _dotRadius = 3.5;
  static const _currentDotRadius = 5.5;
  static const _minStemHeight = 3.0;

  @override
  void paint(Canvas canvas, Size size) {
    final chart = Size(size.width, chartHeight);
    final played = ranks.whereType<int>().toList();

    _paintDayLines(canvas, chart, played);

    if (played.isEmpty) {
      _paintPlainGrid(canvas, chart);
      _paintDateLabels(canvas, size);
      return;
    }

    final best = played.reduce(math.min);
    final worst = played.reduce(math.max);

    _paintGrid(canvas, chart, best, worst);
    _paintDays(canvas, chart, best, worst);
    _paintDateLabels(canvas, size);
  }

  double _xOf(int index, Size size) => ranks.length == 1 ? size.width / 2 : size.width * index / (ranks.length - 1);

  double _yOf(int rank, Size size, int best, int worst) {
    final usableHeight = size.height - _currentDotRadius * 2;
    // A flat history has nothing to scale against — draw it through the middle
    if (worst == best) return size.height / 2;

    final logBest = math.log(best);
    final logSpan = math.log(worst) - logBest;
    // Keep the dot inside the canvas and leave room for the widest dot
    return _currentDotRadius + usableHeight * (math.log(rank) - logBest) / logSpan;
  }

  /// The day grid, drawn under everything: every day of the window gets a hairline, played or not.
  void _paintDayLines(Canvas canvas, Size size, List<int> played) {
    final paint = Paint()
      ..color = dayLineColor
      ..strokeWidth = 1;

    for (var i = 0; i < ranks.length; i++) {
      final x = _xOf(i, size);
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  void _paintDays(Canvas canvas, Size size, int best, int worst) {
    final currentIndex = ranks.lastIndexWhere((rank) => rank != null);

    for (var i = 0; i < ranks.length; i++) {
      final rank = ranks[i];
      if (rank == null) continue;

      final isCurrent = i == currentIndex;
      final x = _xOf(i, size);
      final y = _yOf(rank, size, best, worst);

      // Stem from the dot down to the baseline: taller means a better place. Kept a few pixels tall even at the
      // very bottom so the worst day still reads as a day with a result rather than a gap
      canvas.drawLine(
        Offset(x, math.min(y, size.height - _minStemHeight)),
        Offset(x, size.height),
        Paint()
          ..color = lineColor.withValues(alpha: isCurrent ? 0.35 : 0.22)
          ..strokeWidth = 1.5,
      );

      canvas.drawCircle(
        Offset(x, y),
        isCurrent ? _currentDotRadius : _dotRadius,
        Paint()..color = lineColor,
      );
    }
  }

  void _paintGrid(Canvas canvas, Size size, int best, int worst) {
    final gridRanks = _gridRanks(best, worst);
    if (gridRanks.isEmpty) {
      _paintPlainGrid(canvas, size);
      return;
    }

    final gridPaint = Paint()
      ..color = gridColor
      ..strokeWidth = 1;

    for (final rank in gridRanks) {
      final y = _yOf(rank, size, best, worst);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);

      final label = TextPainter(
        text: TextSpan(text: '#$rank', style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      label.paint(canvas, Offset(2, math.max(y - label.height - 2, 0)));
    }
  }

  /// Ranks to put gridlines on: round powers of ten inside the range, so the chart reads "top ten / top hundred".
  /// Within a single decade there is no such power, so the ticks are spaced evenly in log space instead.
  List<int> _gridRanks(int best, int worst) {
    if (worst == best) return const [];

    final decades = <int>[
      for (var rank = 10; rank < worst; rank *= 10)
        if (rank > best) rank,
    ];
    if (decades.isNotEmpty) return decades;

    final logBest = math.log(best);
    final step = (math.log(worst) - logBest) / 4;

    return {
      for (var i = 1; i <= 3; i++) math.exp(logBest + step * i).round(),
    }.where((rank) => rank > best && rank < worst).toList();
  }

  void _paintPlainGrid(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = gridColor
      ..strokeWidth = 1;

    for (var i = 1; i <= _plainGridLines; i++) {
      final y = size.height * i / (_plainGridLines + 1);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  void _paintDateLabels(Canvas canvas, Size size) {
    final chartWidth = size.width;

    for (final entry in dateLabels.entries) {
      final isLast = entry.key == ranks.length - 1;
      final label = TextPainter(
        text: TextSpan(text: entry.value.toUpperCase(), style: isLast ? todayLabelStyle : labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      final x = _xOf(entry.key, Size(chartWidth, chartHeight));
      // First and last labels hug the edges instead of centring, so they stay inside the canvas
      final dx = switch (entry.key) {
        0 => 0.0,
        _ when isLast => chartWidth - label.width,
        _ => (x - label.width / 2).clamp(0.0, chartWidth - label.width),
      };
      label.paint(canvas, Offset(dx, chartHeight + 5));
    }
  }

  @override
  bool shouldRepaint(_RankSparklinePainter oldDelegate) =>
      !listEquals(oldDelegate.ranks, ranks) ||
      !mapEquals(oldDelegate.dateLabels, dateLabels) ||
      oldDelegate.lineColor != lineColor ||
      oldDelegate.gridColor != gridColor ||
      oldDelegate.dayLineColor != dayLineColor ||
      oldDelegate.labelStyle != labelStyle;
}
