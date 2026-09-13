import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/client/api_client_config.dart';
import 'package:quiz/app/core/client/dio_api_client.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:quiz/app/core/services/unauthorized_event_service.dart';
import 'package:quiz/features/daily_edition/data/repository/remote_daily_edition_repository.dart';

class _Tokens extends Mock implements AuthTokenService {}

class _Settings extends Mock implements SettingsLocalStorageService {}

class _Unauthorized extends Mock implements UnauthorizedEventService {}

void main() {
  test(
      'real HTTP 409 preserves review allowance error through Dio and repository',
      () async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    addTearDown(() => server.close(force: true));
    server.listen((request) async {
      await request.drain<void>();
      request.response
        ..statusCode = 409
        ..headers.contentType = ContentType.json
        ..write('{"code":409,"error":"DAILY_RUN_COMPLETE",'
            '"message":"A continuation allowance is required"}');
      await request.response.close();
    });
    final repository = RemoteDailyEditionRepository(
      client: DioApiClient(
        config: ApiClientConfig(
          baseUrl: 'http://127.0.0.1:${server.port}',
          enableLogging: false,
        ),
        deviceId: 'test-device',
        tokenService: _Tokens(),
        unauthorizedEventService: _Unauthorized(),
        settingsStorage: _Settings(),
      ),
    );

    final result = await repository.reserveReviewReplacement(
      runId: 'run-1',
      clientEventId: 'event-1',
      sourceAttemptId: 'source-1',
    );
    expect(result, isA<ResultFailed>());
    expect(
        (result as ResultFailed).error,
        const Failure.network(
          NetworkFailureReason.badResponse(
              'A continuation allowance is required',
              statusCode: 409,
              errorCode: 'DAILY_RUN_COMPLETE'),
        ));
  });
}
