import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/mastery/domain/entity/mastery_entity.dart';
import 'package:quiz/features/mastery/domain/repository/mastery_repository.dart';

/// Refetches on every screen entry (autoDispose): mastery shifts with each
/// answered question and the topic names are locale-dependent.
final masteryProvider = StateNotifierProvider.autoDispose<MasteryNotifier, BaseState<MasteryEntity>>(
  (ref) => MasteryNotifier(masteryRepository: getIt<MasteryRepository>()),
);

class MasteryNotifier extends StateNotifier<BaseState<MasteryEntity>> {
  final MasteryRepository _masteryRepository;

  MasteryNotifier({
    required MasteryRepository masteryRepository,
  })  : _masteryRepository = masteryRepository,
        super(BaseState.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    state = BaseState.loading();

    final result = await _masteryRepository.fetch();

    switch (result) {
      case ResultOk(data: final mastery):
        state = BaseState.data(mastery);
      case ResultFailed(error: final failure):
        state = BaseState.failed(failure);
    }
  }
}
