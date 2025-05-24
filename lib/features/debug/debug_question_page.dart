import 'package:flutter/material.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/app/di/di.dart';

class DebugQuestionPage extends StatelessWidget {
  const DebugQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSubheaderedScaffold(
      // isScrollable: true,
      appBar: AppBar(title: Text('Debug - Questions')),
      body: StreamBuilder(
        stream: getIt<QuestionDao>().watchAllQuestions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: AppWidget.expand(child: Center(child: CircularProgressIndicator())),
            );
          }

          if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: AppWidget.expand(
                child: Center(
                  child: Text(
                    'Ошибка: \n${snapshot.error}',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            );
          }

          final data = snapshot.data;
          if (data == null || data.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: AppWidget.expand(child: const Center(child: Text('Вопросов без ответов нет'))),
            );
          }

          return CustomScrollView(
            clipBehavior: Clip.none,
            slivers: [
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              AppWidget.sliver(
                sliver: SliverList.separated(
                  itemCount: data.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) => ListTile(
                    title: Text(data[index].id),
                    subtitle: Text(data[index].question),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
