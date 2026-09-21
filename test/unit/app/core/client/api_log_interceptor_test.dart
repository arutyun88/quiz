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
    expect(record.error, socketError);
    final attached = record.object as StringRecord;
    expect((attached.data as Map<String, Object?>)['duration_ms'], 4);
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

    expect(records.last.message, 'unknown GET /attempts 2000 ms');
    expect(records.last.error, 'no details');
  });
}
