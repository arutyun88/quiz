import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/app/di/di.dart';

class DebugAnsweredQuestionPage extends StatelessWidget {
  const DebugAnsweredQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSubheaderedScaffold(
      appBar: AppBar(title: Text('Debug - Answered Questions')),
      body: StreamBuilder(
        stream: getIt<QuestionDao>().watchAnsweredQuestions(),
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
              child: AppWidget.expand(child: const Center(child: Text('Нет ответов на вопросы'))),
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
                    title: Text(data[index].question),
                    subtitle: Text(data[index].answer),
                    trailing: data[index].isCorrect
                        ? Icon(CupertinoIcons.add, color: Colors.green)
                        : Icon(CupertinoIcons.minus, color: Colors.red),
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
