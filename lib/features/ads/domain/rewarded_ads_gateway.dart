enum RewardedAdShowOutcome { earned, dismissed, failed, unavailable }

abstract interface class RewardedAdsGateway {
  bool get available;

  Future<void> initializeConsent();

  Future<bool> privacyOptionsRequired();

  Future<void> showPrivacyOptions();

  Future<RewardedAdShowOutcome> showRewarded({
    required String userId,
    required String runId,
    required String clientEventId,
  });
}
