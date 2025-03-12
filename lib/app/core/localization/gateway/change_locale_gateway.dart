import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:quiz/gen/strings.g.dart';

class ChangeLocaleGateway {
  final SettingsLocalStorageService _storageService;

  ChangeLocaleGateway({
    required SettingsLocalStorageService storageService,
  }) : _storageService = storageService;

  Future<void> reload() async {
    final sLocale = _storageService.fetchLocale();

    if (sLocale == null) {
      LocaleSettings.useDeviceLocale();
    }

    final locale = AppLocale.values.firstWhere(
      (locale) => locale.languageCode == sLocale,
      orElse: () => LocaleSettings.currentLocale,
    );

    await LocaleSettings.setLocale(locale);
  }

  void change(AppLocale locale) async {
    await LocaleSettings.setLocale(locale);
    _storageService.saveLocale(locale.languageCode);
  }
}
