import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/gen/strings.g.dart';

class ReviewLoadingView extends StatelessWidget {
  const ReviewLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return AppShimmer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 32),
        children: [
          Container(height: 58, color: colors.background.dynamic),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                width: 56,
                height: 9,
                color: colors.background.dynamic,
              ),
              const SizedBox(width: 8),
              Container(
                width: 28,
                height: 9,
                color: colors.background.dynamic,
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (var i = 0; i < 4; i++) ...[
            Container(
              height: 82,
              decoration: BoxDecoration(
                border: Border.all(color: colors.card.border),
              ),
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.72,
                    child: Container(
                      height: 16,
                      color: colors.background.dynamic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FractionallySizedBox(
                    widthFactor: 0.45,
                    child: Container(
                      height: 9,
                      color: colors.background.dynamic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class ReviewErrorView extends StatelessWidget {
  const ReviewErrorView({
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
                      Icons.history_toggle_off,
                      size: 30,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    context.t.review.error_title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.unbounded(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.t.review.error_message,
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
            label: context.t.review.retry.toUpperCase(),
            onTap: (_) => onRetry(),
          ),
        ],
      ),
    );
  }
}
