import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/attribution/data/converter/acquisition_attribution_converter.dart';
import 'package:quiz/features/attribution/data/dto/acquisition_attribution_dto.dart';
import 'package:quiz/features/attribution/domain/entity/acquisition_attribution_entity.dart';

void main() {
  test('encodes the exact provider-agnostic server contract', () {
    final dto = const AcquisitionAttributionSignalEntity(
      clientEventId: 'event-1',
      provider: 'future_mmp',
      providerAttributionId: 'provider-install-42',
      source: 'network',
      campaign: 'launch',
      adGroup: 'quiz-curious',
      creative: 'video-01',
      attributionModel: 'last_click',
      attributedAt: null,
    ).toDto();

    expect(dto.toJson(), {
      'client_event_id': 'event-1',
      'provider': 'future_mmp',
      'provider_attribution_id': 'provider-install-42',
      'source': 'network',
      'campaign': 'launch',
      'ad_group': 'quiz-curious',
      'creative': 'video-01',
      'attribution_model': 'last_click',
    });
  });

  test('normalizes attributed time to UTC and omits unavailable dimensions',
      () {
    final dto = AcquisitionAttributionSignalEntity(
      clientEventId: 'event-1',
      provider: 'future_mmp',
      providerAttributionId: 'provider-install-42',
      attributedAt: DateTime.parse('2026-08-27T15:15:30+05:00'),
    ).toDto();

    expect(dto.toJson(), {
      'client_event_id': 'event-1',
      'provider': 'future_mmp',
      'provider_attribution_id': 'provider-install-42',
      'attributed_at': '2026-08-27T10:15:30.000Z',
    });
  });

  test('decodes the authoritative server receipt', () {
    final receipt = AcquisitionAttributionReceiptDto.fromJson({
      'attribution_id': 'attribution-1',
      'client_event_id': 'event-1',
    }).toEntity();

    expect(receipt.attributionId, 'attribution-1');
    expect(receipt.clientEventId, 'event-1');
  });
}
