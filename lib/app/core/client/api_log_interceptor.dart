import 'package:dio/dio.dart';
import 'package:quiz/features/observability/domain/logger.dart';

class ApiLogInterceptor extends Interceptor {
  ApiLogInterceptor({
    ExtendedLogger? log,
    DateTime Function()? now,
  })  : _logger = log ?? logger('DioApiClient')('HTTP'),
        _now = now ?? DateTime.now;

  static const _requestLogEntryKey = 'api_log_entry';
  static const _expectedConflictCodes = {
    'CURRENT_ASSIGNMENT_EXISTS',
    'DAILY_RUN_COMPLETE',
    'MAIN_EDITION_INCOMPLETE',
  };

  final ExtendedLogger _logger;
  final DateTime Function() _now;
  final Set<ApiTransportFailureKind> _activeTransportIncidents = {};

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final startedAt = _now();
    options.extra[_requestLogEntryKey] = _RequestLogEntry(startedAt);
    _logger.fine(
      'REQUEST  ${options.method} ${_requestTarget(options)}',
    );
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final completedAt = _now();
    final options = response.requestOptions;
    _logger.fine(
      'RESPONSE ${response.statusCode ?? '-'} '
      '${options.method} ${_requestTarget(options)} '
      '${_elapsedMilliseconds(options, completedAt)} ms',
    );
    if (_activeTransportIncidents.isNotEmpty) {
      final resolvedIncidents = _activeTransportIncidents
          .map((incident) => incident.key)
          .toList(growable: false);
      _activeTransportIncidents.clear();
      _logger.info(
        StringRecord(
          'API CONNECTION RESTORED',
          {'resolved_transport_failures': resolvedIncidents},
        ),
      );
    }
    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    final completedAt = _now();
    final options = err.requestOptions;
    final logError = err.error ??
        (err.message?.trim().isNotEmpty ?? false ? err.message! : 'no details');
    final duration = _elapsedMilliseconds(options, completedAt);
    final normalizedPath = normalizeApiPathForGrouping(options.uri.path);
    final responseErrorCode = _responseErrorCode(err.response?.data);
    final message = '${err.type.name} '
        '${options.method} ${_requestTarget(options)} '
        '$duration ms';
    final data = <String, Object?>{
      'method': options.method,
      'path': options.uri.path,
      'normalized_path': normalizedPath,
      'duration_ms': duration,
      'dio_type': err.type.name,
      'cause_type': logError.runtimeType.toString(),
      'cause': logError.toString(),
      if (err.response?.statusCode case final statusCode?)
        'status_code': statusCode,
      if (responseErrorCode != null) 'error_code': responseErrorCode,
    };

    if (err.type == DioExceptionType.cancel) {
      _logger.fine(StringRecord(message, data));
      handler.next(err);
      return;
    }

    if (err.response?.statusCode == 409 &&
        _expectedConflictCodes.contains(responseErrorCode)) {
      _logger.fine(
        StringRecord(
          'RESPONSE 409 ${options.method} ${_requestTarget(options)} '
          '$duration ms ($responseErrorCode)',
          data,
        ),
      );
      handler.next(err);
      return;
    }

    final transportFailure = classifyApiTransportFailure(err, logError);
    if (transportFailure != null) {
      data['transport_failure'] = transportFailure.key;
      if (_activeTransportIncidents.add(transportFailure)) {
        _logger.error(
          ApiTransportException(
            kind: transportFailure,
            cause: logError,
          ),
          trace: err.stackTrace,
          message: message,
          data: data,
          fingerprint: ['api', 'transport', transportFailure.key],
        );
      } else {
        _logger.warning(
          StringRecord(
            message,
            {...data, 'sentry_event_suppressed': true},
          ),
        );
      }
      handler.next(err);
      return;
    }

    final apiError = ApiRequestException(
      method: options.method,
      path: normalizedPath,
      type: err.type,
      cause: logError,
    );
    _logger.error(
      apiError,
      trace: err.stackTrace,
      message: message,
      data: data,
      fingerprint: [
        'api',
        options.method.toUpperCase(),
        normalizedPath,
        err.type.name,
        if (err.response?.statusCode case final statusCode?)
          'status:$statusCode'
        else
          'error:${logError.runtimeType}',
      ],
    );
    handler.next(err);
  }

  int _elapsedMilliseconds(RequestOptions options, DateTime completedAt) {
    final entry = options.extra.remove(_requestLogEntryKey);
    if (entry is! _RequestLogEntry) return 0;
    return completedAt.difference(entry.startedAt).inMilliseconds;
  }

  String _requestTarget(RequestOptions options) {
    return options.uri.path;
  }

  String? _responseErrorCode(Object? responseData) {
    if (responseData is! Map) return null;
    final error = responseData['error'];
    return error is String ? error : null;
  }
}

enum ApiTransportFailureKind {
  connectionRefused('connection_refused', 'connection refused'),
  connectionInterrupted('connection_interrupted', 'connection interrupted'),
  networkUnavailable('network_unavailable', 'network unavailable'),
  connectionFailed('connection_failed', 'connection failed');

  const ApiTransportFailureKind(this.key, this.description);

  final String key;
  final String description;
}

final class ApiTransportException implements Exception {
  const ApiTransportException({
    required this.kind,
    required this.cause,
  });

  final ApiTransportFailureKind kind;
  final Object cause;

  @override
  String toString() => kind.description;
}

final class ApiRequestException implements Exception {
  const ApiRequestException({
    required this.method,
    required this.path,
    required this.type,
    required this.cause,
  });

  final String method;
  final String path;
  final DioExceptionType type;
  final Object cause;

  @override
  String toString() => '${type.name} ${method.toUpperCase()} $path';
}

ApiTransportFailureKind? classifyApiTransportFailure(
  DioException exception,
  Object cause,
) {
  final description = cause.toString().toLowerCase();

  if (description.contains('failed host lookup') ||
      description.contains('network is unreachable') ||
      description.contains('network unreachable') ||
      description.contains('no route to host') ||
      description.contains('network is down') ||
      description.contains('not connected to the internet') ||
      description.contains('internet connection appears to be offline')) {
    return ApiTransportFailureKind.networkUnavailable;
  }
  if (description.contains('connection refused')) {
    return ApiTransportFailureKind.connectionRefused;
  }
  if (description.contains('connection reset') ||
      description.contains('connection closed before full header') ||
      description.contains('broken pipe')) {
    return ApiTransportFailureKind.connectionInterrupted;
  }
  if (exception.type == DioExceptionType.connectionError) {
    return ApiTransportFailureKind.connectionFailed;
  }
  return null;
}

String normalizeApiPathForGrouping(String path) => path.replaceAll(
      RegExp(
        r'(?<=/)[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}(?=/|$)',
        caseSensitive: false,
      ),
      '{id}',
    );

class _RequestLogEntry {
  const _RequestLogEntry(this.startedAt);

  final DateTime startedAt;
}
