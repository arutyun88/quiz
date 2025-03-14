import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/splash/provider/initialization_provider.dart';

class SplashFlow extends ConsumerWidget {
  const SplashFlow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      initializationProvider,
      (_, state) => state.whenData(
        (_) {
          context.go('/');
          ref.read(authenticationProvider).whenOrNull(
                unauthenticated: (_) => context.push('/login'),
              );
        },
      ),
    );

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
