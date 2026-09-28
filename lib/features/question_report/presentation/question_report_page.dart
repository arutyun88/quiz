import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_snack_bar.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/question_report/domain/entity/question_report.dart';
import 'package:quiz/features/question_report/presentation/provider/question_report_provider.dart';
import 'package:quiz/gen/strings.g.dart';

Future<bool> openQuestionReportPage(
  BuildContext context, {
  required String attemptId,
}) async {
  final result = await context.pushNamed<bool>(
    'question-report',
    pathParameters: {'attemptId': attemptId},
  );
  if (result == true && context.mounted) {
    AppSnackBar.showNotice(
      context,
      title: context.t.question.report.success_title,
      message: context.t.question.report.success_message,
      aboveRoutes: true,
    );
  }
  return result ?? false;
}

class QuestionReportPage extends ConsumerStatefulWidget {
  const QuestionReportPage({super.key, required this.attemptId});

  final String attemptId;

  @override
  ConsumerState<QuestionReportPage> createState() => _QuestionReportPageState();
}

class _QuestionReportPageState extends ConsumerState<QuestionReportPage> {
  static const _tapSlop = 18.0;

  final TextEditingController _detailsController = TextEditingController();
  final FocusNode _detailsFocusNode = FocusNode();
  final GlobalKey _detailsFieldKey = GlobalKey();
  QuestionReportCategory? _category;
  int? _outsideTapPointer;
  Offset? _outsideTapOrigin;
  bool _outsideTapMoved = false;

  @override
  void dispose() {
    _detailsController.dispose();
    _detailsFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(questionReportProvider(widget.attemptId));
    final submitting = state is QuestionReportSubmittingState;
    final visibleFailure = switch (state) {
      QuestionReportFailedState(:final failure) => failure,
      QuestionReportSubmittingState(:final previousFailure) => previousFailure,
      _ => null,
    };
    final t = context.t.question.report;
    final palette = context.palette;
    return PopScope(
      canPop: !submitting,
      child: Listener(
        key: const ValueKey('question-report-dismiss-keyboard'),
        behavior: HitTestBehavior.translucent,
        onPointerDown: _handlePointerDown,
        onPointerMove: _handlePointerMove,
        onPointerUp: _handlePointerUp,
        onPointerCancel: _handlePointerCancel,
        child: AppScaffold(
          title: t.title,
          body: SingleChildScrollView(
            key: const ValueKey('question-report-scroll'),
            padding: const EdgeInsets.fromLTRB(22, 20, 22, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  t.subtitle,
                  style: GoogleFonts.spectral(
                    fontSize: 16,
                    height: 1.4,
                    color: palette.text.secondary,
                  ),
                ),
                const SizedBox(height: 20),
                for (final (index, category)
                    in QuestionReportCategory.values.indexed)
                  _ReportCategoryOption(
                    key: ValueKey('question-report-${category.apiValue}'),
                    label: _categoryLabel(context, category),
                    selected: _category == category,
                    enabled: !submitting,
                    isFirst: index == 0,
                    onTap: () => setState(() => _category = category),
                  ),
                const SizedBox(height: 22),
                _ReportDetailsField(
                  fieldKey: _detailsFieldKey,
                  controller: _detailsController,
                  focusNode: _detailsFocusNode,
                  enabled: !submitting,
                  label: t.details_label,
                  hint: t.details_hint,
                ),
                if (visibleFailure != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    t.error_message,
                    key: const ValueKey('question-report-error'),
                    style: GoogleFonts.spectral(
                      fontSize: 14,
                      height: 1.35,
                      color: palette.text.danger,
                    ),
                  ),
                ],
                const SizedBox(height: 22),
                AppButtonV2(
                  label: visibleFailure != null ? t.retry : t.submit,
                  onTap: _category == null ? null : (_) => _submit(_category!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit(QuestionReportCategory category) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final submitted = await ref
        .read(questionReportProvider(widget.attemptId).notifier)
        .submit(
          category: category,
          details: _detailsController.text,
          locale: LocaleSettings.instance.currentLocale.languageCode,
        );
    if (submitted && mounted) context.pop(true);
  }

  void _handlePointerDown(PointerDownEvent event) {
    _clearOutsideTap();
    if (!_detailsFocusNode.hasFocus) return;

    final renderObject =
        _detailsFieldKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderObject == null || !renderObject.hasSize) return;

    final localPosition = renderObject.globalToLocal(event.position);
    if ((Offset.zero & renderObject.size).contains(localPosition)) return;

    _outsideTapPointer = event.pointer;
    _outsideTapOrigin = event.position;
  }

  void _handlePointerMove(PointerMoveEvent event) {
    if (event.pointer != _outsideTapPointer || _outsideTapOrigin == null) {
      return;
    }
    final distanceSquared =
        (event.position - _outsideTapOrigin!).distanceSquared;
    if (distanceSquared > _tapSlop * _tapSlop) {
      _outsideTapMoved = true;
    }
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (event.pointer != _outsideTapPointer) return;
    final shouldDismiss = !_outsideTapMoved;
    _clearOutsideTap();
    if (shouldDismiss) FocusManager.instance.primaryFocus?.unfocus();
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    if (event.pointer == _outsideTapPointer) _clearOutsideTap();
  }

  void _clearOutsideTap() {
    _outsideTapPointer = null;
    _outsideTapOrigin = null;
    _outsideTapMoved = false;
  }

  String _categoryLabel(
    BuildContext context,
    QuestionReportCategory category,
  ) {
    final t = context.t.question.report;
    return switch (category) {
      QuestionReportCategory.factualError => t.factual_error,
      QuestionReportCategory.ambiguous => t.ambiguous,
      QuestionReportCategory.badTranslation => t.bad_translation,
      QuestionReportCategory.outdatedFact => t.outdated_fact,
      QuestionReportCategory.technical => t.technical,
      QuestionReportCategory.other => t.other,
    };
  }
}

class _ReportCategoryOption extends StatelessWidget {
  const _ReportCategoryOption({
    super.key,
    required this.label,
    required this.selected,
    required this.enabled,
    required this.isFirst,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final bool enabled;
  final bool isFirst;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Semantics(
      button: true,
      selected: selected,
      enabled: enabled,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: enabled
            ? () {
                HapticFeedback.selectionClick();
                onTap();
              }
            : null,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: isFirst ? palette.text.primary : palette.divider,
                width: isFirst ? 1.5 : 1,
              ),
              bottom: BorderSide(color: palette.divider),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 4),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 140),
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: selected ? palette.text.accent : Colors.transparent,
                  border: Border.all(
                    color:
                        selected ? palette.text.accent : palette.text.primary,
                    width: 1.5,
                  ),
                ),
                child: selected
                    ? Icon(
                        Icons.check,
                        size: 17,
                        color: palette.background.static,
                      )
                    : null,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.spectral(
                    fontSize: 16,
                    color:
                        enabled ? palette.text.primary : palette.text.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReportDetailsField extends StatelessWidget {
  const _ReportDetailsField({
    required this.fieldKey,
    required this.controller,
    required this.focusNode,
    required this.enabled,
    required this.label,
    required this.hint,
  });

  static const maxLength = 4000;

  final GlobalKey fieldKey;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool enabled;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return KeyedSubtree(
      key: fieldKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label.toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: palette.text.secondary,
            ),
          ),
          const SizedBox(height: 7),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: palette.text.primary, width: 1.5),
            ),
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
            child: TextField(
              key: const ValueKey('question-report-details'),
              controller: controller,
              focusNode: focusNode,
              enabled: enabled,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              textCapitalization: TextCapitalization.sentences,
              scrollPadding: const EdgeInsets.only(bottom: 96),
              minLines: 3,
              maxLines: 5,
              maxLength: maxLength,
              cursorColor: palette.text.primary,
              style: GoogleFonts.spectral(
                fontSize: 16,
                height: 1.35,
                color: palette.text.primary,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isCollapsed: true,
                counterText: '',
                hintText: hint,
                hintStyle: GoogleFonts.spectral(
                  fontSize: 16,
                  height: 1.35,
                  color: palette.text.secondary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller,
            builder: (_, value, __) => Text(
              '${value.text.characters.length}/$maxLength',
              textAlign: TextAlign.end,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 9,
                color: palette.text.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
