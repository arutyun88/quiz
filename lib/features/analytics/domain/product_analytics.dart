abstract interface class ProductAnalytics {
  bool get enabled;

  Future<void> initialize();

  Future<void> identify(String userId);

  Future<void> resetIdentity();

  Future<void> screen(String routeName);

  Future<void> capture(
    ProductAnalyticsEvent event, {
    Map<String, Object> properties = const {},
  });
}

enum ProductAnalyticsEvent {
  dailyEditionOpened,
  dailyAttemptAccepted,
  dailySummaryViewed,
  rewardedAdFinished,
  quizPlusPurchaseFinished,
}

extension ProductAnalyticsEventWireName on ProductAnalyticsEvent {
  String get wireName => switch (this) {
        ProductAnalyticsEvent.dailyEditionOpened => 'daily edition opened',
        ProductAnalyticsEvent.dailyAttemptAccepted => 'daily attempt accepted',
        ProductAnalyticsEvent.dailySummaryViewed => 'daily summary viewed',
        ProductAnalyticsEvent.rewardedAdFinished => 'rewarded ad finished',
        ProductAnalyticsEvent.quizPlusPurchaseFinished =>
          'quiz plus purchase finished',
      };
}
