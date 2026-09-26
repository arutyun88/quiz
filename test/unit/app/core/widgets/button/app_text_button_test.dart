import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/theme/app_theme.dart';
import 'package:quiz/app/core/widgets/button/app_text_button.dart';

void main() {
  testWidgets('uses the design-system fade press effect without Material ink',
      (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: AppTextButton(
            label: 'SIGN IN',
            onTap: () => tapped = true,
          ),
        ),
      ),
    );

    expect(find.byType(TextButton), findsNothing);
    expect(find.byType(InkWell), findsNothing);

    final gesture = await tester.startGesture(
      tester.getCenter(find.byType(AppTextButton)),
    );
    await tester.pump();
    expect(
      tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity)).opacity,
      0.7,
    );

    await gesture.up();
    await tester.pump(const Duration(milliseconds: 120));
    expect(tapped, isTrue);
    expect(
      tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity)).opacity,
      1.0,
    );
  });
}
