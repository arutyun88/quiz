import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';

/// Прогресс скачивания
/// [count] - текущее количество байт
/// [total] - общее количество байт, может быть -1 если размер неизвестен
typedef OnProgressCallback = void Function(int count, int total);

abstract interface class ApiClient {
  Future<Result<dynamic, Failure>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Result<dynamic, Failure>> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Result<dynamic, Failure>> download(
    String url,
    String savePath, {
    OnProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
