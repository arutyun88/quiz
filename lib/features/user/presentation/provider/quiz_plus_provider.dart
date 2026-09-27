import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/user/domain/entity/subscription_entity.dart';

final currentSubscriptionProvider = Provider<SubscriptionEntity?>((ref) {
  return ref.watch(authenticationProvider).mapOrNull(
        authenticated: (state) => state.user?.subscription,
      );
});

/// Quiz+ entitlement of the current session. Follows the authenticated user
/// profile, so it updates on login/logout and after
/// [AuthenticationNotifier.reload].
final quizPlusProvider = Provider<bool>((ref) {
  return ref.watch(currentSubscriptionProvider)?.entitlementActive ?? false;
});
