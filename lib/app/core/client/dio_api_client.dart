import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/client/api_client_config.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';

class DioApiClient implements ApiClient {
  final Dio _dio;

  DioApiClient({
    required ApiClientConfig config,
    required String deviceId,
  }) : _dio = _configurDio(config, deviceId);

  static _configurDio(ApiClientConfig config, String deviceId) {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: config.connectTimeout,
        receiveTimeout: config.receiveTimeout,
        sendTimeout: config.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-Device-ID': deviceId,
        },
      ),
    );

    if (config.enableLogging) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
        ),
      );
    }

    return dio;
  }

  @override
  Future<Result<TEntity, Failure>> get<TEntity, TDto>(
    String path, {
    Json? queryParameters,
    Json? headers,
    required JsonMapper<TDto> mapper,
    required TEntity Function(TDto) converter,
  }) async {
    try {
      final result = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      final data = result.data['data'];
      final mappedData = mapper(data);

      return Result.ok(converter(mappedData));
    } on DioException catch (e) {
      return Result.failed(_handleError(e));
    }
  }

  @override
  Future<Result<TEntity, Failure>> post<TEntity, TDto>(
    String path, {
    required Json body,
    Json? queryParameters,
    Json? headers,
    required JsonMapper<TDto> mapper,
    required TEntity Function(TDto) converter,
  }) async {
    try {
      final result = await _dio.post(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      final data = result.data['data'];
      final mappedData = mapper(data);

      return Result.ok(converter(mappedData));
    } on DioException catch (e) {
      return Result.failed(_handleError(e));
    }
  }

  @override
  Future<Result<dynamic, Failure>> download(
    String url,
    String savePath, {
    OnProgressCallback? onReceiveProgress,
    Json? queryParameters,
    Json? headers,
  }) async {
    try {
      final response = await _dio.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return Result.ok(response.data);
    } on DioException catch (exc) {
      return Result.failed(_handleError(exc));
    }
  }

  Failure _handleError(DioException exc) {
    switch (exc.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure.network(
          NetworkFailureReason.timeout('Timeout error occurred'),
        );
      case DioExceptionType.badResponse:
        final data = exc.response?.data;
        final error = data?['error'];
        final message = data?['message'] ?? exc.message;

        if (error == 'INVALID_USERNAME_OR_PASSWORD') {
          return Failure.network(
            NetworkFailureReason.credential(message ?? 'User credential error'),
          );
        }

        return Failure.network(
          NetworkFailureReason.badResponse(message ?? 'Bad response error'),
        );
      case DioExceptionType.cancel:
        return Failure.network(
          NetworkFailureReason.server(exc.message ?? 'Request was cancelled'),
        );
      default:
        return const Failure.network(
          NetworkFailureReason.server('Network error occurred'),
        );
    }
  }
}
