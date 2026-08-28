import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/json.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/push/data/dto/notification_preferences_dto.dart';
import 'package:quiz/features/push/domain/entity/notification_preferences_entity.dart';
import 'package:quiz/features/push/domain/repository/push_repository.dart';

@LazySingleton(as: PushRepository)
final class RemotePushRepository implements PushRepository {
  const RemotePushRepository({required ApiClient client}) : _client = client;

  final ApiClient _client;

  @override
  Future<Result<void, Failure>> registerDevice({
    required String installationId,
    required String registrationToken,
    required String platform,
    String? locale,
  }) =>
      _client.put(
        '/user/push-devices/$installationId',
        body: {
          'provider': 'FCM',
          'registration_token': registrationToken,
          'platform': platform,
          if (locale != null) 'locale': locale,
        },
      );

  @override
  Future<Result<void, Failure>> unregisterDevice(String installationId) =>
      _client.delete('/user/push-devices/$installationId');

  @override
  Future<Result<NotificationPreferencesEntity, Failure>> fetchPreferences() =>
      _client.get(
        '/user/notification-preferences',
        mapper: _mapPreferences,
        converter: _toEntity,
      );

  @override
  Future<Result<NotificationPreferencesEntity, Failure>> updatePreferences(
    NotificationPreferencesEntity preferences,
  ) =>
      _client.put(
        '/user/notification-preferences',
        body: {
          'daily_edition': preferences.dailyEdition,
          'streak_risk': preferences.streakRisk,
          'rank_change': preferences.rankChange,
          'promotions': preferences.promotions,
        },
        mapper: _mapPreferences,
        converter: _toEntity,
      );

  static DataDto<NotificationPreferencesDto> _mapPreferences(Json json) =>
      DataDto.fromJson(
        json,
        (data) => NotificationPreferencesDto.fromJson(data as Json),
      );

  static NotificationPreferencesEntity _toEntity(
    DataDto<NotificationPreferencesDto> response,
  ) =>
      NotificationPreferencesEntity(
        dailyEdition: response.data.dailyEdition,
        streakRisk: response.data.streakRisk,
        rankChange: response.data.rankChange,
        promotions: response.data.promotions,
      );
}
