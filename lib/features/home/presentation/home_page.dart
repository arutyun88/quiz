import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/widgets/app_bottom_sheet.dart';
import 'package:quiz/app/core/widgets/button/app_button.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';
import 'package:quiz/features/question/presentation/widgets/answers_widget.dart';
import 'package:quiz/features/question/presentation/widgets/question_widget.dart';
import 'package:quiz/gen/strings.g.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    _listenQuestionAnswerResult();

    return AppSubheaderedScaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Consumer(
          builder: (context, ref, child) {
            final name = ref.watch(authenticationProvider).whenOrNull(authenticated: (user) => user?.name);
            return AppBar(
              centerTitle: false,
              title: name != null ? Text(name) : null,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: QuestionWidget(),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            flex: 3,
            child: const AnswersWidget(),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  void _listenQuestionAnswerResult() {
    ref.listen(
      questionProvider.select(
        (state) => state.whenOrNull(
          data: (question, answerState) => switch (answerState) {
            QuestionAnswerSentState() => (question, answerState),
            QuestionAnswerFailedState() => (question, answerState),
            _ => null,
          },
        ),
      ),
      (prev, next) async {
        if (next == null) return;

        final (question, answerState) = next;

        switch (answerState) {
          case QuestionAnswerSentState(:final isCorrect):
            showAppBottomSheet(
              context,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  spacing: 24.0,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        isCorrect
                            ? t.question.dialog.correct
                                .header[Random().nextInt(t.question.dialog.correct.header.length)]
                            : t.question.dialog.incorrect
                                .header[Random().nextInt(t.question.dialog.correct.header.length)],
                        style: context.textStyle.body16Semibold,
                      ),
                    ),
                    Text(
                      question.description,
                      textAlign: TextAlign.start,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        textAlign: TextAlign.end,
                        isCorrect
                            ? t.question.dialog.correct
                                .prompt[Random().nextInt(t.question.dialog.correct.header.length)]
                            : t.question.dialog.incorrect
                                .prompt[Random().nextInt(t.question.dialog.correct.header.length)],
                        style: context.textStyle.body16Semibold,
                      ),
                    ),
                    AppButton(
                      onTap: context.pop,
                      child: Text(t.question.dialog.button),
                    ),
                  ],
                ),
              ),
            ).then((_) => ref.read(questionProvider.notifier).next());
          case QuestionAnswerFailedState(:final NetworkFailure failure):
            ScaffoldMessenger.of(context)
                .showSnackBar(
                  SnackBar(
                    content: Text(
                      failure.reason is NetworkFailureBadResponseReason
                          ? t.question.error_snackbar.answered_on_another_device.text
                          : t.question.error_snackbar.save_failed_retry_later.text,
                    ),
                    action: SnackBarAction(
                      label: failure.reason is NetworkFailureBadResponseReason
                          ? t.question.error_snackbar.answered_on_another_device.button
                          : t.question.error_snackbar.save_failed_retry_later.button,
                      onPressed: () {},
                      textColor: context.palette.text.primary,
                    ),
                    backgroundColor: context.palette.background.danger,
                  ),
                )
                .closed
                .then(
                  (value) => ref.read(questionProvider.notifier).next(),
                );
        }
      },
    );
  }
}
