import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/features/settings/presentation/subscription_page.dart';
import 'package:quiz/features/user/domain/entity/subscription_entity.dart';
import 'package:quiz/gen/strings.g.dart';

void main() {
  setUpAll(() async {
    await LocaleSettings.setLocale(AppLocale.ru);
    await initializeDateFormatting('ru');
  });

  testWidgets('active renewing shows next billing date', (tester) async {
    await tester.pumpWidget(
      _app(
        SubscriptionEntity(
          status: SubscriptionStatus.activeRenewing,
          entitlementActive: true,
          willRenew: true,
          currentPeriodEndsAt: DateTime(2026, 10, 12),
          provider: 'APP_STORE',
          managementUrl: 'https://apps.apple.com/account/subscriptions',
          purchaseAvailability: PurchaseAvailability.available,
          accessReason: SubscriptionAccessReason.subscription,
        ),
      ),
    );

    expect(find.textContaining('12.10.2026'), findsOneWidget);
    expect(find.textContaining('СЛЕДУЮЩЕЕ СПИСАНИЕ'), findsOneWidget);
  });

  testWidgets('canceled active shows access end and never next billing',
      (tester) async {
    await tester.pumpWidget(
      _app(
        SubscriptionEntity(
          status: SubscriptionStatus.canceledActive,
          entitlementActive: true,
          willRenew: false,
          currentPeriodEndsAt: DateTime(2026, 10, 12),
          provider: 'GOOGLE_PLAY',
          managementUrl: 'https://play.google.com/store/account/subscriptions',
          purchaseAvailability: PurchaseAvailability.available,
          accessReason: SubscriptionAccessReason.subscription,
        ),
      ),
    );

    expect(find.textContaining('ДОСТУП ДО'), findsOneWidget);
    expect(find.textContaining('СЛЕДУЮЩЕЕ СПИСАНИЕ'), findsNothing);
  });

  testWidgets('market preview is presented separately from a paid subscription',
      (tester) async {
    await tester.pumpWidget(
      _app(
        const SubscriptionEntity(
          status: SubscriptionStatus.activeRenewing,
          entitlementActive: true,
          willRenew: false,
          purchaseAvailability: PurchaseAvailability.comingSoon,
          accessReason: SubscriptionAccessReason.marketPreview,
        ),
      ),
    );

    expect(find.text('РЕГИОНАЛЬНЫЙ PREVIEW-ДОСТУП'), findsOneWidget);
    expect(find.textContaining('СПИСАНИЕ'), findsNothing);
  });

  testWidgets('regional availability explains coming soon without a store CTA',
      (tester) async {
    await tester.pumpWidget(
      TranslationProvider(
        child: MaterialApp(
          theme: AppTheme.light,
          home: const Scaffold(
            body: PurchaseAvailabilityInfo(
              availability: PurchaseAvailability.comingSoon,
            ),
          ),
        ),
      ),
    );

    expect(find.textContaining('скоро станет доступна'), findsOneWidget);
    expect(find.byType(FilledButton), findsNothing);
  });

  testWidgets('management button opens the exact server URL for its provider',
      (tester) async {
    final launcher = _FakeManagementLauncher();
    const url = 'https://play.google.com/store/account/subscriptions';
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          subscriptionManagementLauncherProvider.overrideWithValue(launcher),
        ],
        child: TranslationProvider(
          child: MaterialApp(
            theme: AppTheme.light,
            home: const Scaffold(
              body: SubscriptionManagementButton(
                subscription: SubscriptionEntity(
                  status: SubscriptionStatus.activeRenewing,
                  entitlementActive: true,
                  willRenew: true,
                  provider: 'GOOGLE_PLAY',
                  managementUrl: url,
                  purchaseAvailability: PurchaseAvailability.available,
                  accessReason: SubscriptionAccessReason.subscription,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(TextButton));
    expect(launcher.launchedUrl, url);
  });
}

Widget _app(SubscriptionEntity subscription) => TranslationProvider(
      child: MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: SubscriptionSummaryCard(subscription: subscription),
        ),
      ),
    );

class _FakeManagementLauncher implements SubscriptionManagementLauncher {
  String? launchedUrl;

  @override
  Future<bool> launch(String url) async {
    launchedUrl = url;
    return true;
  }
}
