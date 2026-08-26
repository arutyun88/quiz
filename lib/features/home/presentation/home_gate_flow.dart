import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/presentation/server_start_day_flow.dart';
import 'package:quiz/features/demo/presentation/demo_start_flow.dart';

class HomeGateFlow extends ConsumerWidget {
  const HomeGateFlow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated =
        ref.watch(authenticationProvider.select((s) => s.isAuthenticated));

    return isAuthenticated ? const ServerStartDayFlow() : const DemoStartFlow();
  }
}
