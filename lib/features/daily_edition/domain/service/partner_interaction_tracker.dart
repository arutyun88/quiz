class PartnerInteraction {
  const PartnerInteraction({
    required this.campaignId,
    required this.attemptId,
    required this.assignmentId,
    required this.questionVersionId,
  });

  final String campaignId;
  final String attemptId;
  final String assignmentId;
  final String questionVersionId;
}

abstract interface class PartnerInteractionTracker {
  Future<void> recordImpression(PartnerInteraction interaction);

  Future<void> recordClick(PartnerInteraction interaction);
}

class NoopPartnerInteractionTracker implements PartnerInteractionTracker {
  const NoopPartnerInteractionTracker();

  @override
  Future<void> recordImpression(PartnerInteraction interaction) async {}

  @override
  Future<void> recordClick(PartnerInteraction interaction) async {}
}

abstract interface class PartnerLinkLauncher {
  bool canLaunch(String url);

  Future<bool> launch(String url);
}
