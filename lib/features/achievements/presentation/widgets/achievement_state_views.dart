import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/gen/strings.g.dart';

class AchievementsLoadingView extends StatelessWidget {
  const AchievementsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return AppShimmer(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 32),
        itemCount: 2,
        itemBuilder: (context, section) => Padding(
          padding: EdgeInsets.only(top: section == 0 ? 0 : 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 90,
                height: 10,
                color: colors.background.dynamic,
              ),
              const SizedBox(height: 10),
              for (var i = 0; i < 3; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        color: colors.background.dynamic,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 16,
                              color: colors.background.dynamic,
                            ),
                            const SizedBox(height: 6),
                            FractionallySizedBox(
                              widthFactor: 0.65,
                              child: Container(
                                height: 9,
                                color: colors.background.dynamic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 14),
                      Container(
                        width: 38,
                        height: 11,
                        color: colors.background.dynamic,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AchievementsErrorView extends StatelessWidget {
  const AchievementsErrorView({
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
                      Icons.emoji_events_outlined,
                      size: 30,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    context.t.achievements.error_title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.unbounded(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.t.achievements.error_message,
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
            label: context.t.achievements.retry.toUpperCase(),
            onTap: (_) => onRetry(),
          ),
        ],
      ),
    );
  }
}

class PublicAchievementsEmptyView extends StatelessWidget {
  const PublicAchievementsEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Center(
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
                Icons.emoji_events_outlined,
                size: 30,
                color: colors.text.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              context.t.achievements.public_empty_title,
              textAlign: TextAlign.center,
              style: GoogleFonts.unbounded(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: colors.text.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              context.t.achievements.public_empty_message,
              textAlign: TextAlign.center,
              style: GoogleFonts.spectral(
                fontSize: 18,
                color: colors.text.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
