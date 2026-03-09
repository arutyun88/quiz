import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/app/core/services/unauthorized_event_service.dart';

class AuthInterceptor extends Interceptor {
  final AuthTokenService _tokenService;
  final UnauthorizedEventService _unauthorizedEventService;

  AuthInterceptor({
    required AuthTokenService tokenService,
    required UnauthorizedEventService unauthorizedEventService,
  })  : _tokenService = tokenService,
        _unauthorizedEventService = unauthorizedEventService;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
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
    if (err.response?.statusCode == 401) {
      _tokenService.clean();
      _unauthorizedEventService.notify();
    }

    return handler.next(err);
  }
}
