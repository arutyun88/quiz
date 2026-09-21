import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/features/observability/data/sentry_bootstrap.dart';
import 'package:quiz/features/observability/domain/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

final loggingSessionId = const Uuid().v4().split('-').first;
const ignoredLoggerNames = ['socket_io', 'fwfh.'];

abstract final class LoggingSetup {
  static const runtimeMinimumLevelPreferenceKey = 'debug:logging_level';
  static const selectableLevels = <Level>[
    Level.ALL,
    Level.FINEST,
    Level.FINER,
    Level.FINE,
    Level.CONFIG,
    Level.INFO,
    Level.WARNING,
    errorLogLevel,
    Level.OFF,
  ];

  static StreamSubscription<LogRecord>? _subscription;
  static Level Function() _readConfiguredConsoleMinimumLevel = () => Level.ALL;
  static Level Function() _readBreadcrumbMinimumLevel = () => Level.ALL;
  static Level? _runtimeConsoleMinimumLevel;

  static void setup({
    SharedPreferences? preferences,
    Level Function()? readConsoleMinimumLevel,
    Level Function()? readBreadcrumbMinimumLevel,
  }) {
    hierarchicalLoggingEnabled = true;
    // Console and Sentry have independent thresholds, so the root logger must
    // let every record reach both consumers.
    Logger.root.level = Level.ALL;
    if (readConsoleMinimumLevel != null) {
      _readConfiguredConsoleMinimumLevel = readConsoleMinimumLevel;
    }
    if (readBreadcrumbMinimumLevel != null) {
      _readBreadcrumbMinimumLevel = readBreadcrumbMinimumLevel;
    }
    if (preferences != null) {
      final stored = preferences.getString(runtimeMinimumLevelPreferenceKey);
      _runtimeConsoleMinimumLevel =
          stored == null ? null : resolveRuntimeMinimumLevel(stored);
    }
    _subscription ??= Logger.root.onRecord.listen(_handleRecord);
  }

  @visibleForTesting
  static Level get consoleMinimumLevel =>
      _runtimeConsoleMinimumLevel ?? _readConfiguredConsoleMinimumLevel();

  static Level readRuntimeMinimumLevel(SharedPreferences preferences) =>
      resolveRuntimeMinimumLevel(
        preferences.getString(runtimeMinimumLevelPreferenceKey),
      );

  static Level resolveRuntimeMinimumLevel(String? storedLevelName) {
    final normalized = storedLevelName?.trim().toUpperCase();
    if (normalized == null || normalized.isEmpty) return Level.ALL;
    for (final level in selectableLevels) {
      if (level.name == normalized) return level;
    }
    return Level.ALL;
  }

  static Future<bool> setRuntimeMinimumLevel(
    SharedPreferences preferences,
    Level level,
  ) {
    _runtimeConsoleMinimumLevel = level;
    return preferences.setString(runtimeMinimumLevelPreferenceKey, level.name);
  }

  static Future<void> _handleRecord(LogRecord record) async {
    _printToConsole(record);

    if (!SentryBootstrap.enabled) return;

    final failureRecord = switch (record.object) {
      Failure failure => FailureRecord(
          failure: failure,
          message: null,
          extra: failureLogExtra(failure),
        ),
      StringRecord(:final message, data: Failure failure) => FailureRecord(
          failure: failure,
          message: message,
          extra: failureLogExtra(failure),
        ),
      FailureRecord value => value,
      _ => null,
    };

    if ((failureRecord != null || record.error != null) &&
        record.level >= Level.WARNING) {
      await _captureError(record, failureRecord);
    }

    final breadcrumbMinimumLevel = _readBreadcrumbMinimumLevel();
    if (_shouldCreateBreadcrumb(record, breadcrumbMinimumLevel)) {
      await _addBreadcrumb(record, breadcrumbMinimumLevel);
    }
  }

  static void _printToConsole(LogRecord record) {
    if (record.level < consoleMinimumLevel) return;
    var stackTrace = record.stackTrace;
    if (record.object is FailureRecord && record.level < Level.WARNING) {
      stackTrace = null;
    }
    developer.log(
      coloredConsoleMessage(record),
      stackTrace: stackTrace,
    );
  }

  static bool _shouldCreateBreadcrumb(LogRecord record, Level minimumLevel) {
    final ignored = ignoredLoggerNames.any(record.loggerName.contains);
    if (ignored && record.level < Level.WARNING) return false;
    return record.level >= minimumLevel;
  }

  static Future<void> _captureError(
    LogRecord record,
    FailureRecord? failureRecord,
  ) async {
    await Sentry.captureEvent(
      SentryEvent(
        throwable: record.error,
        message: SentryMessage(
          failureRecord?.message ?? record.message,
        ),
        fingerprint: eventFingerprint(record),
        level: sentryLevel(record.level),
        logger: record.loggerName,
        timestamp: record.time.toUtc(),
        type: 'error',
      ),
      stackTrace: record.stackTrace,
      withScope: (scope) async {
        if (failureRecord != null) {
          await scope.setContexts('failure', {
            ...?failureRecord.extra,
            'failure': failureLogName(failureRecord.failure),
          });
        } else if (record.object case StringRecord value) {
          await scope.setContexts('data', value.toJson());
        }
      },
    );
  }

  @visibleForTesting
  static List<String>? eventFingerprint(LogRecord record) =>
      switch (record.object) {
        StringRecord(:final fingerprint) => fingerprint,
        _ => null,
      };

  static Future<void> _addBreadcrumb(
    LogRecord record,
    Level minimumLevel,
  ) async {
    final processed = processLogRecord(
      record,
      minimumLevel: minimumLevel,
    );
    if (processed == null) return;
    await Sentry.addBreadcrumb(
      Breadcrumb.console(
        message: '($loggingSessionId) '
            '[${shortLevelCode(record.level)} | ${record.loggerName}]: '
            '${record.message}',
        timestamp: processed.timestamp,
        level: processed.level,
        data: processed.data,
      ),
    );
  }

  @visibleForTesting
  static ({
    String message,
    SentryLevel level,
    Map<String, dynamic>? data,
    DateTime timestamp,
  })? processLogRecord(
    LogRecord record, {
    Level minimumLevel = Level.ALL,
  }) {
    if (record.level < minimumLevel) return null;
    final object = () {
      if (record.object == null) return null;
      try {
        return jsonDecode(jsonEncode(record.object));
      } on Object {
        return record.object.toString();
      }
    }();
    final data = <String, dynamic>{
      if (object != null) 'object': object,
      if (record.error != null) 'error': record.error.toString(),
      if (record.stackTrace != null) 'stackTrace': record.stackTrace.toString(),
    };
    return (
      message: record.message,
      level: sentryLevel(record.level),
      data: data.isEmpty ? null : data,
      timestamp: record.time.toUtc(),
    );
  }

  @visibleForTesting
  static String consoleMessage(LogRecord record) {
    final meta = [
      shortLevelCode(record.level),
      _formatTime(record.time),
      record.loggerName,
    ]
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .join(' | ');
    final error = record.error == null ? '' : ' - ${record.error}';
    return '[$meta]: ${record.message}$error';
  }

  @visibleForTesting
  static String coloredConsoleMessage(LogRecord record) {
    final color = switch (record.level) {
      Level.FINE || Level.FINER || Level.FINEST => '\x1B[32m',
      Level.CONFIG => '\x1B[36m',
      Level.WARNING => '\x1B[33m',
      _ when record.level >= errorLogLevel => '\x1B[31m',
      _ => '\x1B[37m',
    };
    return '$color${consoleMessage(record)}\x1B[0m';
  }

  static SentryLevel sentryLevel(Level level) => switch (level) {
        Level.ALL ||
        Level.FINEST ||
        Level.FINER ||
        Level.FINE ||
        Level.CONFIG =>
          SentryLevel.debug,
        Level.INFO => SentryLevel.info,
        Level.WARNING => SentryLevel.warning,
        _ when level >= errorLogLevel => SentryLevel.error,
        _ => SentryLevel.debug,
      };

  static String shortLevelCode(Level level) {
    if (level >= errorLogLevel) return 'E';
    return switch (level) {
      Level.FINE => 'F',
      Level.FINER => 'FF',
      Level.FINEST => 'FFF',
      _ => level.name.substring(0, 1),
    };
  }

  static String _formatTime(DateTime value) {
    String twoDigits(int number) => number.toString().padLeft(2, '0');
    String threeDigits(int number) => number.toString().padLeft(3, '0');
    return '${twoDigits(value.hour)}:'
        '${twoDigits(value.minute)}:'
        '${twoDigits(value.second)}.'
        '${threeDigits(value.millisecond)}';
  }
}
