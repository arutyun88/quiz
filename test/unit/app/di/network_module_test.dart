import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/di/network_module.dart';

void main() {
  test('release builds use the public production API by default', () {
    expect(
      resolveApiBaseUrl(
        configuredBaseUrl: '',
        debug: false,
        platform: TargetPlatform.android,
      ),
      productionApiBaseUrl,
    );
  });

  test('explicit API base URL overrides build defaults', () {
    expect(
      resolveApiBaseUrl(
        configuredBaseUrl: 'https://staging.example.test/api',
        debug: false,
        platform: TargetPlatform.iOS,
      ),
      'https://staging.example.test/api',
    );
  });

  test('debug builds keep emulator-friendly local endpoints', () {
    expect(
      resolveApiBaseUrl(
        configuredBaseUrl: '',
        debug: true,
        platform: TargetPlatform.android,
      ),
      'http://10.0.2.2:8081/api',
    );
    expect(
      resolveApiBaseUrl(
        configuredBaseUrl: '',
        debug: true,
        platform: TargetPlatform.iOS,
      ),
      'http://localhost:8081/api',
    );
  });
}
