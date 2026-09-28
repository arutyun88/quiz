import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/client/api_client_config.dart';
import 'package:quiz/app/core/client/dio_api_client.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:quiz/app/core/services/unauthorized_event_service.dart';
import 'package:quiz/features/observability/domain/logger.dart';

class _Tokens extends Mock implements AuthTokenService {}

class _Settings extends Mock implements SettingsLocalStorageService {}

class _Unauthorized extends Mock implements UnauthorizedEventService {}

void main() {
  late List<LogRecord> records;
  late StreamSubscription<LogRecord> subscription;

  setUp(() {
    hierarchicalLoggingEnabled = true;
    Logger.root.level = Level.ALL;
    records = [];
    subscription = Logger.root.onRecord.listen(records.add);
  });

  tearDown(() async {
    await subscription.cancel();
  });

  test('logs response mapping failures without response data or query values',
      () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));
    server.listen((request) async {
      await request.drain<void>();
      request.response
        ..headers.contentType = ContentType.json
        ..write('{"unexpected":"sensitive-response-value"}');
      await request.response.close();
    });
    final client = DioApiClient(
      config: ApiClientConfig(
        baseUrl: 'http://127.0.0.1:${server.port}',
        enableLogging: false,
      ),
      deviceId: 'test-device',
      tokenService: _Tokens(),
      unauthorizedEventService: _Unauthorized(),
      settingsStorage: _Settings(),
    );

    final future = client.get<void, Map<String, dynamic>>(
      '/api/users/123e4567-e89b-12d3-a456-426614174000?token=secret-query',
      mapper: (_) => throw const FormatException('missing field'),
      converter: (_) {},
    );

    await expectLater(future, throwsA(isA<FormatException>()));
    final record = records.singleWhere(
      (record) => record.loggerName == 'DioApiClient.Response',
    );
    expect(record.level, errorLogLevel);
    expect(record.message, 'API response mapping failed');
    expect(
      (record.object as StringRecord).toJson(),
      {
        'method': 'GET',
        'endpoint': '/api/users/{id}',
        'error_type': 'FormatException',
      },
    );
  });
}
