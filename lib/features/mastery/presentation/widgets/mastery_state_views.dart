import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/gen/strings.g.dart';

class MasteryLoadingView extends StatelessWidget {
  const MasteryLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return AppShimmer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 32),
        children: [
          _Skeleton(width: 130, height: 10, color: colors.background.dynamic),
          for (var i = 0; i < 4; i++) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _Skeleton(
                    height: 17,
                    color: colors.background.dynamic,
                  ),
                ),
                const SizedBox(width: 48),
                _Skeleton(
                  width: 48,
                  height: 17,
                  color: colors.background.dynamic,
                ),
              ],
            ),
            const SizedBox(height: 7),
            _Skeleton(height: 6, color: colors.background.dynamic),
          ],
          const SizedBox(height: 24),
          _Skeleton(height: 100, color: colors.background.dynamic),
          const SizedBox(height: 24),
          _Skeleton(width: 90, height: 10, color: colors.background.dynamic),
          const SizedBox(height: 18),
          Row(
            children: [
              for (var i = 0; i < 7; i++) ...[
                if (i > 0) const SizedBox(width: 7),
                Expanded(
                  child: _Skeleton(
                    height: 84,
                    color: colors.background.dynamic,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class MasteryEmptyView extends StatelessWidget {
  const MasteryEmptyView({super.key});

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
                        Icons.bar_chart,
                        size: 30,
                        color: colors.text.primary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      context.t.mastery.empty_title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.unbounded(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: colors.text.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      context.t.mastery.empty_message,
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

class MasteryErrorView extends StatelessWidget {
  const MasteryErrorView({
    super.key,
    required this.onRetry,
  });

  final VoidCallback onRetry;

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
                      Icons.query_stats,
                      size: 30,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    context.t.mastery.error_title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.unbounded(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.t.mastery.error_message,
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
            label: context.t.mastery.retry.toUpperCase(),
            onTap: (_) => onRetry(),
          ),
        ],
      ),
    );
  }
}

class _Skeleton extends StatelessWidget {
  const _Skeleton({this.width, required this.height, required this.color});

  final double? width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        color: color,
      );
}
