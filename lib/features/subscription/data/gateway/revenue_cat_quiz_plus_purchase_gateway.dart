import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:quiz/features/subscription/domain/entity/quiz_plus_package_entity.dart';
import 'package:quiz/features/subscription/domain/gateway/quiz_plus_purchase_gateway.dart';

@LazySingleton(as: QuizPlusPurchaseGateway)
class RevenueCatQuizPlusPurchaseGateway implements QuizPlusPurchaseGateway {
  static const _iosApiKey = String.fromEnvironment(
    'REVENUECAT_IOS_PUBLIC_KEY',
  );
  static const _androidApiKey = String.fromEnvironment(
    'REVENUECAT_ANDROID_PUBLIC_KEY',
  );

  final Map<String, Package> _packages = {};

  @override
  bool get available => _apiKey != null;

  String? get _apiKey {
    if (kIsWeb) return null;
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS when _iosApiKey.isNotEmpty => _iosApiKey,
      TargetPlatform.android when _androidApiKey.isNotEmpty => _androidApiKey,
      _ => null,
    };
  }

  @override
  Future<bool> identify(String userId) async {
    final apiKey = _apiKey;
    if (apiKey == null) return false;

    if (!await Purchases.isConfigured) {
      final configuration = PurchasesConfiguration(apiKey)
        ..appUserID = userId
        ..automaticDeviceIdentifierCollectionEnabled = false;
      await Purchases.configure(configuration);
    } else if (await Purchases.appUserID != userId) {
      await Purchases.logIn(userId);
    }
    return true;
  }

  @override
  Future<void> clearIdentity() async {
    _packages.clear();
    if (!available || !await Purchases.isConfigured) return;
    if (!await Purchases.isAnonymous) await Purchases.logOut();
  }

  @override
  Future<List<QuizPlusPackageEntity>> fetchPackages() async {
    if (!available || !await Purchases.isConfigured) return const [];
    final current = (await Purchases.getOfferings()).current;
    if (current == null) return const [];

    _packages
      ..clear()
      ..addEntries(
        current.availablePackages.map(
          (package) => MapEntry(package.identifier, package),
        ),
      );
    return current.availablePackages
        .map(
          (package) => QuizPlusPackageEntity(
            packageId: package.identifier,
            productId: package.storeProduct.identifier,
            title: package.storeProduct.title,
            description: package.storeProduct.description,
            price: package.storeProduct.priceString,
            subscriptionPeriod: package.storeProduct.subscriptionPeriod,
          ),
        )
        .toList(growable: false);
  }

  @override
  Future<QuizPlusPurchaseOutcome> purchase(String packageId) async {
    final package = _packages[packageId];
    if (package == null) {
      throw StateError('RevenueCat package is no longer available');
    }
    try {
      await Purchases.purchase(PurchaseParams.package(package));
      return QuizPlusPurchaseOutcome.completed;
    } on PlatformException catch (error) {
      return switch (PurchasesErrorHelper.getErrorCode(error)) {
        PurchasesErrorCode.purchaseCancelledError =>
          QuizPlusPurchaseOutcome.cancelled,
        PurchasesErrorCode.paymentPendingError =>
          QuizPlusPurchaseOutcome.pending,
        _ => throw error,
      };
    }
  }

  @override
  Future<void> restore() async {
    if (!available || !await Purchases.isConfigured) return;
    await Purchases.restorePurchases();
  }
}
