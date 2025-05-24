import 'package:flutter/material.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/debug/debug_questions_widget.dart';

class DebugFlow extends StatelessWidget {
  const DebugFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSubheaderedScaffold(
      appBar: AppBar(title: Text('Debug')),
      body: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          DebugQuestionsWidget(),
        ],
      ),
    );
  }
}
