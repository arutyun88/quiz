import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/presentation/daily_quiz_flow.dart';
import 'package:quiz/features/demo/presentation/demo_quiz_flow.dart';

class QuizGateFlow extends ConsumerWidget {
  const QuizGateFlow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(
      authenticationProvider.select((state) => state.isAuthenticated),
    );
    return isAuthenticated ? const DailyQuizFlow() : const DemoQuizFlow();
  }
}
