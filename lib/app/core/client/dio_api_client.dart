import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/client/api_client_config.dart';
import 'package:quiz/app/core/client/auth_interceptor.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:quiz/features/authentication/data/converter/token_converter.dart';

class DioApiClient implements ApiClient {
  final Dio _dio;
  final SettingsLocalStorageService _settingsStorage;

  DioApiClient({
    required ApiClientConfig config,
    required String deviceId,
    required AuthTokenService tokenService,
    required TokenConverter tokenConverter,
    required SettingsLocalStorageService settingsStorage,
  })  : _dio = _configurDio(config, deviceId, tokenService, tokenConverter),
        _settingsStorage = settingsStorage;

  static _configurDio(
    ApiClientConfig config,
    String deviceId,
    AuthTokenService tokenService,
    TokenConverter tokenConverter,
  ) {
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

    dio.interceptors.add(
      AuthInterceptor(
        tokenService: tokenService,
        tokenConverter: tokenConverter,
        refreshUrl: '/auth/refresh',
        dio: dio,
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
    bool enableLocale = false,
  }) async {
    try {
      final requestHeaders = _prepareHeaders(headers, enableLocale);
      final result = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: requestHeaders),
      );

      final mappedData = mapper(result.data);

      return Result.ok(converter(mappedData));
    } on DioException catch (e) {
      return Result.failed(_handleError(e));
    }
  }

  @override
  Future<Result<TEntity, Failure>> post<TEntity, TDto>(
    String path, {
    Json? body,
    Json? queryParameters,
    Json? headers,
    JsonMapper<TDto>? mapper,
    TEntity Function(TDto)? converter,
    bool enableLocale = false,
  }) async {
    assert(
      (mapper == null) == (converter == null),
      'Both mapper and converter must be either provided or null',
    );

    try {
      final requestHeaders = _prepareHeaders(headers, enableLocale);
      final result = await _dio.post(
        path,
        data: body != null ? jsonEncode(body) : null,
        queryParameters: queryParameters,
        options: Options(headers: requestHeaders),
      );

      if (mapper == null || converter == null || result.data is! Json) {
        return Result.ok(null as TEntity);
      }

      final mappedData = mapper(result.data);

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

  Json _prepareHeaders(Json? headers, bool enableLocale) {
    final requestHeaders = Map<String, dynamic>.from(headers ?? {});
    if (enableLocale) {
      requestHeaders['X-Lang'] = _settingsStorage.fetchLocale();
    }
    return requestHeaders;
  }
}
