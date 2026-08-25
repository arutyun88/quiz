import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/daily_edition/presentation/server_start_day_page.dart';

class ServerStartDayFlow extends ConsumerStatefulWidget {
  const ServerStartDayFlow({super.key});

  @override
  ConsumerState<ServerStartDayFlow> createState() => _ServerStartDayFlowState();
}

class _ServerStartDayFlowState extends ConsumerState<ServerStartDayFlow> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final timezoneId = ref.read(authenticationProvider).mapOrNull(
            authenticated: (state) => state.user?.timezoneId,
          );
      ref.read(dailyEditionProvider.notifier).bootstrap(
            timezoneId: timezoneId,
          );
    });
  }

  @override
  Widget build(BuildContext context) => const ServerStartDayPage();
}
