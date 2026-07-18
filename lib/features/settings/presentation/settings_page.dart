import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/dialog/app_confirm_dialog.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/settings/presentation/widgets/settings_rows.dart';
import 'package:quiz/features/settings/presentation/widgets/theme_mode_switcher.dart';
import 'package:quiz/features/user/presentation/provider/quiz_plus_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.t.profile.settings;
    final isAuthenticated = ref.watch(authenticationProvider).isAuthenticated;
    final hasQuizPlus = ref.watch(quizPlusProvider);

    return AppScaffold(
      title: t.title,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isAuthenticated) ...[
              SettingsSectionLabel(label: t.account_section),
              const SizedBox(height: 10),
              SettingsRowGroup(
                children: [
                  SettingsLinkRow(
                    label: t.edit_profile,
                    onTap: () => context.push('/profile/settings/edit'),
                  ),
                  SettingsLinkRow(
                    label: t.notifications,
                    onTap: () => context.push('/profile/settings/notifications'),
                  ),
                  if (hasQuizPlus)
                    SettingsLinkRow(
                      label: t.subscription,
                      onTap: () => context.push('/profile/settings/subscription'),
                    ),
                ],
              ),
              const SizedBox(height: 26),
            ],
            SettingsSectionLabel(label: t.app_section),
            const SizedBox(height: 10),
            SettingsRowGroup(
              children: [
                SettingsLinkRow(
                  label: t.language,
                  value: context.t.languages[LocaleSettings.instance.currentLocale.languageCode],
                  onTap: () => context.push('/profile/settings/language'),
                ),
                const _ThemeRow(),
                SettingsLinkRow(
                  label: t.about,
                  onTap: () => context.push('/profile/settings/about'),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Center(
              child: isAuthenticated ? const _SignOutButton() : const _SignInButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeRow extends StatelessWidget {
  const _ThemeRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.profile.settings.theme.toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
              color: context.palette.text.primary,
            ),
          ),
          const SizedBox(height: 12),
          const ThemeModeSwitcher(),
        ],
      ),
    );
  }
}

class _SignOutButton extends ConsumerWidget {
  const _SignOutButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.t.profile.settings;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        final confirmed = await showAppConfirmDialog(
          context,
          title: t.sign_out_dialog.title,
          message: t.sign_out_dialog.message,
          confirmLabel: t.sign_out_dialog.confirm,
          cancelLabel: t.sign_out_dialog.cancel,
        );

        if (confirmed) {
          ref.read(authenticationProvider.notifier).logout();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          t.sign_out.toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
            color: context.palette.text.danger,
          ),
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.push('/login'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          context.t.profile.settings.sign_in.toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
            color: context.palette.text.accent,
          ),
        ),
      ),
    );
  }
}
