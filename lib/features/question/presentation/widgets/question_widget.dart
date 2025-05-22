import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/features/question/presentation/provider/question_provider.dart';

class QuestionWidget extends ConsumerWidget {
  const QuestionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(questionProvider).maybeWhen(
          data: (question, answersState) => AppWidget(
            child: SizedBox.expand(
              child: Center(
                child: Text(
                  question.question,
                  style: context.textStyle.heading18Bold,
                ),
              ),
            ),
          ),
          orElse: () => AppShimmer(child: AppWidget.expand()),
        );
  }
}
