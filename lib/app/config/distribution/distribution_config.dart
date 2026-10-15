import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum AppDistribution { global, china }

abstract final class DistributionConfig {
  static const _channel = MethodChannel('com.quiz.quiz/distribution');

  static AppDistribution? _distribution;

  static AppDistribution get current => _distribution ?? AppDistribution.global;

  static bool get isChina => current == AppDistribution.china;

  static Future<AppDistribution> initialize() async {
    final initialized = _distribution;
    if (initialized != null) return initialized;

    try {
      final value = await _channel.invokeMethod<String>('getDistribution');
      _distribution =
          value == 'china' ? AppDistribution.china : AppDistribution.global;
    } on MissingPluginException {
      _distribution = AppDistribution.global;
    } on PlatformException {
      _distribution = AppDistribution.global;
    }
    return current;
  }

  @visibleForTesting
  static void setForTesting(AppDistribution? distribution) {
    _distribution = distribution;
  }
}
