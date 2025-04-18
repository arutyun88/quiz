import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/client/dio_api_client.dart';
import 'package:quiz/app/core/client/api_client_config.dart';
import 'package:quiz/app/core/services/auth_token_service.dart';
import 'package:quiz/app/core/services/device_id_service.dart';
import 'package:quiz/features/authentication/data/converter/token_converter.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class NetworkModule {
  @preResolve
  Future<DeviceIdService> deviceService(SharedPreferences preferences) async =>
      await DeviceIdServicePrefs.init(preferences);

  @singleton
  ApiClient apiClient(
    DeviceIdService deviceService,
    AuthTokenService tokenService,
    TokenConverter tokenConverter,
  ) {
    final config = ApiClientConfig(baseUrl: 'http://localhost:8081/api');
    return DioApiClient(
      config: config,
      deviceId: deviceService.deviceId,
      tokenService: tokenService,
      tokenConverter: tokenConverter,
    );
  }
}
