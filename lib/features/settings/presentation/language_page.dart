import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/localization/gateway/change_locale_gateway.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/settings/presentation/widgets/settings_rows.dart';
import 'package:quiz/gen/strings.g.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locales = LocaleSettings.instance.supportedLocales
        .map((l) => AppLocale.values
            .firstWhere((al) => al.languageCode == l.languageCode))
        .toList();

    return AppScaffold(
      title: context.t.profile.settings.language,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 32),
        child: SettingsRowGroup(
          children: [
            for (final locale in locales) _LanguageRow(locale: locale),
          ],
        ),
      ),
    );
  }
}

class _LanguageRow extends ConsumerWidget {
  const _LanguageRow({required this.locale});

  final AppLocale locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.palette;
    final isCurrent = locale.languageCode ==
        LocaleSettings.instance.currentLocale.languageCode;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (isCurrent) return;

        await getIt<ChangeLocaleGateway>().change(locale);
        final timezoneId = ref.read(authenticationProvider).mapOrNull(
              authenticated: (state) => state.user?.timezoneId,
            );
        await ref
            .read(dailyEditionProvider.notifier)
            .synchronizeActiveRun(timezoneId: timezoneId);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
        child: Row(
          children: [
            Expanded(
              child: Text(
                context.t.languages[locale.languageCode] ?? locale.languageCode,
                style: GoogleFonts.spectral(
                  fontSize: 18,
                  color: colors.text.primary,
                ),
              ),
            ),
            if (isCurrent)
              Icon(Icons.check, size: 20, color: colors.text.accent),
          ],
        ),
      ),
    );
  }
}
