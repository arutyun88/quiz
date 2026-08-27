import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/subscription/domain/entity/quiz_plus_package_entity.dart';
import 'package:quiz/features/subscription/domain/gateway/quiz_plus_purchase_gateway.dart';

enum QuizPlusPurchaseStatus {
  idle,
  cancelled,
  storePending,
  awaitingServer,
  activated,
  restoredWithoutEntitlement,
  failed,
}

class QuizPlusPurchaseState {
  const QuizPlusPurchaseState({
    this.loading = false,
    this.processing = false,
    this.available = false,
    this.packages = const [],
    this.status = QuizPlusPurchaseStatus.idle,
  });

  final bool loading;
  final bool processing;
  final bool available;
  final List<QuizPlusPackageEntity> packages;
  final QuizPlusPurchaseStatus status;

  QuizPlusPurchaseState copyWith({
    bool? loading,
    bool? processing,
    bool? available,
    List<QuizPlusPackageEntity>? packages,
    QuizPlusPurchaseStatus? status,
  }) =>
      QuizPlusPurchaseState(
        loading: loading ?? this.loading,
        processing: processing ?? this.processing,
        available: available ?? this.available,
        packages: packages ?? this.packages,
        status: status ?? this.status,
      );
}

final quizPlusPurchaseProvider = StateNotifierProvider.autoDispose<
    QuizPlusPurchaseNotifier, QuizPlusPurchaseState>((ref) {
  final authNotifier = ref.read(authenticationProvider.notifier);
  final userId = ref.read(authenticationProvider).mapOrNull(
        authenticated: (state) => state.user?.id,
      );
  final notifier = QuizPlusPurchaseNotifier(
    gateway: getIt<QuizPlusPurchaseGateway>(),
    reloadServerProfile: authNotifier.reload,
    isServerEntitled: () =>
        ref.read(authenticationProvider).mapOrNull(
              authenticated: (state) => state.user?.subscription?.active,
            ) ??
        false,
  );
  if (userId != null) unawaited(notifier.load(userId));
  return notifier;
});

class QuizPlusPurchaseNotifier extends StateNotifier<QuizPlusPurchaseState> {
  QuizPlusPurchaseNotifier({
    required QuizPlusPurchaseGateway gateway,
    required Future<void> Function() reloadServerProfile,
    required bool Function() isServerEntitled,
    Future<void> Function(Duration) delay = Future.delayed,
  })  : _gateway = gateway,
        _reloadServerProfile = reloadServerProfile,
        _isServerEntitled = isServerEntitled,
        _delay = delay,
        super(const QuizPlusPurchaseState());

  final QuizPlusPurchaseGateway _gateway;
  final Future<void> Function() _reloadServerProfile;
  final bool Function() _isServerEntitled;
  final Future<void> Function(Duration) _delay;

  Future<void> load(String userId) async {
    state = state.copyWith(loading: true, status: QuizPlusPurchaseStatus.idle);
    try {
      final available = await _gateway.identify(userId);
      if (!available) {
        state = state.copyWith(loading: false, available: false);
        return;
      }
      final packages = await _gateway.fetchPackages();
      state = state.copyWith(
        loading: false,
        available: true,
        packages: packages,
      );
    } catch (_) {
      state = state.copyWith(
        loading: false,
        available: false,
        status: QuizPlusPurchaseStatus.failed,
      );
    }
  }

  Future<void> purchase(String packageId) async {
    if (state.processing) return;
    state = state.copyWith(
      processing: true,
      status: QuizPlusPurchaseStatus.idle,
    );
    try {
      final outcome = await _gateway.purchase(packageId);
      switch (outcome) {
        case QuizPlusPurchaseOutcome.cancelled:
          state = state.copyWith(
            processing: false,
            status: QuizPlusPurchaseStatus.cancelled,
          );
        case QuizPlusPurchaseOutcome.pending:
          state = state.copyWith(
            processing: false,
            status: QuizPlusPurchaseStatus.storePending,
          );
        case QuizPlusPurchaseOutcome.completed:
          await _waitForServer(QuizPlusPurchaseStatus.awaitingServer);
      }
    } catch (_) {
      state = state.copyWith(
        processing: false,
        status: QuizPlusPurchaseStatus.failed,
      );
    }
  }

  Future<void> restore() async {
    if (state.processing) return;
    state = state.copyWith(
      processing: true,
      status: QuizPlusPurchaseStatus.idle,
    );
    try {
      await _gateway.restore();
      await _waitForServer(QuizPlusPurchaseStatus.restoredWithoutEntitlement);
    } catch (_) {
      state = state.copyWith(
        processing: false,
        status: QuizPlusPurchaseStatus.failed,
      );
    }
  }

  Future<void> _waitForServer(QuizPlusPurchaseStatus fallback) async {
    for (var attempt = 0; attempt < 5; attempt++) {
      await _reloadServerProfile();
      if (_isServerEntitled()) {
        state = state.copyWith(
          processing: false,
          status: QuizPlusPurchaseStatus.activated,
        );
        return;
      }
      if (attempt < 4) await _delay(const Duration(seconds: 2));
    }
    state = state.copyWith(processing: false, status: fallback);
  }
}
