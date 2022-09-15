import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quiz/app/data/config/dio_settings.dart';
import 'package:quiz/app/data/config/local_storage_service.dart';
import 'package:quiz/app/data/config/path.dart';
import 'package:quiz/app/data/model/preference_key.dart';

class AppInterceptor extends Interceptor {
  final Dio dio;

  AppInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path != DioSettings.baseUrl + Path.loginPath &&
        options.path != DioSettings.baseUrl + Path.refreshToken &&
        options.path != Path.usersPath) {
      options.headers['Authorization'] = DioSettings.tokenType +
          LocalStorageService.getValue(PreferenceKey.accessToken);
    }
    log(LocalStorageService.getValue(PreferenceKey.accessToken));
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401 || response.statusCode == 403) {
      _apiResponseMapping(
        await dio.post(
          Path.refreshToken,
          data: {
            'refresh': LocalStorageService.getValue(PreferenceKey.refreshToken),
          },
        ),
      ).then((tokens) async {
        await LocalStorageService.setValue(
            PreferenceKey.accessToken, tokens.access);
        await LocalStorageService.setValue(
            PreferenceKey.refreshToken, tokens.refresh);
        response = await dio.request<dynamic>(
          response.requestOptions.path,
          data: response.requestOptions.data,
          queryParameters: response.requestOptions.queryParameters,
          options: Options(
            headers: {
              'Authorization': DioSettings.tokenType + tokens.access,
            },
          ),
        );
      });
    }
    return handler.next(response);
  }

  Future<Token> _apiResponseMapping(Response response) async {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        return Token.fromJson(response.data);
      default:
        throw _exception(response);
    }
  }

  Exception _exception(Response response) {
    switch (response.statusCode) {
      case 401:
        throw TokenRefreshException.fromJson(response.data);
      default:
        throw Exception('${response.statusCode}');
    }
  }
}

class Token {
  late String access;
  late String refresh;

  Token({
    required this.access,
    required this.refresh,
  });

  factory Token.fromJson(Map<String, dynamic> json) =>
      Token(access: json['access'], refresh: json['refresh']);
}

class TokenRefreshException implements Exception {
  final String detail;
  final String code;

  const TokenRefreshException({
    required this.detail,
    required this.code,
  });

  factory TokenRefreshException.fromJson(Map<String, dynamic> json) =>
      TokenRefreshException(detail: json['detail'], code: json['code']);
}
