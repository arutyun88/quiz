import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';

class HomeFlow extends ConsumerWidget {
  const HomeFlow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(
          ref.watch(authenticationProvider).when(
                authenticated: (id) => id,
                unauthenticated: (failure) => '$failure',
              ),
        ),
      ),
    );
  }
}
