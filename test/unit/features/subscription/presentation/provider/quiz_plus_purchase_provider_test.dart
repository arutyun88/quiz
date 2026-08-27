import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/features/subscription/domain/entity/quiz_plus_package_entity.dart';
import 'package:quiz/features/subscription/domain/gateway/quiz_plus_purchase_gateway.dart';
import 'package:quiz/features/subscription/presentation/provider/quiz_plus_purchase_provider.dart';

void main() {
  const package = QuizPlusPackageEntity(
    packageId: r'$rc_monthly',
    productId: 'quiz.plus.monthly',
    title: 'Quiz+ Monthly',
    description: 'Monthly access',
    price: r'$4.99',
    subscriptionPeriod: 'P1M',
  );

  test('loads only the current RevenueCat offering for the server user id',
      () async {
    final gateway = _FakePurchaseGateway(packages: const [package]);
    final notifier = _notifier(gateway);

    await notifier.load('user-1');

    expect(gateway.identifiedUserId, 'user-1');
    expect(notifier.state.packages, const [package]);
    expect(notifier.state.available, isTrue);
  });

  test('reports an unavailable build without touching offerings', () async {
    final gateway = _FakePurchaseGateway(available: false);
    final notifier = _notifier(gateway);

    await notifier.load('user-1');

    expect(notifier.state.available, isFalse);
    expect(gateway.fetchCount, 0);
  });

  test('waits for the server profile instead of granting quiz plus locally',
      () async {
    final gateway = _FakePurchaseGateway(
      packages: const [package],
      purchaseOutcome: QuizPlusPurchaseOutcome.completed,
    );
    var reloads = 0;
    var serverEntitled = false;
    final notifier = _notifier(
      gateway,
      reload: () async {
        reloads++;
        if (reloads == 2) serverEntitled = true;
      },
      entitled: () => serverEntitled,
    );
    await notifier.load('user-1');

    await notifier.purchase(package.packageId);

    expect(reloads, 2);
    expect(notifier.state.status, QuizPlusPurchaseStatus.activated);
    expect(notifier.state.processing, isFalse);
  });

  test('restore stays pending when the server has no entitlement', () async {
    final gateway = _FakePurchaseGateway(packages: const [package]);
    var reloads = 0;
    final notifier = _notifier(
      gateway,
      reload: () async => reloads++,
      entitled: () => false,
    );
    await notifier.load('user-1');

    await notifier.restore();

    expect(gateway.restoreCount, 1);
    expect(reloads, 5);
    expect(
      notifier.state.status,
      QuizPlusPurchaseStatus.restoredWithoutEntitlement,
    );
  });
}

QuizPlusPurchaseNotifier _notifier(
  QuizPlusPurchaseGateway gateway, {
  Future<void> Function()? reload,
  bool Function()? entitled,
}) =>
    QuizPlusPurchaseNotifier(
      gateway: gateway,
      reloadServerProfile: reload ?? () async {},
      isServerEntitled: entitled ?? () => false,
      delay: (_) async {},
    );

class _FakePurchaseGateway implements QuizPlusPurchaseGateway {
  _FakePurchaseGateway({
    this.available = true,
    this.packages = const [],
    this.purchaseOutcome = QuizPlusPurchaseOutcome.completed,
  });

  @override
  final bool available;
  final List<QuizPlusPackageEntity> packages;
  final QuizPlusPurchaseOutcome purchaseOutcome;
  String? identifiedUserId;
  int fetchCount = 0;
  int restoreCount = 0;

  @override
  Future<void> clearIdentity() async {}

  @override
  Future<List<QuizPlusPackageEntity>> fetchPackages() async {
    fetchCount++;
    return packages;
  }

  @override
  Future<bool> identify(String userId) async {
    identifiedUserId = userId;
    return available;
  }

  @override
  Future<QuizPlusPurchaseOutcome> purchase(String packageId) async =>
      purchaseOutcome;

  @override
  Future<void> restore() async => restoreCount++;
}
