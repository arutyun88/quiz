import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quiz/app/core/model/auth_tokens.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/features/authentication/data/converter/token_converter.dart';
import 'package:quiz/features/authentication/data/dto/token_dto.dart';

class PendingRequest {
  final RequestOptions options;
  final ErrorInterceptorHandler handler;

  PendingRequest(this.options, this.handler);
}

class AuthInterceptor extends Interceptor {
  final AuthTokenService _tokenService;
  final String _refreshUrl;
  final Dio _dio;
  final TokenConverter _tokenConverter;

  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;
  final List<PendingRequest> _pendingRequests = [];

  AuthInterceptor({
    required AuthTokenService tokenService,
    required String refreshUrl,
    required Dio dio,
    required TokenConverter tokenConverter,
  })  : _dio = dio,
        _refreshUrl = refreshUrl,
        _tokenService = tokenService,
        _tokenConverter = tokenConverter;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_refreshCompleter case Completer completer when _isRefreshing) {
      try {
        await completer.future;
      } catch (_) {}
    }

    if (_tokenService.accessToken case String token) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 && _tokenService.refreshToken is String) {
      _pendingRequests.add(PendingRequest(err.requestOptions, handler));

      if (_isRefreshing) return;

      _isRefreshing = true;
      _refreshCompleter = Completer<void>();

      try {
        final tokens = await _refreshTokens;

        if (tokens case AuthTokens tokens) {
          await _tokenService.save(tokens);

          _processPendingRequests();
        } else {
          _rejectPendingRequests();
          _tokenService.clean();
        }
      } catch (e) {
        _rejectPendingRequests();
        _tokenService.clean();
      } finally {
        _isRefreshing = false;
        _refreshCompleter?.complete();
        _refreshCompleter = null;
      }
      return;
    }

    return handler.next(err);
  }

  Future<AuthTokens?> get _refreshTokens async {
    try {
      final refreshToken = _tokenService.refreshToken;

      if (refreshToken == null) return null;

      final client = Dio(
        _dio.options.copyWith(
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
        ),
      );
      client.interceptors.addAll(_dio.interceptors);

      final result = await client.post(
        _refreshUrl,
        queryParameters: {
          'token': refreshToken,
        },
      );

      final data = result.data['data'];
      final tokens = _tokenConverter.convert(TokenDto.fromJson(data));

      final authTokens = AuthTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      );

      await _tokenService.save(authTokens);

      return authTokens;
    } catch (_) {
      return null;
    }
  }

  void _rejectPendingRequests() {
    for (var request in _pendingRequests) {
      request.handler.next(
        DioException(
          requestOptions: request.options,
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: request.options,
            statusCode: 401,
            statusMessage: 'Unauthorized',
            data: {
              "code": 401,
              "error": "USER_UNAUTHORIZED",
              "message": "User is not authorized",
            },
          ),
        ),
      );
    }
    _pendingRequests.clear();
  }

  Future<void> _processPendingRequests() async {
    if (_tokenService.accessToken case String token) {
      final client = Dio(_dio.options);
      client.interceptors.addAll(_dio.interceptors);
      client.options.headers['Authorization'] = 'Bearer $token';

      for (final request in _pendingRequests) {
        try {
          final response = await client.fetch(request.options);
          request.handler.resolve(response);
        } on DioException catch (e) {
          request.handler.next(e);
        }
      }
    }

    _pendingRequests.clear();
  }
}
