import 'package:quiz/features/attribution/domain/entity/acquisition_attribution_entity.dart';

/// Boundary for a future consent-aware MMP adapter.
///
/// The adapter must keep the same client event ID until [acknowledge] is called.
/// It must return `null` when consent or an attribution signal is unavailable.
abstract interface class AcquisitionAttributionSource {
  Future<AcquisitionAttributionSignalEntity?> readPending();

  Future<void> acknowledge(String clientEventId);
}
