import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/presentation/daily_quiz_page.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';

class DailyQuizFlow extends ConsumerStatefulWidget {
  const DailyQuizFlow({super.key});

  @override
  ConsumerState<DailyQuizFlow> createState() => _DailyQuizFlowState();
}

class _DailyQuizFlowState extends ConsumerState<DailyQuizFlow> {
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
  Widget build(BuildContext context) => const DailyQuizPage();
}
