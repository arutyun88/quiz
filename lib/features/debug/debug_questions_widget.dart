import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/di/di.dart';

class DebugQuestionsWidget extends StatelessWidget {
  const DebugQuestionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppWidget.sliver(
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            sliver: SliverToBoxAdapter(
              child: Text('Questions', style: context.textStyle.heading18Bold),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            sliver: SliverToBoxAdapter(
              child: ListTile(
                onTap: () => context.goNamed('debug-questions'),
                leading: IconButton(
                  onPressed: () => getIt<QuestionDao>().clearAllCache(),
                  icon: Icon(Icons.delete),
                ),
                contentPadding: EdgeInsets.zero,
                title: Text('Вопросов без ответов в БД'),
                subtitle: StreamBuilder(
                  stream: getIt<QuestionDao>().watchQuestionsCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Text('Ошибка получения данных');
                    }

                    final count = snapshot.data ?? 0;

                    return Text('$count шт');
                  },
                ),
                trailing: Icon(Icons.navigate_next, color: context.palette.text.secondary),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            sliver: SliverToBoxAdapter(
              child: ListTile(
                onTap: () => context.goNamed('debug-answered-questions'),
                leading: IconButton(
                  onPressed: () => getIt<QuestionDao>().clearAllCache(),
                  icon: Icon(Icons.delete),
                ),
                contentPadding: EdgeInsets.zero,
                title: Text('Вопросов c ответами в БД'),
                subtitle: StreamBuilder(
                  stream: getIt<QuestionDao>().watchAnsweredQuestionsCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Text('Ошибка получения данных');
                    }

                    final count = snapshot.data ?? 0;

                    return Text('$count шт');
                  },
                ),
                trailing: Icon(Icons.navigate_next, color: context.palette.text.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
