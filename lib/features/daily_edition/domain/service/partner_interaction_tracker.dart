class PartnerInteraction {
  const PartnerInteraction({
    required this.campaignId,
    required this.attemptId,
  });

  final String campaignId;
  final String attemptId;
}

abstract interface class PartnerInteractionTracker {
  Future<void> recordImpression(PartnerInteraction interaction);

  Future<void> recordClick(PartnerInteraction interaction);
}

abstract interface class PartnerLinkLauncher {
  bool canLaunch(String url);

  Future<bool> launch(String url);
}
