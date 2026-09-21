import 'package:dio/dio.dart';
import 'package:quiz/features/observability/domain/logger.dart';

class ApiLogInterceptor extends Interceptor {
  ApiLogInterceptor({
    ExtendedLogger? log,
    DateTime Function()? now,
  })  : _logger = log ?? logger('DioApiClient')('HTTP'),
        _now = now ?? DateTime.now;

  static const _requestLogEntryKey = 'api_log_entry';

  final ExtendedLogger _logger;
  final DateTime Function() _now;

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
    _logger.error(
      logError,
      trace: err.stackTrace,
      message: '${err.type.name} '
          '${options.method} ${_requestTarget(options)} '
          '$duration ms',
      data: {
        'method': options.method,
        'path': options.uri.path,
        'duration_ms': duration,
        'dio_type': err.type.name,
        if (err.response?.statusCode case final statusCode?)
          'status_code': statusCode,
      },
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
}

class _RequestLogEntry {
  const _RequestLogEntry(this.startedAt);

  final DateTime startedAt;
}
