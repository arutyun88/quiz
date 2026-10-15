import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:quiz/app/config/distribution/distribution_config.dart';
import 'package:quiz/app/config/firebase/firebase_options.dart';

final class FirebaseBootstrap {
  FirebaseBootstrap._();

  static Future<bool>? _initialization;
  static bool _available = false;

  static bool get available => _available;

  static Future<bool> initialize() => _initialization ??= _initialize();

  static Future<bool> _initialize() async {
    if (DistributionConfig.isChina) {
      _available = false;
      return false;
    }
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _available = true;
    } on Object {
      _available = false;
    }
    return _available;
  }

  @visibleForTesting
  static void setAvailabilityForTesting(bool available) {
    _available = available;
    _initialization = Future.value(available);
  }
}
