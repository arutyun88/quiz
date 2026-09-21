import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/features/observability/data/logging_setup.dart';
import 'package:quiz/features/observability/domain/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizRepository {}

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

  test('creates class-based and nested logger names', () {
    final log = logger(QuizRepository)('attempt');

    log.info('Attempt submitted');

    expect(records.single.loggerName, 'QuizRepository.attempt');
    expect(records.single.level, Level.INFO);
    expect(records.single.message, 'Attempt submitted');
  });

  test('provides a logger scoped to the current object', () {
    final repository = QuizRepository();

    repository.log.info('Attempt submitted');

    expect(records.single.loggerName, 'QuizRepository');
  });

  test('error helper supports the message-first call form', () {
    final error = StateError('Server unavailable');
    final trace = StackTrace.current;

    logger(QuizRepository).error(
      'Failed to submit attempt',
      error: error,
      stackTrace: trace,
      data: {'retry': 2},
      fingerprint: const ['api', 'POST', '/attempts'],
    );

    final record = records.single;
    expect(record.level, errorLogLevel);
    expect(record.error, error);
    expect(record.stackTrace, trace);
    expect(record.message, 'Failed to submit attempt');
    expect((record.object as StringRecord).toJson(), {'retry': 2});
    expect(LoggingSetup.eventFingerprint(record), [
      'api',
      'POST',
      '/attempts',
    ]);
  });

  test('error helper keeps the Quiz shorthand', () {
    final error = StateError('Server unavailable');
    final trace = StackTrace.current;

    logger(QuizRepository).error(
      error,
      trace: trace,
      message: 'Failed to submit attempt',
    );

    expect(records.single.level, errorLogLevel);
    expect(records.single.error, error);
    expect(records.single.stackTrace, trace);
    expect(records.single.message, 'Failed to submit attempt');
  });

  test('formats console output like the working application', () {
    final record = LogRecord(
      Level.WARNING,
      'Cache is stale',
      'QuizRepository',
      StateError('Expired'),
      null,
    );

    expect(
      LoggingSetup.consoleMessage(record),
      matches(
        RegExp(
          r'^\[W \| \d{2}:\d{2}:\d{2}\.\d{3} \| QuizRepository\]: '
          r'Cache is stale - Bad state: Expired$',
        ),
      ),
    );
  });

  test('attaches structured data to a message', () {
    logger(QuizRepository).info(
      'Profile loaded'.attach({
        'duration_ms': 42,
        'status': 'ready',
        'nested': {
          'status': 'ok',
        },
      }),
    );

    expect(
      (records.single.object as StringRecord).toJson(),
      {
        'duration_ms': 42,
        'status': 'ready',
        'nested': {'status': 'ok'},
      },
    );
  });

  test('processes breadcrumbs using the configured minimum level', () {
    logger(QuizRepository).info(
      'Attempt submitted'.attach({'retry': 2}),
    );
    final record = records.single;

    expect(
      LoggingSetup.processLogRecord(
        record,
        minimumLevel: Level.WARNING,
      ),
      isNull,
    );

    final processed = LoggingSetup.processLogRecord(
      record,
      minimumLevel: Level.INFO,
    );
    expect(processed?.message, 'Attempt submitted');
    expect(processed?.level, SentryLevel.info);
    expect(processed?.data?['object'], {'retry': 2});
  });

  test('logs expected failures as breadcrumbs and unexpected ones as errors',
      () {
    const noConnection = Failure.noConnection();
    logger(QuizRepository).failure(
      noConnection,
      noConnection,
      message: 'Attempt deferred',
    );
    final unexpected = StateError('Broken state');
    logger(QuizRepository).failure(
      Failure.unknown(unexpected),
      unexpected,
      message: 'Attempt failed',
    );

    expect(records[0].level, Level.WARNING);
    expect(records[0].message, contains('Attempt deferred'));
    expect(records[0].error, isA<NoConnectionFailure>());
    expect(records[1].level, errorLogLevel);
    expect(records[1].error, isA<StateError>());
    expect(records[1].object, isA<FailureRecord>());
  });

  test('resolves and persists the runtime minimum level', () async {
    SharedPreferences.setMockInitialValues({
      LoggingSetup.runtimeMinimumLevelPreferenceKey: 'warning',
    });
    final preferences = await SharedPreferences.getInstance();

    expect(LoggingSetup.readRuntimeMinimumLevel(preferences), Level.WARNING);
    expect(
      LoggingSetup.resolveRuntimeMinimumLevel('unsupported'),
      Level.ALL,
    );
    expect(
      LoggingSetup.resolveRuntimeMinimumLevel('error'),
      errorLogLevel,
    );

    await LoggingSetup.setRuntimeMinimumLevel(preferences, Level.INFO);

    expect(Logger.root.level, Level.ALL);
    expect(LoggingSetup.consoleMinimumLevel, Level.INFO);
    expect(
      preferences.getString(LoggingSetup.runtimeMinimumLevelPreferenceKey),
      'INFO',
    );
  });
}
