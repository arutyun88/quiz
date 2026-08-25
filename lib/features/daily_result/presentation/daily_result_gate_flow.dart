import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_result/presentation/daily_result_flow.dart';
import 'package:quiz/features/daily_result/presentation/server_daily_result_flow.dart';

class DailyResultGateFlow extends ConsumerWidget {
  const DailyResultGateFlow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(
      authenticationProvider.select((state) => state.isAuthenticated),
    );
    return isAuthenticated
        ? const ServerDailyResultFlow()
        : const DailyResultFlow();
  }
}
