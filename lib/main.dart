import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:quiz/app/application.dart';
import 'package:quiz/app/config/firebase/firebase_options.dart';
import 'package:quiz/app/core/localization/gateway/change_locale_gateway.dart';
import 'package:quiz/app/core/services/firebase_remote_config_service.dart';
import 'package:quiz/app/core/theme/provider/theme_provider.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:quiz/features/observability/data/logging_setup.dart';
import 'package:quiz/features/observability/data/sentry_bootstrap.dart';
import 'package:quiz/features/observability/domain/logger.dart';
import 'package:quiz/gen/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() => SentryBootstrap.run(_runApplication);

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Data is handled by the server-owned flow after the user opens the app.
}

Future<void> _runApplication() async {
  WidgetsFlutterBinding.ensureInitialized();
  LoggingSetup.setup();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await configureDependencies();
  LoggingSetup.setup(
    preferences: getIt<SharedPreferences>(),
    readConsoleMinimumLevel: () =>
        Level('_DEBUG', getIt<FirebaseRemoteConfigService>().debugLoggingLevel),
    readBreadcrumbMinimumLevel: () => Level(
      '_PRODUCTION',
      getIt<FirebaseRemoteConfigService>().productionLoggingLevel,
    ),
  );

  await getIt<ProductAnalytics>().initialize();
  await getIt<ChangeLocaleGateway>().reload();

  final container = ProviderContainer();
  container.read(themeProvider.notifier).checkCurrentTheme();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: TranslationProvider(
        child: const Application(),
      ),
    ),
  );
}
