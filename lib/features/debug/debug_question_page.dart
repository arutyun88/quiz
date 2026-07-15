import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/debug/widgets/debug_placeholders.dart';

class DebugQuestionPage extends StatelessWidget {
  const DebugQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return AppScaffold(
      title: 'Вопросы',
      body: StreamBuilder(
        stream: getIt<QuestionDao>().watchAllQuestions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const DebugLoading();
          }

          if (snapshot.hasError) {
            return DebugMessage(text: 'Ошибка:\n${snapshot.error}');
          }

          final data = snapshot.data;
          if (data == null || data.isEmpty) {
            return const DebugMessage(text: 'Вопросов без ответов нет');
          }

          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(22, 20, 22, 32),
            itemCount: data.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: Border(
                  top: index == 0
                      ? BorderSide(color: colors.text.primary, width: 1.5)
                      : BorderSide(color: colors.divider),
                  bottom: index == data.length - 1 ? BorderSide(color: colors.divider) : BorderSide.none,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[index].id.toUpperCase(),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: colors.text.secondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data[index].question,
                    style: GoogleFonts.spectral(fontSize: 16, color: colors.text.primary),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
