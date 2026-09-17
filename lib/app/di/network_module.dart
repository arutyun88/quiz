import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/client/dio_api_client.dart';
import 'package:quiz/app/core/client/api_client_config.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/app/core/services/device_id_service.dart';
import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:quiz/app/core/services/unauthorized_event_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class NetworkModule {
  @preResolve
  Future<DeviceIdService> deviceService(SharedPreferences preferences) async =>
      await DeviceIdServicePrefs.init(preferences);

  @singleton
  InternetConnection get internetConnection => InternetConnection();

  @singleton
  ApiClient apiClient(
    DeviceIdService deviceService,
    AuthTokenService tokenService,
    UnauthorizedEventService unauthorizedEventService,
    SettingsLocalStorageService settingsStorage,
  ) {
    const devTime = String.fromEnvironment('QUIZ_DEV_TIME');
    const devTimeKey = String.fromEnvironment('QUIZ_DEV_TIME_KEY');
    final config = ApiClientConfig(
      baseUrl: const String.fromEnvironment(
        'API_BASE_URL',
        defaultValue: 'http://localhost:8081/api',
      ),
      defaultHeaders: kDebugMode && devTime.isNotEmpty && devTimeKey.isNotEmpty
          ? {
              'X-Quiz-Dev-Time': devTime,
              'X-Quiz-Dev-Key': devTimeKey,
            }
          : const {},
    );
    return DioApiClient(
      config: config,
      deviceId: deviceService.deviceId,
      tokenService: tokenService,
      unauthorizedEventService: unauthorizedEventService,
      settingsStorage: settingsStorage,
    );
  }
}
