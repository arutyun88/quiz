import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/localization/gateway/change_locale_gateway.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/settings/presentation/widgets/locale_question_sync_page.dart';
import 'package:quiz/gen/strings.g.dart';

class ProfileLocaleChangeWidget extends StatelessWidget {
  const ProfileLocaleChangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _languageSheet(context),
      child: Row(
        children: [
          Text(
            context.t.profile.settings.application.language.change,
            style: context.textStyle.body14Regular,
          ),
          const Spacer(),
          Text(
            context.t.languages[LocaleSettings.instance.currentLocale.languageCode] ?? '',
            style: context.textStyle.body12Regular.copyWith(
              color: context.palette.text.secondary,
            ),
          ),
        ],
      ),
    );
  }

  void _languageSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      useRootNavigator: true,
      context: context,
      builder: (context) => SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24.0),
              ...LocaleSettings.instance.supportedLocales
                  .map(
                    (l) => AppLocale.values.firstWhere((al) => al.languageCode == l.languageCode),
                  )
                  .map((locale) => _LanguageWidget(locale: locale)),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageWidget extends StatelessWidget {
  const _LanguageWidget({
    required this.locale,
  });

  final AppLocale locale;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            final navigator = Navigator.of(context, rootNavigator: true);
            final container = ProviderScope.containerOf(context, listen: false);
            Navigator.pop(context);
            if (locale == LocaleSettings.currentLocale) {
              return;
            }

            await getIt<ChangeLocaleGateway>().change(locale);
            await navigator.push(
              MaterialPageRoute<void>(
                fullscreenDialog: true,
                builder: (_) => UncontrolledProviderScope(
                  container: container,
                  child: const LocaleQuestionSyncPage(),
                ),
              ),
            );
          },
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  t.languages[locale.languageCode] ?? '',
                  style: context.textStyle.body14Semibold.copyWith(
                    color: locale.languageCode == LocaleSettings.instance.currentLocale.languageCode
                        ? context.palette.text.primary
                        : context.palette.text.secondary,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
