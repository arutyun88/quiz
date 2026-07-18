import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';

/// Quiz+ entitlement of the current session. Follows the authenticated user
/// profile, so it updates on login/logout and after
/// [AuthenticationNotifier.reload].
final quizPlusProvider = Provider<bool>((ref) {
  final user = ref.watch(authenticationProvider).mapOrNull(authenticated: (state) => state.user);

  return user?.subscription?.active ?? false;
});
