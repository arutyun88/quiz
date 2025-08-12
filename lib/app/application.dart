import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/navigation/router.dart';
import 'package:quiz/app/core/theme/provider/theme_provider.dart';
import 'package:quiz/features/snackbar/adapters/snackbar_adapter_sets.dart';
import 'package:quiz/features/snackbar/widgets/snackbar_overlay.dart';
import 'package:quiz/gen/strings.g.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final theme = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.value,
      theme: theme.data,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      builder: (context, child) => SnackbarOverlay(
        adapters: SnackbarAdapterSets.basic,
        child: child ?? SizedBox.shrink(),
      ),
    );
  }
}
