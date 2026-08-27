import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/daily_edition/data/service/remote_partner_interaction_tracker.dart';
import 'package:quiz/features/daily_edition/domain/service/partner_interaction_tracker.dart';

import '../../../../../support/mock_api_client.dart';

void main() {
  late MockApiClient client;
  late RemotePartnerInteractionTracker tracker;

  const interaction = PartnerInteraction(
    campaignId: '4de8e604-dffe-4ca4-8517-eca45459b946',
    attemptId: '26d11164-a46a-4d40-a7b5-ea83f740d477',
  );

  setUpAll(() => registerFallbackValue(<String, dynamic>{}));

  setUp(() {
    client = MockApiClient();
    tracker = RemotePartnerInteractionTracker(client: client);
    when(
      () => client.post<void, void>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer((_) async => const Result.ok(null));
  });

  test('sends the exact server event contract', () async {
    await tracker.recordImpression(interaction);
    await tracker.recordClick(interaction);

    final bodies = verify(
      () => client.post<void, void>(
        '/partner-events',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
        onSuccess: any(named: 'onSuccess'),
      ),
    ).captured.cast<Map<String, dynamic>>();

    expect(bodies, hasLength(2));
    expect(bodies[0], containsPair('eventType', 'IMPRESSION'));
    expect(bodies[1], containsPair('eventType', 'CLICK'));
    for (final body in bodies) {
      expect(body['campaignId'], interaction.campaignId);
      expect(body['attemptId'], interaction.attemptId);
      expect(body['clientEventId'], matches(_uuidV5Pattern));
      expect(body.keys, {
        'clientEventId',
        'campaignId',
        'attemptId',
        'eventType',
      });
    }
    expect(bodies[0]['clientEventId'], isNot(bodies[1]['clientEventId']));
  });

  test('reuses the event id across tracker instances and retries', () async {
    await tracker.recordImpression(interaction);
    await RemotePartnerInteractionTracker(client: client)
        .recordImpression(interaction);

    final ids = verify(
      () => client.post<void, void>(
        '/partner-events',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
        onSuccess: any(named: 'onSuccess'),
      ),
    )
        .captured
        .cast<Map<String, dynamic>>()
        .map((body) => body['clientEventId'])
        .toList();

    expect(ids[0], ids[1]);
  });
}

final _uuidV5Pattern = RegExp(
  r'^[0-9a-f]{8}-[0-9a-f]{4}-5[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
);
