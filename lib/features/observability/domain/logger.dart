import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:quiz/app/core/model/failure.dart';

export 'package:logging/logging.dart' show Level;

const errorLogLevel = Level('ERROR', 1000);

final logger = ExtendedLogger(Logger(''));

extension type ExtendedLogger(Logger _logger) implements Logger {
  ExtendedLogger call(Object tag, [Level? level]) {
    var tagName = tag.toString();
    if (tagName.startsWith('.')) tagName = tagName.substring(1);
    if (tagName.endsWith('.')) {
      tagName = tagName.substring(0, tagName.length - 1);
    }

    hierarchicalLoggingEnabled = true;
    final parent = _logger.name.isEmpty ? '' : '${_logger.name}.';
    final instance = ExtendedLogger(Logger('$parent$tagName'));
    if (instance.parent != null || level != null) instance.level = level;
    return instance;
  }

  /// Supports both the message-first form:
  /// `log.error('message', error: error, stackTrace: stackTrace)`
  /// and the Quiz shorthand:
  /// `log.error(error, message: 'message', trace: stackTrace)`.
  void error(
    Object value, {
    Object? error,
    StackTrace? stackTrace,
    StackTrace? trace,
    String? message,
    Object? data,
    List<String>? fingerprint,
  }) {
    assert(stackTrace == null || trace == null);
    final resolvedError = error ?? value;
    final resolvedMessage = message ??
        (error == null ? resolvedError.toString() : value.toString());
    log(
      errorLogLevel,
      data == null && fingerprint == null
          ? resolvedMessage
          : StringRecord(
              resolvedMessage,
              data ?? const <String, Object?>{},
              fingerprint: fingerprint,
            ),
      resolvedError,
      stackTrace ?? trace ?? StackTrace.current,
    );
  }

  void failure(
    Failure failure,
    Object error, {
    StackTrace? stackTrace,
    String? message,
    Map<String, Object?>? extra,
  }) {
    log(
      failureLogLevel(failure),
      FailureRecord(
        failure: failure,
        message: message,
        extra: {...?failureLogExtra(failure), ...?extra},
      ),
      error,
      stackTrace ?? StackTrace.current,
    );
  }
}

class StringRecord {
  const StringRecord(
    this.message,
    this.data, {
    this.fingerprint,
  });

  final String message;
  final Object data;
  final List<String>? fingerprint;

  @override
  String toString() => message;

  dynamic toJson() {
    try {
      return jsonDecode(
        jsonEncode(
          data,
          toEncodable: (value) {
            try {
              return (value as dynamic).toJson();
            } on Object {
              return value.toString();
            }
          },
        ),
      );
    } on Object {
      return {'data': data.toString()};
    }
  }
}

extension StringRecordX on String {
  StringRecord attach(Object data) => StringRecord(this, data);
}

class FailureRecord {
  const FailureRecord({
    required this.failure,
    required this.message,
    required this.extra,
  });

  final Failure failure;
  final String? message;
  final Map<String, Object?>? extra;

  @override
  String toString() => [
        if (message?.trim().isNotEmpty ?? false) message!.trim(),
        failure.toString(),
        if (extra?.isNotEmpty ?? false)
          extra!.entries
              .map((entry) => '${entry.key}: ${entry.value}')
              .join(', '),
      ].join(' - ');
}

extension ObjectLoggerX on Object {
  ExtendedLogger get log => logger(runtimeType);
}

Level failureLogLevel(Failure failure) => switch (failure) {
      UnknownFailure() => errorLogLevel,
      QuestionFailure(
        reason: QuestionFailureSaveReason() ||
            QuestionFailureClearCacheReason() ||
            QuestionFailureCheckStateReason() ||
            QuestionFailureMarkAsAnsweredReason(),
      ) =>
        errorLogLevel,
      _ => Level.WARNING,
    };

Map<String, Object?>? failureLogExtra(Failure failure) => switch (failure) {
      AuthenticationFailure(:final type) => {'type': type.name},
      NetworkFailure(:final reason) => {
          'reason': reason.runtimeType.toString(),
          if (reason
              case NetworkFailureBadResponseReason(
                :final statusCode,
                :final errorCode,
              )) ...{
            if (statusCode != null) 'status_code': statusCode,
            if (errorCode != null) 'error_code': errorCode,
          },
        },
      QuestionFailure(:final reason) => {
          'reason': reason.runtimeType.toString(),
        },
      _ => null,
    };

String failureLogName(Failure failure) => switch (failure) {
      UnknownFailure() => 'UnknownFailure',
      NoConnectionFailure() => 'NoConnectionFailure',
      ServerUnavailableFailure() => 'ServerUnavailableFailure',
      ConflictFailure() => 'ConflictFailure',
      AuthenticationFailure() => 'AuthenticationFailure',
      NetworkFailure() => 'NetworkFailure',
      QuestionFailure() => 'QuestionFailure',
      _ => 'Failure',
    };
