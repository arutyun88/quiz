import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/settings/presentation/widgets/settings_rows.dart';
import 'package:quiz/gen/strings.g.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
                SettingsLinkRow(label: t.about_page.terms),
                SettingsLinkRow(label: t.about_page.privacy),
                SettingsLinkRow(label: t.about_page.support),
              ],
            ),
          ],
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
