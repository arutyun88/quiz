import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/push/domain/entity/notification_preferences_entity.dart';

abstract interface class PushRepository {
  Future<Result<void, Failure>> registerDevice({
    required String installationId,
    required String registrationToken,
    required String platform,
    String? locale,
  });

  Future<Result<void, Failure>> unregisterDevice(String installationId);

  Future<Result<NotificationPreferencesEntity, Failure>> fetchPreferences();

  Future<Result<NotificationPreferencesEntity, Failure>> updatePreferences(
    NotificationPreferencesEntity preferences,
  );
}
