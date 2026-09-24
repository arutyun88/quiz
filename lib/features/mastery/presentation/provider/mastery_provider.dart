import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/mastery/domain/entity/mastery_entity.dart';
import 'package:quiz/features/mastery/domain/repository/mastery_repository.dart';

/// Keeps the latest snapshot between screen entries and is recreated when the
/// authenticated user changes.
final masteryProvider =
    StateNotifierProvider<MasteryNotifier, BaseState<MasteryEntity>>(
  (ref) {
    final userId = ref.watch(
      authenticationProvider.select(
        (state) => state.mapOrNull(
          authenticated: (state) => state.user?.id,
        ),
      ),
    );
    return MasteryNotifier(
      masteryRepository: getIt<MasteryRepository>(),
      autoFetch: userId != null,
    );
  },
);

class MasteryNotifier extends StateNotifier<BaseState<MasteryEntity>> {
  final MasteryRepository _masteryRepository;
  Future<bool>? _pendingFetch;

  MasteryNotifier({
    required MasteryRepository masteryRepository,
    bool autoFetch = true,
  })  : _masteryRepository = masteryRepository,
        super(BaseState.loading()) {
    if (autoFetch) fetch();
  }

  Future<bool> fetch() => _pendingFetch ??= _fetch().whenComplete(
        () => _pendingFetch = null,
      );

  Future<bool> refresh() => fetch();

  Future<bool> _fetch() async {
    final previousState = state;

    final result = await _masteryRepository.fetch();

    switch (result) {
      case ResultOk(data: final mastery):
        state = BaseState.data(mastery);
        return true;
      case ResultFailed(error: final failure):
        if (previousState is! BaseDataState) {
          state = BaseState.failed(failure);
        }
        return false;
    }
  }
}
