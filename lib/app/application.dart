import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/navigation/router.dart';
import 'package:quiz/app/core/theme/provider/theme_provider.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/ads/domain/rewarded_ads_gateway.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class Application extends ConsumerStatefulWidget {
  const Application({super.key});

  @override
  ConsumerState<Application> createState() => _ApplicationState();
}

class _ApplicationState extends ConsumerState<Application> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(
      authenticationProvider,
      (previous, next) {
        final analytics = getIt<ProductAnalytics>();
        final nextUserId = next.mapOrNull(
          authenticated: (state) => state.user?.id,
        );
        if (nextUserId != null) {
          unawaited(analytics.identify(nextUserId));
        } else {
          unawaited(analytics.resetIdentity());
        }
      },
      fireImmediately: true,
    );
    if (getIt.isRegistered<RewardedAdsGateway>()) {
      unawaited(getIt<RewardedAdsGateway>().initializeConsent());
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final theme = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.value,
      theme: theme.data,
      // The editorial palette is a full inversion (cream ↔ ink): the default
      // 200ms theme crossfade drags every color through low-contrast gray.
      themeAnimationDuration: Duration.zero,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
