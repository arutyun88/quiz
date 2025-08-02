import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/navigation/router.dart';
import 'package:quiz/app/core/theme/provider/theme_provider.dart';
import 'package:quiz/features/sync/presentation/widgets/sync_snackbar_overlay.dart';
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
      builder: (context, child) => SyncSnackbarOverlay(
        child: child ?? SizedBox.shrink(),
      ),
    );
  }
}
