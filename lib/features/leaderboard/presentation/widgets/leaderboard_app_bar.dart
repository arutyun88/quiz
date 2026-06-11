import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/leaderboard/domain/entity/leaderboard_period.dart';
import 'package:quiz/gen/strings.g.dart';

class LeaderboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LeaderboardAppBar({
    super.key,
    required this.period,
    required this.swipeProgress,
    this.isScrolledUnder = false,
  });

  final LeaderboardPeriod period;
  final double swipeProgress;
  final bool isScrolledUnder;

  static const _scrolledUnderElevation = 3.0;
  static const _titleGap = 10.0;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      scrolledUnderElevation: isScrolledUnder ? _scrolledUnderElevation : 0.0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              context.t.leaderboard.title,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: _titleGap),
          Flexible(
            child: _PeriodCarousel(
              period: period,
              swipeProgress: swipeProgress,
            ),
          ),
        ],
      ),
    );
  }
}

class _PeriodCarousel extends StatelessWidget {
  const _PeriodCarousel({
    required this.period,
    required this.swipeProgress,
  });

  final LeaderboardPeriod period;
  final double swipeProgress;

  static const _visibleHalf = 1.2;
  static const _itemHeightMultiplier = 1.3;

  /// Непрерывное значение позиции: 0 = День, 1 = Неделя, ...
  /// swipeProgress > 0 - движение к предыдущему (index ниже)
  /// swipeProgress < 0 - движение к следующему (index выше)
  double get _page => LeaderboardPeriod.values.indexOf(period) - swipeProgress;

  @override
  Widget build(BuildContext context) {
    final periods = LeaderboardPeriod.values;

    final titleStyle = Theme.of(context).appBarTheme.titleTextStyle ??
        Theme.of(context).textTheme.titleLarge ??
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    final itemHeight = (titleStyle.fontSize ?? 20) * _itemHeightMultiplier;
    final containerHeight = itemHeight * (_visibleHalf * 2 + 1);

    return SizedBox(
      height: containerHeight,
      child: ClipRect(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: List.generate(periods.length, (i) {
            final distance = (i - _page).abs();
            final offset = (i - _page) * itemHeight;
            final t = (1.0 - distance).clamp(0.0, 1.0);

            final color = Color.lerp(
              context.palette.text.secondary.withValues(alpha: 0),
              context.palette.text.secondary,
              t,
            )!;

            return Transform.translate(
              offset: Offset(0, offset),
              child: Text(
                _periodLabel(context, periods[i]),
                overflow: TextOverflow.ellipsis,
                style: titleStyle.copyWith(color: color),
              ),
            );
          }),
        ),
      ),
    );
  }

  String _periodLabel(BuildContext context, LeaderboardPeriod period) {
    final periods = context.t.leaderboard.periods;

    return switch (period) {
      LeaderboardPeriod.daily => periods.daily,
      LeaderboardPeriod.weekly => periods.weekly,
      LeaderboardPeriod.monthly => periods.monthly,
      LeaderboardPeriod.yearly => periods.yearly,
    };
  }
}
