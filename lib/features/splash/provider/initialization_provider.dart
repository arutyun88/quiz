import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';
import 'package:quiz/features/user/presentation/provider/user_statistics_provider.dart';

final initializationProvider = FutureProvider<void>((ref) async {
  await Future.microtask(() async {
    ref.listen<AuthenticationState>(
      authenticationProvider,
      (_, current) {
        if (current.isAuthenticated) {
          ref.read(userStatisticsProvider.notifier).fetch();
          ref.read(gamificationProvider.notifier).fetch();
        }
      },
    );

    await ref.read(authenticationProvider.notifier).reload();
  });
});
