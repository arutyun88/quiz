import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/attribution/data/dto/acquisition_attribution_dto.dart';
import 'package:quiz/features/attribution/data/repository/remote_acquisition_attribution_repository.dart';
import 'package:quiz/features/attribution/domain/entity/acquisition_attribution_entity.dart';

import '../../../../../support/mock_api_client.dart';

void main() {
  late MockApiClient client;
  late RemoteAcquisitionAttributionRepository repository;

  const receipt = AcquisitionAttributionReceiptEntity(
    attributionId: 'attribution-1',
    clientEventId: 'event-1',
  );

  setUpAll(() => registerFallbackValue(<String, dynamic>{}));

  setUp(() {
    client = MockApiClient();
    repository = RemoteAcquisitionAttributionRepository(client: client);
    when(
      () => client.post<AcquisitionAttributionReceiptEntity,
          DataDto<AcquisitionAttributionReceiptDto>>(
        any(),
        body: any(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: any(named: 'enableLocale'),
        onSuccess: any(named: 'onSuccess'),
      ),
    ).thenAnswer((_) async => const Result.ok(receipt));
  });

  test('posts only the supplied acquisition signal', () async {
    await repository.record(
      const AcquisitionAttributionSignalEntity(
        clientEventId: 'event-1',
        provider: 'future_mmp',
        providerAttributionId: 'provider-install-42',
        campaign: 'launch',
      ),
    );

    final body = verify(
      () => client.post<AcquisitionAttributionReceiptEntity,
          DataDto<AcquisitionAttributionReceiptDto>>(
        '/acquisition-attributions',
        body: captureAny(named: 'body'),
        queryParameters: any(named: 'queryParameters'),
        headers: any(named: 'headers'),
        mapper: any(named: 'mapper'),
        converter: any(named: 'converter'),
        enableLocale: false,
        onSuccess: any(named: 'onSuccess'),
      ),
    ).captured.single;

    expect(body, {
      'client_event_id': 'event-1',
      'provider': 'future_mmp',
      'provider_attribution_id': 'provider-install-42',
      'campaign': 'launch',
    });
  });
}
