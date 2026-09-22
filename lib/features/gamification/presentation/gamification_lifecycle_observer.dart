import 'package:flutter/widgets.dart';

final class GamificationLifecycleObserver with WidgetsBindingObserver {
  GamificationLifecycleObserver({required this.onResume});

  final VoidCallback onResume;
  bool _wasBackgrounded = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.hidden || AppLifecycleState.paused:
        _wasBackgrounded = true;
      case AppLifecycleState.resumed when _wasBackgrounded:
        _wasBackgrounded = false;
        onResume();
      case AppLifecycleState.detached ||
            AppLifecycleState.inactive ||
            AppLifecycleState.resumed:
        break;
    }
  }
}
