import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/client/dio_api_client.dart';
import 'package:quiz/app/core/client/api_client_config.dart';

@module
abstract class NetworkModule {
  @singleton
  ApiClient apiClient() {
    final config = ApiClientConfig(baseUrl: 'localhost:8081/api/');
    return DioApiClient(config: config);
  }
}
