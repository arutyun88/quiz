import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
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
  const LeaderboardError({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 28, 22, 24),
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: colors.text.primary, width: 1.5),
              bottom: BorderSide(color: colors.divider),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Column(
            children: [
              Text(
                context.t.leaderboard.load_failed,
                textAlign: TextAlign.center,
                style: GoogleFonts.spectral(
                  fontSize: 17,
                  color: colors.text.primary,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onRetry,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.text.primary, width: 1.5),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.refresh, size: 18, color: colors.text.primary),
                      const SizedBox(width: 8),
                      Text(
                        context.t.leaderboard.retry,
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: colors.text.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LeaderboardEmpty extends StatelessWidget {
  const LeaderboardEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 14, 22, 24),
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: colors.text.primary, width: 1.5),
              bottom: BorderSide(color: colors.divider),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
            context.t.leaderboard.empty,
            textAlign: TextAlign.center,
            style: GoogleFonts.spectral(
              fontSize: 17,
              color: colors.text.secondary,
            ),
          ),
        ),
      ],
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
