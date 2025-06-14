import 'package:flutter/material.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/debug/debug_questions_widget.dart';
import 'package:quiz/features/question/domain/use_case/sync_cached_answers_use_case.dart';

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
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          SliverToBoxAdapter(
            child: AppWidget(
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Удалить БД'),
                    onTap: () => getIt<AppDatabase>().deleteDatabase(),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Синхронизировать'),
                    onTap: () => getIt<SyncCachedAnswersUseCase>().sync(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
