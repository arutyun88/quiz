import 'package:flutter_test/flutter_test.dart';
import 'package:quiz/app/config/distribution/distribution_config.dart';
import 'package:quiz/features/ads/data/admob_rewarded_ads_gateway.dart';
import 'package:quiz/features/subscription/data/gateway/revenue_cat_quiz_plus_purchase_gateway.dart';

void main() {
  tearDown(() => DistributionConfig.setForTesting(null));

  test('China distribution disables Google commerce SDKs', () {
    DistributionConfig.setForTesting(AppDistribution.china);

    expect(AdMobRewardedAdsGateway().available, isFalse);
    expect(RevenueCatQuizPlusPurchaseGateway().available, isFalse);
  });
}
