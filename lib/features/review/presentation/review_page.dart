import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_refresh_indicator.dart';
import 'package:quiz/app/core/widgets/app_snack_bar.dart';
import 'package:quiz/app/core/widgets/app_status_banner.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/question_report/presentation/question_report_page.dart';
import 'package:quiz/features/question_report/presentation/widgets/question_report_submitted_banner.dart';
import 'package:quiz/features/review/domain/entity/review_history_entity.dart';
import 'package:quiz/features/review/presentation/provider/review_provider.dart';
import 'package:quiz/features/review/presentation/widgets/review_state_views.dart';
import 'package:quiz/gen/strings.g.dart';

class ReviewPage extends ConsumerStatefulWidget {
  const ReviewPage({super.key});

  @override
  ConsumerState<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends ConsumerState<ReviewPage> {
  ReviewPracticeStatus? _practiceStatus;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(reviewProvider.notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reviewProvider);
    ref.listen(reviewProvider, (previous, next) {
      final failure = next is ReviewDataState ? next.failure : null;
      final previousFailure =
          previous is ReviewDataState ? previous.failure : null;
      if (failure != null && failure != previousFailure) {
        AppSnackBar.showError(
          context,
          title: context.t.review.load_more_error_title,
          message: context.t.review.load_more_error_message,
        );
      }
    });

    return AppScaffold(
      title: context.t.review.title,
      trailing: _PracticeFilterMenu(
        selected: _practiceStatus,
        onChanged: _changePracticeFilter,
      ),
      body: AppRefreshIndicator(
        onRefresh: () async {
          final refreshed = await ref.read(reviewProvider.notifier).refresh();
          if (!refreshed && context.mounted) {
            AppSnackBar.showError(
              context,
              title: context.t.review.refresh_error_title,
              message: context.t.review.refresh_error_message,
            );
          }
        },
        child: switch (state) {
          ReviewLoadingState() => const ReviewLoadingView(),
          ReviewDataState(items: final items) when items.isEmpty =>
            _ReviewEmpty(
              filtered: _practiceStatus != null,
            ),
          ReviewDataState() => _ReviewHistory(
              state: state,
              onLoadMore: ref.read(reviewProvider.notifier).loadMore,
            ),
          ReviewFailedState() => ReviewErrorView(
              onRetry: ref.read(reviewProvider.notifier).fetch,
            ),
        },
      ),
    );
  }

  Future<void> _changePracticeFilter(ReviewPracticeStatus? status) async {
    final previous = _practiceStatus;
    if (previous == status) return;

    setState(() {
      _practiceStatus = status;
    });
    final loaded = await ref
        .read(reviewProvider.notifier)
        .setPracticeStatus(_practiceStatus);
    if (!mounted || loaded) return;
    setState(() {
      _practiceStatus = previous;
    });
    AppSnackBar.showError(
      context,
      title: context.t.review.refresh_error_title,
      message: context.t.review.refresh_error_message,
    );
  }
}

class _ReviewHistory extends StatefulWidget {
  const _ReviewHistory({
    required this.state,
    required this.onLoadMore,
  });

  final ReviewDataState state;
  final VoidCallback onLoadMore;

  @override
  State<_ReviewHistory> createState() => _ReviewHistoryState();
}

class _ReviewHistoryState extends State<_ReviewHistory> {
  final Map<String, ExpansibleController> _controllers = {};
  String? _expandedAttemptId;

  @override
  void didUpdateWidget(covariant _ReviewHistory oldWidget) {
    super.didUpdateWidget(oldWidget);
    final visibleIds = widget.state.items.map((item) => item.attemptId).toSet();
    final removedIds = _controllers.keys
        .where((attemptId) => !visibleIds.contains(attemptId))
        .toList();
    for (final attemptId in removedIds) {
      _controllers.remove(attemptId)?.dispose();
      if (_expandedAttemptId == attemptId) _expandedAttemptId = null;
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  ExpansibleController _controllerFor(String attemptId) =>
      _controllers.putIfAbsent(attemptId, ExpansibleController.new);

  void _handleExpansionChanged(String attemptId, bool expanded) {
    if (!expanded) {
      if (_expandedAttemptId == attemptId) _expandedAttemptId = null;
      return;
    }

    final previousAttemptId = _expandedAttemptId;
    _expandedAttemptId = attemptId;
    if (previousAttemptId != null && previousAttemptId != attemptId) {
      _controllers[previousAttemptId]?.collapse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.review;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 32),
      children: [
        const _InfoBanner(),
        const SizedBox(height: 14),
        Text(
          t.total(n: widget.state.total).toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            color: context.palette.text.secondary,
          ),
        ),
        const SizedBox(height: 8),
        for (final item in widget.state.items)
          _ReviewCard(
            item: item,
            controller: _controllerFor(item.attemptId),
            onExpansionChanged: (expanded) =>
                _handleExpansionChanged(item.attemptId, expanded),
          ),
        if (widget.state.hasMore)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: _OutlineAction(
              label: t.load_more,
              loading: widget.state.isLoadingMore,
              onTap: widget.onLoadMore,
            ),
          ),
      ],
    );
  }
}

class _ReviewEmpty extends StatelessWidget {
  const _ReviewEmpty({required this.filtered});

  final bool filtered;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(22, 16, 22, 0),
          sliver: SliverToBoxAdapter(child: _InfoBanner()),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 24, 32, 48),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.text.primary),
                    ),
                    child: Icon(
                      Icons.fact_check_outlined,
                      size: 30,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    filtered
                        ? context.t.review.filter_empty_title
                        : context.t.review.empty_title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.unbounded(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    filtered
                        ? context.t.review.filter_empty_message
                        : context.t.review.empty_message,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.spectral(
                      fontSize: 18,
                      color: colors.text.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum _PracticeFilter { all, none, queued, completed }

class _PracticeFilterMenu extends StatelessWidget {
  const _PracticeFilterMenu({required this.selected, required this.onChanged});

  final ReviewPracticeStatus? selected;
  final ValueChanged<ReviewPracticeStatus?> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.review;
    final active = selected != null;
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: PopupMenuButton<_PracticeFilter>(
        key: const ValueKey('review-filter-button'),
        tooltip: t.filter_open,
        color: colors.card.background,
        elevation: 0,
        offset: const Offset(0, 42),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: colors.card.border),
        ),
        onSelected: (filter) => onChanged(filter.status),
        itemBuilder: (context) => [
          _filterItem(
            context,
            filter: _PracticeFilter.all,
            label: t.filter_all,
          ),
          _filterItem(
            context,
            filter: _PracticeFilter.none,
            label: t.filter_none,
          ),
          _filterItem(
            context,
            filter: _PracticeFilter.queued,
            label: t.filter_queued,
          ),
          _filterItem(
            context,
            filter: _PracticeFilter.completed,
            label: t.filter_completed,
          ),
        ],
        child: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: active ? colors.text.accent : Colors.transparent,
            border: Border.all(
              color: active ? colors.text.accent : colors.text.primary,
              width: 1.5,
            ),
          ),
          child: Icon(
            Icons.filter_list,
            size: 19,
            color: active ? colors.background.static : colors.text.primary,
          ),
        ),
      ),
    );
  }

  PopupMenuItem<_PracticeFilter> _filterItem(
    BuildContext context, {
    required _PracticeFilter filter,
    required String label,
  }) {
    final colors = context.palette;
    final isSelected = filter.status == selected;
    return PopupMenuItem(
      key: ValueKey('review-filter-${filter.name}'),
      value: filter,
      height: 42,
      child: Row(
        children: [
          SizedBox(
            width: 22,
            child: isSelected
                ? Icon(Icons.check, size: 17, color: colors.text.accent)
                : null,
          ),
          const SizedBox(width: 8),
          Text(
            label.toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 9,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.7,
              color: isSelected ? colors.text.accent : colors.text.primary,
            ),
          ),
        ],
      ),
    );
  }
}

extension on _PracticeFilter {
  ReviewPracticeStatus? get status => switch (this) {
        _PracticeFilter.all => null,
        _PracticeFilter.none => ReviewPracticeStatus.none,
        _PracticeFilter.queued => ReviewPracticeStatus.queued,
        _PracticeFilter.completed => ReviewPracticeStatus.completed,
      };
}

class _InfoBanner extends StatelessWidget {
  const _InfoBanner();

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: context.palette.card.background,
          border: Border.all(color: context.palette.card.border),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
        child: Row(
          children: [
            Icon(Icons.history, size: 18, color: context.palette.text.accent),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                context.t.review.info_banner.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  height: 1.4,
                  color: context.palette.text.secondary,
                ),
              ),
            ),
          ],
        ),
      );
}

class _ReviewCard extends ConsumerStatefulWidget {
  const _ReviewCard({
    required this.item,
    required this.controller,
    required this.onExpansionChanged,
  });

  final ReviewHistoryItemEntity item;
  final ExpansibleController controller;
  final ValueChanged<bool> onExpansionChanged;

  @override
  ConsumerState<_ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends ConsumerState<_ReviewCard> {
  final GlobalKey _cardKey = GlobalKey();
  bool _practiceRequestInFlight = false;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final t = context.t.review;
    final colors = context.palette;
    if (item.contentRedacted) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(border: Border.all(color: colors.divider)),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(Icons.lock_outline, size: 18, color: colors.text.secondary),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                t.content_redacted,
                style: GoogleFonts.spectral(
                  fontSize: 15,
                  color: colors.text.secondary,
                ),
              ),
            ),
          ],
        ),
      );
    }

    final completedBackground = Color.alphaBlend(
      colors.answer.successMint.withValues(alpha: 0.14),
      colors.card.background,
    );
    final cardBackground = switch ((item.practiceStatus, _isExpanded)) {
      (ReviewPracticeStatus.completed, _) => completedBackground,
      (ReviewPracticeStatus.none, false) => colors.card.background,
      _ => colors.background.static,
    };

    return AnimatedContainer(
      key: _cardKey,
      duration: kThemeAnimationDuration,
      curve: Curves.easeOutCubic,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: cardBackground,
        border: Border.all(color: colors.card.border),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: ExpansionTile(
          controller: widget.controller,
          onExpansionChanged: _handleExpansionChanged,
          shape: const Border(),
          collapsedShape: const Border(),
          tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          title: Text(
            item.question ?? '',
            style: GoogleFonts.spectral(
              fontSize: 16,
              height: 1.3,
              color: colors.text.primary,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              '${item.topic ?? ''} · ${item.editionDate} · ${_versionLabel(context, item.versionStatus)}'
                  .toUpperCase(),
              style: GoogleFonts.jetBrainsMono(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: colors.text.secondary,
              ),
            ),
          ),
          children: [
            _AnswerLine(
              label: t.your_answer,
              value: item.action == 'SKIP' ? t.skipped : item.answer,
              color: colors.text.danger,
            ),
            _AnswerLine(
              label: t.correct_answer,
              value: item.correctAnswer,
              color: colors.answer.success,
            ),
            if (item.description != null)
              _TextBlock(label: t.explanation, value: item.description!),
            if (item.hintUsed && item.hint != null)
              _TextBlock(label: t.used_hint, value: item.hint!),
            const SizedBox(height: 14),
            if (item.reportSubmitted)
              QuestionReportSubmittedBanner(status: item.reportStatus)
            else
              _OutlineAction(
                label: context.t.question.report.action,
                onTap: _openReport,
              ),
            const SizedBox(height: 8),
            switch (item.practiceStatus) {
              ReviewPracticeStatus.queued => AppStatusBanner(
                  key: const ValueKey('practice-queued'),
                  title: t.practice_queued_title,
                  message: t.practice_queued_message,
                  color: colors.progress,
                ),
              ReviewPracticeStatus.completed => AppStatusBanner(
                  key: const ValueKey('practice-completed'),
                  title: t.practice_completed_title,
                  message: t.practice_completed_message,
                  color: colors.answer.success,
                ),
              ReviewPracticeStatus.none => _OutlineAction(
                  key: const ValueKey('practice-action'),
                  label: t.practice_cta,
                  loading: _practiceRequestInFlight,
                  onTap: _openPractice,
                ),
            },
          ],
        ),
      ),
    );
  }

  void _handleExpansionChanged(bool expanded) {
    if (mounted) setState(() => _isExpanded = expanded);
    widget.onExpansionChanged(expanded);
    if (expanded) _revealCardBottom();
  }

  Future<void> _revealCardBottom() async {
    await Future<void>.delayed(kThemeAnimationDuration);
    await WidgetsBinding.instance.endOfFrame;
    if (!mounted || !widget.controller.isExpanded) return;
    final cardContext = _cardKey.currentContext;
    if (cardContext == null || !cardContext.mounted) return;
    await Scrollable.ensureVisible(
      cardContext,
      duration: kThemeAnimationDuration,
      curve: Curves.easeOutCubic,
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
    );
  }

  Future<void> _openPractice() async {
    if (_practiceRequestInFlight) return;
    setState(() => _practiceRequestInFlight = true);
    try {
      final marked = await ref
          .read(reviewProvider.notifier)
          .requestPractice(widget.item.attemptId);
      if (!mounted) return;
      if (!marked) _showPracticeError();
    } finally {
      if (mounted) setState(() => _practiceRequestInFlight = false);
    }
  }

  Future<void> _openReport() async {
    final submitted = await openQuestionReportPage(
      context,
      attemptId: widget.item.attemptId,
    );
    if (!mounted || !submitted) return;
    ref
        .read(reviewProvider.notifier)
        .markReportSubmitted(widget.item.attemptId);
  }

  void _showPracticeError() {
    if (!mounted) return;
    AppSnackBar.showError(
      context,
      title: context.t.review.practice_error_title,
      message: context.t.review.practice_error_message,
    );
  }
}

class _AnswerLine extends StatelessWidget {
  const _AnswerLine(
      {required this.label, required this.value, required this.color});

  final String label;
  final String? value;
  final Color color;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 108,
              child: Text(
                label.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: context.palette.text.secondary,
                ),
              ),
            ),
            Expanded(
              child: Text(
                value ?? '—',
                style: GoogleFonts.spectral(fontSize: 15, color: color),
              ),
            ),
          ],
        ),
      );
}

class _TextBlock extends StatelessWidget {
  const _TextBlock({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              label.toUpperCase(),
              style: GoogleFonts.jetBrainsMono(
                fontSize: 8,
                fontWeight: FontWeight.w600,
                color: context.palette.text.secondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.spectral(
                fontSize: 15,
                height: 1.35,
                color: context.palette.text.primary,
              ),
            ),
          ],
        ),
      );
}

class _OutlineAction extends StatelessWidget {
  const _OutlineAction({
    super.key,
    required this.label,
    required this.onTap,
    this.loading = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: loading ? null : onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.palette.text.primary, width: 1.5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          alignment: Alignment.center,
          child: loading
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: context.palette.text.primary,
                  ),
                )
              : Text(
                  label.toUpperCase(),
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: context.palette.text.primary,
                  ),
                ),
        ),
      );
}

String _versionLabel(BuildContext context, ReviewVersionStatus status) =>
    switch (status) {
      ReviewVersionStatus.current => context.t.review.version_current,
      ReviewVersionStatus.updated => context.t.review.version_updated,
      ReviewVersionStatus.withdrawn => context.t.review.version_withdrawn,
      ReviewVersionStatus.unknown => context.t.review.version_unknown,
    };
