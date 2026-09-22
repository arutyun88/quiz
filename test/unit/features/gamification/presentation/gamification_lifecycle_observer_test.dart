import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/gamification/presentation/gamification_lifecycle_observer.dart';

void main() {
  test('ignores the initial resumed event', () {
    var refreshCount = 0;
    final observer = GamificationLifecycleObserver(
      onResume: () => refreshCount++,
    );

    observer.didChangeAppLifecycleState(AppLifecycleState.resumed);

    expect(refreshCount, 0);
  });

  test('refreshes once after returning from the background', () {
    var refreshCount = 0;
    final observer = GamificationLifecycleObserver(
      onResume: () => refreshCount++,
    );

    observer.didChangeAppLifecycleState(AppLifecycleState.inactive);
    observer.didChangeAppLifecycleState(AppLifecycleState.hidden);
    observer.didChangeAppLifecycleState(AppLifecycleState.paused);
    observer.didChangeAppLifecycleState(AppLifecycleState.resumed);
    observer.didChangeAppLifecycleState(AppLifecycleState.resumed);

    expect(refreshCount, 1);
  });
}
