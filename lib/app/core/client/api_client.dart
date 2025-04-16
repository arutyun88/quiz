import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';

/// Прогресс скачивания
/// [count] - текущее количество байт
/// [total] - общее количество байт, может быть -1 если размер неизвестен
typedef OnProgressCallback = void Function(int count, int total);

/// Функция для преобразования JSON в DTO объект
typedef JsonMapper<TDto> = TDto Function(Map<String, dynamic> json);

abstract interface class ApiClient {
  Future<Result<TEntity, Failure>> get<TEntity, TDto>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    required JsonMapper<TDto> mapper,
    required TEntity Function(TDto) converter,
  });

  Future<Result<TEntity, Failure>> post<TEntity, TDto>(
    String path, {
    Json body,
    Json? queryParameters,
    Json? headers,
    JsonMapper<TDto>? mapper,
    TEntity Function(TDto)? converter,
  });

  Future<Result<dynamic, Failure>> download(
    String url,
    String savePath, {
    OnProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
