import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/core/widgets/app_notification_banner.dart';

void main() {
  tearDown(AppNotificationBanner.dismiss);

  testWidgets('shows at the top and runs the action when tapped',
      (tester) async {
    var opened = false;
    await tester.pumpWidget(_testApp(
      onShow: (overlay) => AppNotificationBanner.show(
        overlay,
        title: 'Новое достижение',
        message: 'Открыто достижение «Первый шаг»',
        onTap: () => opened = true,
      ),
    ));

    await tester.tap(find.text('Показать'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    final banner = find.byKey(AppNotificationBanner.bannerKey);
    expect(banner, findsOneWidget);
    expect(tester.getTopLeft(banner).dy, lessThan(80));

    await tester.tap(banner);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(opened, isTrue);
    expect(banner, findsNothing);
  });

  testWidgets('dismisses itself automatically', (tester) async {
    await tester.pumpWidget(_testApp(
      onShow: (overlay) => AppNotificationBanner.show(
        overlay,
        title: 'Уведомление',
        message: 'Новый выпуск уже доступен',
      ),
    ));

    await tester.tap(find.text('Показать'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.byKey(AppNotificationBanner.bannerKey), findsOneWidget);

    await tester.pump(const Duration(seconds: 6));
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.byKey(AppNotificationBanner.bannerKey), findsNothing);
  });
}

Widget _testApp({required void Function(OverlayState overlay) onShow}) =>
    MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(
        body: Builder(
          builder: (context) => Center(
            child: FilledButton(
              onPressed: () => onShow(Overlay.of(context)),
              child: const Text('Показать'),
            ),
          ),
        ),
      ),
    );
