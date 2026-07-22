import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/daily_result/presentation/daily_result_page.dart';
import 'package:quiz/features/gamification/presentation/provider/gamification_provider.dart';

class DailyResultFlow extends ConsumerStatefulWidget {
  const DailyResultFlow({super.key});

  @override
  ConsumerState<DailyResultFlow> createState() => _DailyResultFlowState();
}

class _DailyResultFlowState extends ConsumerState<DailyResultFlow> {
  @override
  void initState() {
    super.initState();
    // The streak has just advanced with the last answer of the issue
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gamificationProvider.notifier).fetch();
    });
  }

  void _onContinue() {
    context.goNamed('quiz');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: DailyResultPage(onContinue: _onContinue),
    );
  }
}
