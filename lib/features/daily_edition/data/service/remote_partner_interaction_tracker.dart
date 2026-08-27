import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/features/daily_edition/domain/service/partner_interaction_tracker.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: PartnerInteractionTracker)
class RemotePartnerInteractionTracker implements PartnerInteractionTracker {
  const RemotePartnerInteractionTracker({required ApiClient client})
      : _client = client;

  final ApiClient _client;

  @override
  Future<void> recordImpression(PartnerInteraction interaction) =>
      _record(interaction, 'IMPRESSION');

  @override
  Future<void> recordClick(PartnerInteraction interaction) =>
      _record(interaction, 'CLICK');

  Future<void> _record(
    PartnerInteraction interaction,
    String eventType,
  ) async {
    final clientEventId = const Uuid().v5(
      Namespace.url.value,
      'quiz:partner:${interaction.campaignId}:${interaction.attemptId}:$eventType',
    );
    await _client.post<void, void>(
      '/partner-events',
      body: {
        'clientEventId': clientEventId,
        'campaignId': interaction.campaignId,
        'attemptId': interaction.attemptId,
        'eventType': eventType,
      },
    );
  }
}
