import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/distribution/distribution_config.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('com.quiz.quiz/distribution');

  tearDown(() async {
    DistributionConfig.setForTesting(null);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('uses the China distribution reported by the Android flavor', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async => 'china');

    expect(
      await DistributionConfig.initialize(),
      AppDistribution.china,
    );
    expect(DistributionConfig.isChina, isTrue);
  });

  test('defaults to global when the platform has no distribution channel',
      () async {
    expect(
      await DistributionConfig.initialize(),
      AppDistribution.global,
    );
    expect(DistributionConfig.isChina, isFalse);
  });
}
