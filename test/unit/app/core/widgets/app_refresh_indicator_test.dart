import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/core/widgets/app_refresh_indicator.dart';

void main() {
  testWidgets('refreshes even when the content is shorter than the viewport',
      (tester) async {
    var refreshCount = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: AppRefreshIndicator(
            onRefresh: () async => refreshCount++,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [SizedBox(height: 100)],
            ),
          ),
        ),
      ),
    );

    await tester.drag(find.byType(ListView), const Offset(0, 400));
    await tester.pumpAndSettle();

    expect(refreshCount, 1);
  });
}
