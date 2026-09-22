import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/mastery/domain/entity/mastery_entity.dart';
import 'package:quiz/features/mastery/domain/repository/mastery_repository.dart';

/// Refetches on every screen entry (autoDispose): mastery shifts with each
/// answered question and the topic names are locale-dependent.
final masteryProvider = StateNotifierProvider.autoDispose<MasteryNotifier,
    BaseState<MasteryEntity>>(
  (ref) => MasteryNotifier(masteryRepository: getIt<MasteryRepository>()),
);

class MasteryNotifier extends StateNotifier<BaseState<MasteryEntity>> {
  final MasteryRepository _masteryRepository;
  Future<void>? _pendingFetch;

  MasteryNotifier({
    required MasteryRepository masteryRepository,
  })  : _masteryRepository = masteryRepository,
        super(BaseState.loading()) {
    fetch();
  }

  Future<void> fetch() {
    final pendingFetch = _pendingFetch;
    if (pendingFetch != null) return pendingFetch;
    state = BaseState.loading();
    return _startFetch();
  }

  Future<void> refresh() => _pendingFetch ??= _fetch().whenComplete(
        () => _pendingFetch = null,
      );

  Future<void> _startFetch() => _pendingFetch = _fetch().whenComplete(
        () => _pendingFetch = null,
      );

  Future<void> _fetch() async {
    final previousState = state;

    final result = await _masteryRepository.fetch();

    switch (result) {
      case ResultOk(data: final mastery):
        state = BaseState.data(mastery);
      case ResultFailed(error: final failure):
        if (previousState is! BaseDataState) {
          state = BaseState.failed(failure);
        }
    }
  }
}
