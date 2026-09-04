import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/daily_edition/presentation/server_start_day_page.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';

class ServerStartDayFlow extends ConsumerStatefulWidget {
  const ServerStartDayFlow({super.key});

  @override
  ConsumerState<ServerStartDayFlow> createState() => _ServerStartDayFlowState();
}

class _ServerStartDayFlowState extends ConsumerState<ServerStartDayFlow> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final timezoneId = ref.read(authenticationProvider).mapOrNull(
            authenticated: (state) => state.user?.timezoneId,
          );
      await ref.read(dailyEditionProvider.notifier).bootstrap(
        timezoneId: timezoneId,
      );
      if (!mounted) return;
      await ref.read(gamificationProvider.notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) => const ServerStartDayPage();
}
