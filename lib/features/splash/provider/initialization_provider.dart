import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';

final initializationProvider = FutureProvider<void>((ref) async {
  await Future.microtask(() async {
    await ref.read(authenticationProvider.notifier).reload();
  });
});
