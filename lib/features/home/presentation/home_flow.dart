import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/features/home/presentation/home_page_actions.dart';
import 'package:quiz/features/home/presentation/home_page.dart';
import 'package:quiz/features/home/presentation/provider/daily_question_progress_provider.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class HomeFlow extends ConsumerStatefulWidget {
  const HomeFlow({super.key});

  @override
  ConsumerState<HomeFlow> createState() => _HomeFlowState();
}

class _HomeFlowState extends ConsumerState<HomeFlow> {
  void _onNext() {
    ref.invalidate(dailyQuestionProgressProvider);
    ref.read(questionProvider.notifier).next();
  }

  void _onSelect(AnswerEntity answer) {
    ref.read(questionProvider.notifier).select(answer);
  }

  @override
  Widget build(BuildContext context) {
    _listenAnswerFailed();

    return HomePageActionsScope(
      actions: HomePageActions(
        onSelect: _onSelect,
        onNext: _onNext,
      ),
      child: const HomePage(),
    );
  }

  void _listenAnswerFailed() {
    ref.listen(
      questionProvider.select((s) => s.maybeWhen(
            data: (_, ans) => ans is QuestionAnswerFailedState ? ans : null,
            orElse: () => null,
          )),
      (_, failed) {
        if (failed == null) return;
        final t = context.t.question;
        final text = switch (failed.failure) {
          QuestionFailure f
              when f.reason is QuestionFailureAlreadySavedReason =>
            t.error_snackbar.already_answered.text,
          NetworkFailure f when f.reason is NetworkFailureBadResponseReason =>
            t.error_snackbar.answered_on_another_device.text,
          _ => t.error_snackbar.save_failed_retry_later.text,
        };
        final button = switch (failed.failure) {
          QuestionFailure f
              when f.reason is QuestionFailureAlreadySavedReason =>
            t.error_snackbar.already_answered.button,
          NetworkFailure f when f.reason is NetworkFailureBadResponseReason =>
            t.error_snackbar.answered_on_another_device.button,
          _ => t.error_snackbar.save_failed_retry_later.button,
        };
        ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(
                content: Text(text),
                action: SnackBarAction(
                  label: button,
                  onPressed: () {},
                  textColor: context.palette.text.primary,
                ),
                backgroundColor: context.palette.background.danger,
              ),
            )
            .closed
            .then((_) => _onNext());
      },
    );
  }
}
