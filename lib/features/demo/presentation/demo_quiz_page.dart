import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/features/demo/presentation/provider/demo_provider.dart';
import 'package:quiz/features/demo/presentation/widgets/demo_hint_panel.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/answer_reveal_bottom_sheet.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_body.dart';
import 'package:quiz/features/home/presentation/widgets/quiz/quiz_state_views.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/presentation/question_answer_state.dart';
import 'package:quiz/gen/strings.g.dart';

class DemoQuizPage extends ConsumerWidget {
  const DemoQuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(demoProvider);
    _listenForReveal(context, ref);
    final palette = context.palette;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: palette.background.static,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 18, 22, 14),
                child: Row(
                  children: [
                    Text(
                      context.t.demo.quiz.header,
                      style: GoogleFonts.unbounded(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: palette.text.primary,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () => context.goNamed('home'),
                      child: Text(context.t.demo.quiz.exit),
                    ),
                  ],
                ),
              ),
              const AppDivider(indent: 22, endIndent: 22),
              Expanded(child: _body(context, ref, state)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context, WidgetRef ref, DemoState state) =>
      switch (state) {
        DemoLoadingState() => const QuizLoading(),
        DemoFailedState(:final failure) => Column(
            children: [
              Expanded(child: QuizError(failure: failure)),
              Padding(
                padding: const EdgeInsets.all(22),
                child: AppButtonV2(
                  label: context.t.demo.quiz.retry,
                  onTap: (_) => ref.read(demoProvider.notifier).bootstrap(),
                ),
              ),
            ],
          ),
        DemoCompletedState() => const DemoCompletedPage(),
        DemoActiveState() => _active(context, ref, state),
      };

  Widget _active(BuildContext context, WidgetRef ref, DemoActiveState state) {
    final answerState = _answerState(state);
    return Column(
      children: [
        Expanded(
          child: QuizBody(
            question: state.question,
            answerState: answerState,
            questionNumber: state.position,
            totalQuestions: state.total,
            onSelect: state.isSubmitting || state.reveal != null
                ? null
                : (answer) =>
                    ref.read(demoProvider.notifier).submitAnswer(answer.id),
          ),
        ),
        DemoHintPanel(
          hint: state.question.hint,
          visible: state.hintVisible,
          enabled: !state.isSubmitting && state.reveal == null,
          onShow: ref.read(demoProvider.notifier).showHint,
        ),
        if (state.failure != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
            child: AppButtonV2(
              label: context.t.demo.quiz.retry,
              onTap: (_) => ref
                  .read(demoProvider.notifier)
                  .submitAnswer(state.selectedAnswerId!),
            ),
          ),
      ],
    );
  }

  QuestionAnswerState _answerState(DemoActiveState state) {
    final answer = _selectedAnswer(state);
    final reveal = state.reveal;
    if (answer != null && reveal != null) {
      return QuestionAnswerState.sent(
        answer: answer,
        correctAnswerId: reveal.correctAnswerId,
        description: reveal.description,
        xp: 0,
      );
    }
    if (answer != null && state.isSubmitting) {
      return QuestionAnswerState.sending(answer: answer);
    }
    if (answer != null && state.failure != null) {
      return QuestionAnswerState.failed(
        answer: answer,
        failure: state.failure!,
      );
    }
    return const QuestionAnswerState.wait();
  }

  AnswerEntity? _selectedAnswer(DemoActiveState state) {
    for (final answer in state.question.answers) {
      if (answer.id == state.selectedAnswerId) return answer;
    }
    return null;
  }

  void _listenForReveal(BuildContext context, WidgetRef ref) {
    ref.listen(
      demoProvider.select(
        (state) => state is DemoActiveState ? state.reveal : null,
      ),
      (_, reveal) {
        final current = ref.read(demoProvider);
        if (reveal == null || current is! DemoActiveState) return;
        final answer = _selectedAnswer(current);
        if (answer == null) return;
        showModalBottomSheet<void>(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          isDismissible: false,
          enableDrag: false,
          backgroundColor: context.palette.bottomSheet.background,
          shape: const RoundedRectangleBorder(),
          builder: (sheetContext) => SafeArea(
            top: false,
            child: AnswerRevealBottomSheet(
              question: current.question,
              sentState: QuestionAnswerState.sent(
                answer: answer,
                correctAnswerId: reveal.correctAnswerId,
                description: reveal.description,
                xp: 0,
              ) as QuestionAnswerSentState,
              onNext: () {
                Navigator.of(sheetContext).pop();
                ref.read(demoProvider.notifier).advance();
              },
            ),
          ),
        );
      },
    );
  }
}

class DemoCompletedPage extends StatelessWidget {
  const DemoCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final t = context.t.demo.complete;
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 32, 22, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Icon(Icons.check_circle_outline,
              size: 60, color: palette.text.accent),
          const SizedBox(height: 24),
          Text(
            t.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.unbounded(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: palette.text.primary,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            t.body,
            textAlign: TextAlign.center,
            style: GoogleFonts.spectral(
              fontSize: 18,
              height: 1.45,
              color: palette.text.secondary,
            ),
          ),
          const Spacer(),
          AppButtonV2(
            label: t.create_account,
            onTap: (complete) {
              complete();
              context.pushNamed('registration');
            },
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => context.pushNamed('login'),
            child: Text(t.sign_in),
          ),
          TextButton(
            onPressed: () => context.goNamed('home'),
            child: Text(t.back),
          ),
        ],
      ),
    );
  }
}
