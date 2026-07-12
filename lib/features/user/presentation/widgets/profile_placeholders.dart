import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/gen/strings.g.dart';

class ProfileLoading extends StatelessWidget {
  const ProfileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 24),
        children: [
          Row(
            children: const [
              _SkeletonBox(width: 54, height: 54),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SkeletonBox(height: 21),
                    SizedBox(height: 8),
                    _SkeletonBox(width: 160, height: 10),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          const _SkeletonBox(width: 120, height: 66),
          const SizedBox(height: 14),
          const _SkeletonBox(height: 6),
          const SizedBox(height: 24),
          const _SkeletonBox(width: 110, height: 10),
          const SizedBox(height: 10),
          for (var i = 0; i < 2; i++) ...[
            const SizedBox(height: 10),
            Row(
              children: const [
                Expanded(child: _SkeletonBox(height: 40)),
                SizedBox(width: 16),
                Expanded(child: _SkeletonBox(height: 40)),
                SizedBox(width: 16),
                Expanded(child: _SkeletonBox(height: 40)),
              ],
            ),
          ],
          const SizedBox(height: 24),
          const _SkeletonBox(height: 48),
        ],
      ),
    );
  }
}

class ProfileError extends StatelessWidget {
  const ProfileError({super.key, required this.onRetry});

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
                context.t.profile.view.load_failed,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.refresh, size: 18, color: colors.text.primary),
                      const SizedBox(width: 8),
                      Text(
                        context.t.profile.view.retry,
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
