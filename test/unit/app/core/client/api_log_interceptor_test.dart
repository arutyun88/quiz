import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:quiz/app/core/client/api_log_interceptor.dart';
import 'package:quiz/features/observability/domain/logger.dart';

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

  test('logs a compact request and response with duration', () {
    final times = <DateTime>[
      DateTime(2026, 9, 20, 14, 9, 13, 421),
      DateTime(2026, 9, 20, 14, 9, 14, 845),
    ].iterator;
    final interceptor = ApiLogInterceptor(
      log: logger('ApiLogInterceptorTest'),
      now: () {
        times.moveNext();
        return times.current;
      },
    );
    final options = RequestOptions(
      baseUrl: 'http://localhost:8081',
      path: '/api/daily-editions/run-1/attempts',
      method: 'POST',
    );

    interceptor.onRequest(options, RequestInterceptorHandler());
    interceptor.onResponse(
      Response<dynamic>(requestOptions: options, statusCode: 200),
      ResponseInterceptorHandler(),
    );

    expect(records[0].level, Level.FINE);
    expect(
      records[0].message,
      'REQUEST  POST /api/daily-editions/run-1/attempts',
    );
    expect(records[1].level, Level.FINE);
    expect(
      records[1].message,
      'RESPONSE 200 POST /api/daily-editions/run-1/attempts 1424 ms',
    );
  });

  test('logs the Dio error and attached request diagnostics', () async {
    final times = <DateTime>[
      DateTime(2026, 9, 20, 14, 9, 13, 421),
      DateTime(2026, 9, 20, 14, 9, 13, 425),
    ].iterator;
    final interceptor = ApiLogInterceptor(
      log: logger('ApiLogInterceptorTest'),
      now: () {
        times.moveNext();
        return times.current;
      },
    );
    final options = RequestOptions(
      baseUrl: 'http://localhost:8081',
      path: '/api/daily-editions/run-1/attempts',
      method: 'POST',
    );
    const socketError = SocketException('Connection refused');

    interceptor.onRequest(options, RequestInterceptorHandler());
    final handler = ErrorInterceptorHandler();
    // The interceptor must forward the same error to the rest of Dio's chain.
    // ignore: invalid_use_of_protected_member
    final forwarded = handler.future.then<void>(
      (_) {},
      onError: (Object error, StackTrace stackTrace) {},
    );
    interceptor.onError(
      DioException(
        requestOptions: options,
        type: DioExceptionType.connectionError,
        error: socketError,
      ),
      handler,
    );
    await forwarded;

    final record = records.last;
    expect(record.level, errorLogLevel);
    expect(
      record.message,
      'connectionError POST /api/daily-editions/run-1/attempts '
      '4 ms',
    );
    final apiError = record.error as ApiTransportException;
    expect(apiError.kind, ApiTransportFailureKind.connectionRefused);
    expect(apiError.cause, socketError);
    expect(apiError.toString(), 'connection refused');
    final attached = record.object as StringRecord;
    final data = attached.data as Map<String, Object?>;
    expect(data['duration_ms'], 4);
    expect(data['cause_type'], 'SocketException');
    expect(data['cause'], 'SocketException: Connection refused');
    expect(data['transport_failure'], 'connection_refused');
    expect(attached.fingerprint, [
      'api',
      'transport',
      'connection_refused',
    ]);
  });

  test('reports one event for repeated transport failures until recovery',
      () async {
    final interceptor = ApiLogInterceptor(
      log: logger('ApiLogInterceptorTest'),
    );
    const firstId = '29591116-b401-4a93-a612-76ee8dc72408';
    const secondId = '7197977e-bced-4c1e-8f51-0b10053cee6b';

    Future<void> recordFailure(String id) async {
      final options = RequestOptions(
        path: '/api/daily-editions/$id/attempts',
        method: 'POST',
      );
      interceptor.onRequest(options, RequestInterceptorHandler());
      final handler = ErrorInterceptorHandler();
      // ignore: invalid_use_of_protected_member
      final forwarded = handler.future.then<void>(
        (_) {},
        onError: (Object error, StackTrace stackTrace) {},
      );
      interceptor.onError(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: const SocketException('Connection refused'),
        ),
        handler,
      );
      await forwarded;
    }

    await recordFailure(firstId);
    await recordFailure(firstId);
    await recordFailure(secondId);

    final failures = records.where(
      (record) => record.message.startsWith('connectionError'),
    );
    expect(failures, hasLength(3));
    expect(failures.where((record) => record.error != null), hasLength(1));
    expect(failures.first.level, errorLogLevel);
    expect(failures.skip(1).every((record) => record.level == Level.WARNING),
        isTrue);
    expect(
      (failures.first.object as StringRecord).fingerprint,
      [
        'api',
        'transport',
        'connection_refused',
      ],
    );
    expect(
      (failures.last.object as StringRecord).toJson(),
      containsPair('sentry_event_suppressed', true),
    );

    final recoveryOptions = RequestOptions(path: '/api/user');
    interceptor.onResponse(
      Response<dynamic>(requestOptions: recoveryOptions, statusCode: 200),
      ResponseInterceptorHandler(),
    );
    expect(records.last.message, 'API CONNECTION RESTORED');

    await recordFailure(firstId);
    final errorsAfterRecovery = records.where(
      (record) => record.error is ApiTransportException,
    );
    expect(errorsAfterRecovery, hasLength(2));
  });

  test('groups transport failures by cause instead of endpoint', () {
    final refused = classifyApiTransportFailure(
      DioException(
        requestOptions: RequestOptions(path: '/first'),
        type: DioExceptionType.connectionError,
      ),
      const SocketException('Connection refused'),
    );
    final offline = classifyApiTransportFailure(
      DioException(
        requestOptions: RequestOptions(path: '/second'),
        type: DioExceptionType.connectionError,
      ),
      const SocketException('Failed host lookup'),
    );
    final interrupted = classifyApiTransportFailure(
      DioException(
        requestOptions: RequestOptions(path: '/third'),
        type: DioExceptionType.unknown,
      ),
      const HttpException('Connection reset by peer'),
    );

    expect(refused, ApiTransportFailureKind.connectionRefused);
    expect(offline, ApiTransportFailureKind.networkUnavailable);
    expect(interrupted, ApiTransportFailureKind.connectionInterrupted);
  });

  test('keeps response errors grouped by endpoint and status', () async {
    final interceptor = ApiLogInterceptor(
      log: logger('ApiLogInterceptorTest'),
    );
    final options = RequestOptions(
      path: '/api/daily-editions/29591116-b401-4a93-a612-76ee8dc72408/current',
      method: 'GET',
    );
    final handler = ErrorInterceptorHandler();
    // ignore: invalid_use_of_protected_member
    final forwarded = handler.future.then<void>(
      (_) {},
      onError: (Object error, StackTrace stackTrace) {},
    );
    interceptor.onError(
      DioException.badResponse(
        statusCode: 503,
        requestOptions: options,
        response: Response<dynamic>(
          requestOptions: options,
          statusCode: 503,
        ),
      ),
      handler,
    );
    await forwarded;

    final record = records.last;
    expect(record.error, isA<ApiRequestException>());
    expect((record.object as StringRecord).fingerprint, [
      'api',
      'GET',
      '/api/daily-editions/{id}/current',
      'badResponse',
      'status:503',
    ]);
  });

  test('logs handled daily edition conflicts without an error event', () async {
    final interceptor = ApiLogInterceptor(
      log: logger('ApiLogInterceptorTest'),
    );
    final options = RequestOptions(
      path: '/api/daily-editions/run-1/review-replacements',
      method: 'POST',
    );
    final handler = ErrorInterceptorHandler();
    // ignore: invalid_use_of_protected_member
    final forwarded = handler.future.then<void>(
      (_) {},
      onError: (Object error, StackTrace stackTrace) {},
    );

    interceptor.onError(
      DioException.badResponse(
        statusCode: 409,
        requestOptions: options,
        response: Response<dynamic>(
          requestOptions: options,
          statusCode: 409,
          data: const {
            'error': 'CURRENT_ASSIGNMENT_EXISTS',
            'message': 'Resolve the current assignment first',
          },
        ),
      ),
      handler,
    );
    await forwarded;

    final record = records.single;
    expect(record.level, Level.FINE);
    expect(
      record.message,
      'RESPONSE 409 POST '
      '/api/daily-editions/run-1/review-replacements 0 ms '
      '(CURRENT_ASSIGNMENT_EXISTS)',
    );
    expect(record.error, isNull);
  });

  test('does not report request cancellation as an error', () async {
    final interceptor = ApiLogInterceptor(
      log: logger('ApiLogInterceptorTest'),
    );
    final options = RequestOptions(path: '/api/user');
    final handler = ErrorInterceptorHandler();
    // ignore: invalid_use_of_protected_member
    final forwarded = handler.future.then<void>(
      (_) {},
      onError: (Object error, StackTrace stackTrace) {},
    );
    interceptor.onError(
      DioException.requestCancelled(
        requestOptions: options,
        reason: 'navigation',
      ),
      handler,
    );
    await forwarded;

    expect(records.last.level, Level.FINE);
    expect(records.last.error, isNull);
  });

  test('uses a readable fallback when Dio has no error details', () async {
    final times = <DateTime>[
      DateTime(2026, 9, 20, 14, 9, 13),
      DateTime(2026, 9, 20, 14, 9, 15),
    ].iterator;
    final interceptor = ApiLogInterceptor(
      log: logger('ApiLogInterceptorTest'),
      now: () {
        times.moveNext();
        return times.current;
      },
    );
    final options = RequestOptions(path: 'http://localhost:8081/attempts');

    interceptor.onRequest(options, RequestInterceptorHandler());
    final handler = ErrorInterceptorHandler();
    // The interceptor must forward the same error to the rest of Dio's chain.
    // ignore: invalid_use_of_protected_member
    final forwarded = handler.future.then<void>(
      (_) {},
      onError: (Object error, StackTrace stackTrace) {},
    );
    interceptor.onError(
      DioException(
        requestOptions: options,
        type: DioExceptionType.unknown,
      ),
      handler,
    );
    await forwarded;

    final record = records.last;
    expect(record.message, 'unknown GET /attempts 2000 ms');
    final apiError = record.error as ApiRequestException;
    expect(apiError.toString(), 'unknown GET /attempts');
    expect(apiError.cause, 'no details');
  });
}
