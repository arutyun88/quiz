import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/provider/issue_number_provider.dart';
import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/gen/strings.g.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.palette;
    final t = context.t.onboarding;
    final issueNumber = ref.watch(issueNumberProvider);

    return Scaffold(
      backgroundColor: colors.background.static,
      body: SafeArea(
        child: Column(
          children: [
            // header
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 16, 22, 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _closeOnboarding(context),
                    child: Icon(Icons.arrow_back, size: 22, color: colors.text.primary),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'QUIZ.',
                    style: GoogleFonts.unbounded(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: colors.text.primary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    t.daily_issue,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
                      letterSpacing: 1.5,
                      color: colors.text.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const AppDivider(indent: 22, endIndent: 22),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: Stack(
                        children: [
                          // watermark
                          Positioned(
                            right: -26,
                            bottom: 60,
                            child: IgnorePointer(
                              child: Text(
                                '?',
                                style: GoogleFonts.unbounded(
                                  fontSize: 260,
                                  fontWeight: FontWeight.w800,
                                  color: colors.text.primary.withValues(alpha: 0.035),
                                  height: 0.8,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 34, 22, 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  t.issue_number(n: issueNumber),
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 11,
                                    letterSpacing: 2,
                                    color: colors.text.accent,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                Text(
                                  t.headline,
                                  style: GoogleFonts.unbounded(
                                    fontSize: 46,
                                    fontWeight: FontWeight.w800,
                                    color: colors.text.primary,
                                    height: 0.98,
                                    letterSpacing: -1,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                Text(
                                  t.subtitle,
                                  style: GoogleFonts.spectral(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 19,
                                    color: colors.text.primary.withValues(alpha: 0.75),
                                    height: 1.45,
                                  ),
                                ),
                                const SizedBox(height: 26),
                                _FeatureList(
                                  features: [t.features.f1, t.features.f2, t.features.f3],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
              child: AppButtonV2(
                label: t.start_free,
                onTap: (complete) {
                  complete();
                  context.pushNamed('registration');
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () => context.pushNamed('login'),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${t.already_played} ',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 10,
                          letterSpacing: 0.5,
                          color: colors.text.secondary,
                        ),
                      ),
                      TextSpan(
                        text: t.sign_in_link,
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 10,
                          letterSpacing: 0.5,
                          color: colors.text.accent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _closeOnboarding(BuildContext context) async {
    await getIt<SettingsLocalStorageService>().markOnboardingSeen();
    if (!context.mounted) return;

    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/');
    }
  }
}

class _FeatureList extends StatelessWidget {
  const _FeatureList({required this.features});

  final List<String> features;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Column(
      children: List.generate(features.length, (i) {
        final isFirst = i == 0;
        final isLast = i == features.length - 1;
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: isFirst ? colors.text.primary : colors.divider,
                width: isFirst ? 1.5 : 1,
              ),
              bottom: isLast ? BorderSide(color: colors.text.primary, width: 1.5) : BorderSide.none,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '0${i + 1}',
                style: GoogleFonts.unbounded(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: colors.text.accent,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  features[i],
                  style: GoogleFonts.spectral(
                    fontSize: 16,
                    color: colors.text.primary,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
