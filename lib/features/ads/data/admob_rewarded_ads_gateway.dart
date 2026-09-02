import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz/features/ads/domain/rewarded_ads_gateway.dart';

@LazySingleton(as: RewardedAdsGateway)
class AdMobRewardedAdsGateway implements RewardedAdsGateway {
  static const _androidRewardedAdUnitId = String.fromEnvironment(
    'ADMOB_ANDROID_REWARDED_AD_UNIT_ID',
  );
  static const _iosRewardedAdUnitId = String.fromEnvironment(
    'ADMOB_IOS_REWARDED_AD_UNIT_ID',
  );
  static const _androidTestRewardedAdUnitId =
      'ca-app-pub-3940256099942544/5224354917';
  static const _iosTestRewardedAdUnitId =
      'ca-app-pub-3940256099942544/1712485313';

  Future<void>? _consentInitialization;
  bool _adsInitialized = false;

  @override
  bool get available => _adUnitId != null;

  String? get _adUnitId {
    if (kIsWeb) return null;
    return switch (defaultTargetPlatform) {
      TargetPlatform.android when kDebugMode => _androidTestRewardedAdUnitId,
      TargetPlatform.iOS when kDebugMode => _iosTestRewardedAdUnitId,
      TargetPlatform.android when _androidRewardedAdUnitId.isNotEmpty =>
        _androidRewardedAdUnitId,
      TargetPlatform.iOS when _iosRewardedAdUnitId.isNotEmpty =>
        _iosRewardedAdUnitId,
      _ => null,
    };
  }

  @override
  Future<void> initializeConsent() =>
      _consentInitialization ??= _initializeConsent();

  Future<void> _initializeConsent() async {
    if (!available) return;
    final completer = Completer<void>();
    ConsentInformation.instance.requestConsentInfoUpdate(
      ConsentRequestParameters(),
      () async {
        try {
          await ConsentForm.loadAndShowConsentFormIfRequired((_) {});
          await _initializeAdsIfAllowed();
        } catch (_) {
          // Consent or SDK failures keep ads unavailable for this session.
        } finally {
          if (!completer.isCompleted) completer.complete();
        }
      },
      (_) async {
        try {
          // A previous valid consent decision can still allow requests when
          // the refresh fails. UMP remains the only consent authority.
          await _initializeAdsIfAllowed();
        } catch (_) {
          // Consent or SDK failures keep ads unavailable for this session.
        } finally {
          if (!completer.isCompleted) completer.complete();
        }
      },
    );
    await completer.future;
  }

  Future<void> _initializeAdsIfAllowed() async {
    if (_adsInitialized || !await ConsentInformation.instance.canRequestAds()) {
      return;
    }
    await MobileAds.instance.initialize();
    _adsInitialized = true;
  }

  @override
  Future<bool> privacyOptionsRequired() async {
    if (!available) return false;
    await initializeConsent();
    return await ConsentInformation.instance
            .getPrivacyOptionsRequirementStatus() ==
        PrivacyOptionsRequirementStatus.required;
  }

  @override
  Future<void> showPrivacyOptions() async {
    if (!await privacyOptionsRequired()) return;
    await ConsentForm.showPrivacyOptionsForm((_) {});
    await _initializeAdsIfAllowed();
  }

  @override
  Future<RewardedAdShowOutcome> showRewarded({
    required String userId,
    required String runId,
    required String clientEventId,
  }) async {
    final adUnitId = _adUnitId;
    if (adUnitId == null) return RewardedAdShowOutcome.unavailable;
    await initializeConsent();
    if (!await ConsentInformation.instance.canRequestAds()) {
      return RewardedAdShowOutcome.unavailable;
    }

    final loaded = Completer<RewardedAd?>();
    try {
      await RewardedAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) => loaded.complete(ad),
          onAdFailedToLoad: (_) => loaded.complete(null),
        ),
      );
    } catch (_) {
      return RewardedAdShowOutcome.failed;
    }
    final ad = await loaded.future;
    if (ad == null) return RewardedAdShowOutcome.failed;

    await ad.setServerSideOptions(
      ServerSideVerificationOptions(
        userId: userId,
        customData: '$runId:$clientEventId',
      ),
    );

    final outcome = Completer<RewardedAdShowOutcome>();
    var earned = false;
    ad.fullScreenContentCallback = FullScreenContentCallback<RewardedAd>(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        if (!outcome.isCompleted) {
          outcome.complete(
            earned
                ? RewardedAdShowOutcome.earned
                : RewardedAdShowOutcome.dismissed,
          );
        }
      },
      onAdFailedToShowFullScreenContent: (ad, _) {
        ad.dispose();
        if (!outcome.isCompleted) {
          outcome.complete(RewardedAdShowOutcome.failed);
        }
      },
    );
    try {
      await ad.show(onUserEarnedReward: (_, __) => earned = true);
      return await outcome.future;
    } catch (_) {
      await ad.dispose();
      return RewardedAdShowOutcome.failed;
    }
  }
}
