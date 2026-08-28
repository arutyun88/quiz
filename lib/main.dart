import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/application.dart';
import 'package:quiz/app/core/localization/gateway/change_locale_gateway.dart';
import 'package:quiz/app/core/theme/provider/theme_provider.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:quiz/features/observability/data/sentry_bootstrap.dart';
import 'package:quiz/gen/strings.g.dart';

Future<void> main() => SentryBootstrap.run(_runApplication);

Future<void> _runApplication() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await configureDependencies();

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
