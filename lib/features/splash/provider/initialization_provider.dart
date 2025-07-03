import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';
import 'package:quiz/features/sync/presentation/provider/sync_provider.dart';
import 'package:quiz/features/user/presentation/provider/user_statistics_provider.dart';

final initializationProvider = FutureProvider<void>((ref) async {
  await Future.microtask(() async {
    ref.listen<AuthenticationState>(
      authenticationProvider,
      (_, current) {
        if (current.isAuthenticated) {
          ref.read(userStatisticsProvider.notifier).fetch();
          ref.read(syncProvider.notifier).sync();
        }
      },
    );

    await ref.read(authenticationProvider.notifier).reload();
    ref.read(questionProvider.notifier).fetch();
  });
});
