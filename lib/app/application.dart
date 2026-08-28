import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/navigation/router.dart';
import 'package:quiz/app/core/theme/provider/theme_provider.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/ads/domain/rewarded_ads_gateway.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/observability/domain/app_error_reporter.dart';
import 'package:quiz/features/push/domain/push_notifications_gateway.dart';
import 'package:quiz/gen/strings.g.dart';

class Application extends ConsumerStatefulWidget {
  const Application({super.key});

  @override
  ConsumerState<Application> createState() => _ApplicationState();
}

class _ApplicationState extends ConsumerState<Application> {
  StreamSubscription<PushDestination>? _pushDestinationSubscription;

  @override
  void initState() {
    super.initState();
    final pushGateway = getIt<PushNotificationsGateway>();
    _pushDestinationSubscription = pushGateway.openedDestinations.listen(
      _openPushDestination,
    );
    ref.listenManual(
      authenticationProvider,
      (previous, next) {
        final analytics = getIt<ProductAnalytics>();
        final errorReporter = getIt<AppErrorReporter>();
        final nextUserId = next.mapOrNull(
          authenticated: (state) => state.user?.id,
        );
        if (nextUserId != null) {
          unawaited(analytics.identify(nextUserId));
          unawaited(errorReporter.setUser(nextUserId));
          unawaited(pushGateway.activate());
        } else {
          unawaited(analytics.resetIdentity());
          unawaited(errorReporter.clearUser());
          unawaited(pushGateway.deactivate());
        }
      },
      fireImmediately: true,
    );
    if (getIt.isRegistered<RewardedAdsGateway>()) {
      unawaited(getIt<RewardedAdsGateway>().initializeConsent());
    }
  }

  @override
  void dispose() {
    _pushDestinationSubscription?.cancel();
    super.dispose();
  }

  void _openPushDestination(PushDestination destination) {
    if (!mounted) return;
    context.go(switch (destination) {
      PushDestination.home || PushDestination.dailyEdition => '/',
      PushDestination.rating => '/rating',
      PushDestination.review => '/profile/review',
    });
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
