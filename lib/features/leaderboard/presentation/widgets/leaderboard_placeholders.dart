import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/gen/strings.g.dart';

class LeaderboardLoading extends StatelessWidget {
  const LeaderboardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(22, 14, 22, 24),
        children: [
          const _SkeletonBox(height: 88),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
            child: Row(
              children: const [
                _SkeletonBox(width: 38, height: 9),
                SizedBox(width: 8),
                Expanded(child: _SkeletonBox(height: 9)),
                SizedBox(width: 36),
                _SkeletonBox(width: 34, height: 9),
              ],
            ),
          ),
          for (var i = 0; i < 6; i++)
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: i == 0
                        ? context.palette.text.primary
                        : context.palette.divider,
                    width: i == 0 ? 1.5 : 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 13),
              child: Row(
                children: const [
                  _SkeletonBox(width: 28, height: 24),
                  SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SkeletonBox(height: 17),
                        SizedBox(height: 6),
                        _SkeletonBox(width: 78, height: 9),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  _SkeletonBox(width: 46, height: 18),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class LeaderboardError extends StatelessWidget {
  const LeaderboardError({
    super.key,
    required this.title,
    required this.message,
    required this.onRetry,
  });

  final String title;
  final String message;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 22),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.text.primary),
                    ),
                    child: Icon(
                      Icons.priority_high,
                      size: 28,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.unbounded(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.spectral(
                      fontSize: 18,
                      color: colors.text.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppButtonV2(
            label: context.t.leaderboard.retry,
            onTap: (_) => onRetry(),
          ),
        ],
      ),
    );
  }
}

class LeaderboardHistoryEmpty extends StatelessWidget {
  const LeaderboardHistoryEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return LayoutBuilder(
      builder: (context, constraints) => ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: constraints.maxHeight,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.text.primary),
                      ),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        size: 28,
                        color: colors.text.primary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      context.t.leaderboard.history_empty_title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.unbounded(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: colors.text.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      context.t.leaderboard.history_empty_message,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.spectral(
                        fontSize: 18,
                        color: colors.text.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkeletonBox extends StatelessWidget {
  const _SkeletonBox({
    this.width,
    required this.height,
  });

  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.white,
    );
  }
}
