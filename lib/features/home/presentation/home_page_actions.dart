import 'package:flutter/widgets.dart';
import 'package:quiz/features/question/domain/entity/answer_entity.dart';

class HomePageActions {
  const HomePageActions({
    required this.onSelect,
    required this.onNext,
    required this.onIssueComplete,
  });

  final void Function(AnswerEntity answer) onSelect;
  final VoidCallback onNext;
  final VoidCallback onIssueComplete;
}

class HomePageActionsScope extends InheritedWidget {
  const HomePageActionsScope({
    super.key,
    required this.actions,
    required super.child,
  });

  final HomePageActions actions;

  static HomePageActions of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<HomePageActionsScope>();
    assert(scope != null, 'No HomePageActionsScope found in context');
    return scope!.actions;
  }

  @override
  bool updateShouldNotify(HomePageActionsScope oldWidget) => actions != oldWidget.actions;
}
