import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/navigation/router.dart';
import 'package:quiz/app/core/theme/provider/theme_provider.dart';
import 'package:quiz/app/core/widgets/app_notification_banner.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/ads/domain/rewarded_ads_gateway.dart';
import 'package:quiz/features/analytics/domain/product_analytics.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/gamification/presentation/gamification_lifecycle_observer.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';
import 'package:quiz/features/observability/data/sentry_user_context.dart';
import 'package:quiz/features/notifications/presentation/provider/notification_inbox_provider.dart';
import 'package:quiz/features/push/domain/push_notifications_gateway.dart';
import 'package:quiz/gen/strings.g.dart';

class Application extends ConsumerStatefulWidget {
  const Application({super.key});

  @override
  ConsumerState<Application> createState() => _ApplicationState();
}

class _ApplicationState extends ConsumerState<Application> {
  StreamSubscription<PushDestination>? _pushDestinationSubscription;
  StreamSubscription<PushMessage>? _pushMessageSubscription;
  PushDestination? _pendingPushDestination;
  late final GamificationLifecycleObserver _gamificationLifecycleObserver;

  @override
  void initState() {
    super.initState();
    final pushGateway = getIt<PushNotificationsGateway>();
    _gamificationLifecycleObserver = GamificationLifecycleObserver(
      onResume: () {
        unawaited(pushGateway.activate());
        unawaited(ref.read(gamificationProvider.notifier).fetch());
        unawaited(
          ref
              .read(notificationInboxProvider.notifier)
              .handleIncomingNotification(),
        );
      },
    );
    WidgetsBinding.instance.addObserver(_gamificationLifecycleObserver);
    _pushDestinationSubscription = pushGateway.openedDestinations.listen(
      _openPushDestination,
    );
    _pushMessageSubscription = pushGateway.receivedMessages.listen(
      _handlePushMessage,
    );
    ref.listenManual(routerProvider, (_, next) {
      if (next.value != null) _openPendingPushDestination();
    });
    ref.listenManual(
      authenticationProvider,
      (previous, next) {
        final analytics = getIt<ProductAnalytics>();
        final nextUserId = next.mapOrNull(
          authenticated: (state) => state.user?.id,
        );
        if (nextUserId != null) {
          unawaited(analytics.identify(nextUserId));
          unawaited(SentryUserContext.set(nextUserId));
          unawaited(pushGateway.activate());
        } else {
          unawaited(analytics.resetIdentity());
          unawaited(SentryUserContext.set(null));
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
    WidgetsBinding.instance.removeObserver(_gamificationLifecycleObserver);
    AppNotificationBanner.dismiss();
    _pushDestinationSubscription?.cancel();
    _pushMessageSubscription?.cancel();
    super.dispose();
  }

  void _openPushDestination(PushDestination destination) {
    if (!mounted) return;
    _pendingPushDestination = destination;
    _openPendingPushDestination();
  }

  void _openPendingPushDestination() {
    if (!mounted) return;
    final destination = _pendingPushDestination;
    final router = ref.read(routerProvider).value;
    if (destination == null || router == null) return;
    _pendingPushDestination = null;
    router.go(switch (destination) {
      PushDestination.home || PushDestination.dailyEdition => '/',
      PushDestination.rating => '/rating',
      PushDestination.review => '/profile/review',
      PushDestination.notifications => '/profile/notifications',
    });
  }

  void _handlePushMessage(PushMessage message) {
    if (!mounted) return;
    unawaited(
      ref.read(notificationInboxProvider.notifier).handleIncomingNotification(),
    );
    _showPushMessage(message);
  }

  void _showPushMessage(PushMessage message) {
    final router = ref.read(routerProvider).value;
    final overlay = router?.routerDelegate.navigatorKey.currentState?.overlay;
    if (overlay == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _showPushMessage(message);
      });
      return;
    }
    AppNotificationBanner.show(
      overlay,
      title: message.title,
      message: message.body,
      onTap: message.destination == null
          ? null
          : () => _openPushDestination(message.destination!),
    );
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
