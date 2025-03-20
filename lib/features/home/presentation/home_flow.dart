import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';

class HomeFlow extends ConsumerWidget {
  const HomeFlow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ref.watch(authenticationProvider).map(
                    authenticated: (state) => state.id,
                    unauthenticated: (failure) => '$failure',
                  ),
            ),
            ref.watch(authenticationProvider).mapOrNull(
                      authenticated: (state) => Text(state.user?.name ?? 'user not found'),
                    ) ??
                const SizedBox(),
          ],
        ),
      ),
    );
  }
}
