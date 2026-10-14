import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_snack_bar.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/ads/domain/rewarded_ads_gateway.dart';
import 'package:quiz/features/legal/domain/legal_documents.dart';
import 'package:quiz/features/settings/presentation/widgets/settings_rows.dart';
import 'package:quiz/gen/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';

const _supportEmail = 'support@eruday.app';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late final RewardedAdsGateway _ads = getIt<RewardedAdsGateway>();
  late Future<bool> _privacyOptionsRequired;

  @override
  void initState() {
    super.initState();
    _privacyOptionsRequired = _ads.privacyOptionsRequired();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.profile.settings;

    return AppScaffold(
      title: t.about,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'QUIZ',
                    style: GoogleFonts.unbounded(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                      color: colors.text.primary,
                    ),
                  ),
                  TextSpan(
                    text: '.',
                    style: GoogleFonts.unbounded(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: colors.text.accent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            const _VersionLabel(),
            const SizedBox(height: 22),
            SettingsRowGroup(
              children: [
                SettingsLinkRow(
                  label: t.about_page.terms,
                  onTap: () => LegalDocuments.open(
                    LegalDocument.terms,
                    languageCode:
                        LocaleSettings.instance.currentLocale.languageCode,
                  ),
                ),
                SettingsLinkRow(
                  label: t.about_page.privacy,
                  onTap: () => LegalDocuments.open(
                    LegalDocument.privacy,
                    languageCode:
                        LocaleSettings.instance.currentLocale.languageCode,
                  ),
                ),
                FutureBuilder<bool>(
                  future: _privacyOptionsRequired,
                  builder: (context, snapshot) => snapshot.data == true
                      ? SettingsLinkRow(
                          label: t.about_page.privacy_choices,
                          onTap: _showPrivacyOptions,
                        )
                      : const SizedBox.shrink(),
                ),
                SettingsLinkRow(
                  label: t.about_page.support,
                  onTap: _showSupportDialog,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showPrivacyOptions() async {
    await _ads.showPrivacyOptions();
    if (!mounted) return;
    setState(() {
      _privacyOptionsRequired = _ads.privacyOptionsRequired();
    });
  }

  Future<void> _showSupportDialog() async {
    final strings = context.t.profile.settings.about_page;
    final action = await showDialog<_SupportAction>(
      context: context,
      barrierColor: const Color(0xFF18160F).withValues(alpha: 0.5),
      builder: (context) => _SupportDialog(strings: strings),
    );
    if (!mounted || action == null) return;

    switch (action) {
      case _SupportAction.email:
        final opened = await _launch(
          Uri(
            scheme: 'mailto',
            path: _supportEmail,
            queryParameters: {'subject': strings.support_email_subject},
          ),
        );
        if (!opened && mounted) await _copySupportEmail(strings);
      case _SupportAction.copy:
        await _copySupportEmail(strings);
      case _SupportAction.website:
        final language =
            LocaleSettings.instance.currentLocale.languageCode == 'ru'
                ? 'ru'
                : 'en';
        final opened = await _launch(
          Uri.https('eruday.app', '/$language/support/'),
        );
        if (!opened && mounted) {
          AppSnackBar.showError(
            context,
            title: strings.support_open_failed_title,
            message: strings.support_open_failed_message,
          );
        }
    }
  }

  Future<bool> _launch(Uri uri) async {
    try {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      return false;
    }
  }

  Future<void> _copySupportEmail(
    Translations$profile$settings$about_page$en strings,
  ) async {
    await Clipboard.setData(const ClipboardData(text: _supportEmail));
    if (!mounted) return;
    AppSnackBar.showNotice(
      context,
      title: strings.support_copied_title,
      message: strings.support_copied_message(email: _supportEmail),
    );
  }
}

enum _SupportAction { email, copy, website }

class _SupportDialog extends StatelessWidget {
  const _SupportDialog({required this.strings});

  final Translations$profile$settings$about_page$en strings;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 22),
      shape: const RoundedRectangleBorder(),
      backgroundColor: colors.background.static,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: colors.text.primary, width: 1.5),
        ),
        padding: const EdgeInsets.fromLTRB(22, 26, 22, 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings.support_dialog_title,
              style: GoogleFonts.unbounded(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.3,
                color: colors.text.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              strings.support_dialog_body(email: _supportEmail),
              style: GoogleFonts.spectral(
                fontSize: 15,
                height: 1.5,
                color: colors.text.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              strings.support_warning,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                height: 1.45,
                color: colors.text.danger,
              ),
            ),
            const SizedBox(height: 22),
            _SupportDialogButton(
              label: strings.support_email,
              filled: true,
              onTap: () => Navigator.of(context).pop(_SupportAction.email),
            ),
            const SizedBox(height: 10),
            _SupportDialogButton(
              label: strings.support_copy,
              onTap: () => Navigator.of(context).pop(_SupportAction.copy),
            ),
            const SizedBox(height: 10),
            _SupportDialogButton(
              label: strings.support_website,
              onTap: () => Navigator.of(context).pop(_SupportAction.website),
            ),
            const SizedBox(height: 14),
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  strings.support_close.toUpperCase(),
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    color: colors.text.secondary,
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

class _SupportDialogButton extends StatelessWidget {
  const _SupportDialogButton({
    required this.label,
    required this.onTap,
    this.filled = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final foreground = filled ? colors.background.static : colors.text.primary;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: filled
            ? BoxDecoration(color: colors.text.primary)
            : BoxDecoration(
                border: Border.all(color: colors.text.primary),
              ),
        alignment: Alignment.center,
        child: Text(
          label.toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
            color: foreground,
          ),
        ),
      ),
    );
  }
}

class _VersionLabel extends StatelessWidget {
  const _VersionLabel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        final info = snapshot.data;

        return Text(
          info == null
              ? ''
              : context.t.profile.settings.about_page
                  .version(version: info.version, build: info.buildNumber)
                  .toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: context.palette.text.secondary,
          ),
        );
      },
    );
  }
}
