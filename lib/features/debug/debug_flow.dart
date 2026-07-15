import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/database/app_database.dart';
import 'package:quiz/app/core/database/dao/answered_question_dao.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/services/settings_local_storage_service.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/question/domain/use_case/sync_cached_answers_use_case.dart';
import 'package:quiz/features/settings/presentation/widgets/settings_rows.dart';

// Dev-only screen: strings are intentionally not localized.
class DebugFlow extends StatelessWidget {
  const DebugFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Debug',
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SettingsSectionLabel(label: 'Вопросы'),
            const SizedBox(height: 10),
            SettingsRowGroup(
              children: [
                _CountRow(
                  label: 'Вопросов без ответов в БД',
                  countStream: getIt<QuestionDao>().watchQuestionsCount(),
                  onTap: () => context.goNamed('debug-questions'),
                  onClear: () => getIt<QuestionDao>().clearAllCache(),
                ),
                _CountRow(
                  label: 'Вопросов с ответами в БД',
                  countStream: getIt<AnsweredQuestionDao>().watchAnsweredQuestionsCount(),
                  onTap: () => context.goNamed('debug-answered-questions'),
                  onClear: () => getIt<AnsweredQuestionDao>().clearAllCache(),
                ),
              ],
            ),
            const SizedBox(height: 26),
            const SettingsSectionLabel(label: 'Данные'),
            const SizedBox(height: 10),
            SettingsRowGroup(
              children: [
                _ActionRow(
                  label: 'Удалить БД',
                  onTap: () => getIt<AppDatabase>().deleteDatabase(),
                ),
                _ActionRow(
                  label: 'Синхронизировать',
                  onTap: () => getIt<SyncCachedAnswersUseCase>().sync(),
                ),
                _ActionRow(
                  label: 'Сбросить онбординг',
                  onTap: () async {
                    await getIt<SettingsLocalStorageService>().resetOnboardingSeen();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Онбординг сброшен')),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CountRow extends StatelessWidget {
  const _CountRow({
    required this.label,
    required this.countStream,
    required this.onTap,
    required this.onClear,
  });

  final String label;
  final Stream<int> countStream;
  final VoidCallback onTap;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onClear,
              child: Icon(Icons.delete_outline, size: 20, color: colors.text.danger),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.spectral(fontSize: 16, color: colors.text.primary),
                  ),
                  const SizedBox(height: 2),
                  StreamBuilder(
                    stream: countStream,
                    builder: (context, snapshot) => Text(
                      snapshot.hasError ? 'ОШИБКА' : '${snapshot.data ?? '…'} ШТ',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: colors.text.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward, size: 20, color: colors.text.primary),
          ],
        ),
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            label,
            style: GoogleFonts.spectral(fontSize: 16, color: context.palette.text.primary),
          ),
        ),
      ),
    );
  }
}
