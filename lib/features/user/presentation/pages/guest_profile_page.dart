import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/features/user/presentation/widgets/profile_header.dart';
import 'package:quiz/gen/strings.g.dart';

class GuestProfilePage extends StatelessWidget {
  const GuestProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.profile.guest;

    return Scaffold(
      backgroundColor: colors.background.static,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileHeader(
              trailing: Row(
                children: [
                  if (kDebugMode) ...[
                    ProfileHeaderButton(
                      icon: Icons.add_moderator_outlined,
                      onTap: () => context.goNamed('debug'),
                    ),
                    const SizedBox(width: 8),
                  ],
                  ProfileHeaderButton(
                    icon: Icons.settings_outlined,
                    onTap: () => context.push('/profile/settings'),
                  ),
                ],
              ),
            ),
            const AppDivider(indent: 22, endIndent: 22),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(22, 30, 22, 24),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 54,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Spacer(),
                          Align(
                            child: Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: colors.text.primary,
                                  width: 1.5,
                                ),
                                color: colors.bottomSheet.headerBackground,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        colors.shadow.withValues(alpha: 0.24),
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.person_outline,
                                size: 34,
                                color: colors.background.static,
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Text(
                            t.title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.unbounded(
                              fontSize: 25,
                              height: 1.08,
                              fontWeight: FontWeight.w700,
                              color: colors.text.primary,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            t.body,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spectral(
                              fontSize: 17,
                              height: 1.4,
                              color: colors.text.secondary,
                            ),
                          ),
                          const SizedBox(height: 28),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: colors.text.primary,
                                  width: 1.5,
                                ),
                                bottom: BorderSide(
                                  color: colors.text.primary,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                _GuestBenefit(label: t.progress),
                                const AppDividerLight(),
                                _GuestBenefit(label: t.rating),
                                const AppDividerLight(),
                                _GuestBenefit(label: t.achievements),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const SizedBox(height: 36),
                          AppButtonV2(
                            label: t.sign_in,
                            onTap: (complete) {
                              complete();
                              context.pushNamed('login');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GuestBenefit extends StatelessWidget {
  const _GuestBenefit({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(Icons.add, size: 17, color: colors.text.accent),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.1,
                color: colors.text.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
