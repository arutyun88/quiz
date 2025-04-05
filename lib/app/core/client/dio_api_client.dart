import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/client/api_client_config.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';

class DioApiClient implements ApiClient {
  final Dio _dio;

  DioApiClient({
    required ApiClientConfig config,
  }) : _dio = _configurDio(config);

  static _configurDio(config) {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: config.connectTimeout,
        receiveTimeout: config.receiveTimeout,
        sendTimeout: config.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
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
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }

    return dio;
  }

  @override
  Future<Result<dynamic, Failure>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final result = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return Result.ok(result.data);
    } on DioException catch (e) {
      return Result.failed(_handleError(e));
    }
  }

  @override
  Future<Result<dynamic, Failure>> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final result = await _dio.post(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return Result.ok(result.data);
    } on DioException catch (e) {
      return Result.failed(_handleError(e));
    }
  }

  @override
  Future<Result<dynamic, Failure>> download(
    String url,
    String savePath, {
    OnProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
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
        return Failure.network(
          NetworkFailureReason.badResponse(data?['message'] ?? exc.message ?? 'Bad response error'),
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
