import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:quiz/app/core/utils/route_authenticated_user.dart';
import 'package:quiz/app/di/di.dart';
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
          ref.read(authenticationProvider).whenOrNull(
            authenticated: (user) => routeAuthenticatedUser(context, user),
            unauthenticated: (_) {
              final storage = getIt<SettingsLocalStorageService>();
              if (storage.isOnboardingSeen) {
                context.go('/');
                context.push('/login');
              } else {
                storage.markOnboardingSeen();
                context.go('/onboarding');
              }
            },
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
