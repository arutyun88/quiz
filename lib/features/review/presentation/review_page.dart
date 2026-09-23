import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_refresh_indicator.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/app_snack_bar.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/daily_edition/presentation/provider/daily_edition_provider.dart';
import 'package:quiz/features/review/domain/entity/review_history_entity.dart';
import 'package:quiz/features/review/presentation/provider/review_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reviewProvider);
    return AppScaffold(
      title: context.t.review.title,
      body: AppRefreshIndicator(
        onRefresh: ref.read(reviewProvider.notifier).refresh,
        child: switch (state) {
          ReviewLoadingState() => const _ReviewLoading(),
          ReviewDataState() => _ReviewHistory(
              state: state,
              onLoadMore: ref.read(reviewProvider.notifier).loadMore,
            ),
          ReviewFailedState() => _ReviewError(
              onRetry: ref.read(reviewProvider.notifier).fetch,
            ),
        },
      ),
    );
  }
}

class _ReviewHistory extends StatefulWidget {
  const _ReviewHistory({required this.state, required this.onLoadMore});

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

  void _collapse(String attemptId) {
    _controllers[attemptId]?.collapse();
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
        if (widget.state.items.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: Text(
              t.empty,
              textAlign: TextAlign.center,
              style: GoogleFonts.spectral(
                fontSize: 17,
                color: context.palette.text.primary,
              ),
            ),
          )
        else ...[
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
              onPracticeCompleted: () => _collapse(item.attemptId),
            ),
        ],
        if (widget.state.hasMore)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: _OutlineAction(
              label: t.load_more,
              loading: widget.state.isLoadingMore,
              onTap: widget.onLoadMore,
            ),
          ),
        if (widget.state.failure != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              t.load_more_error,
              textAlign: TextAlign.center,
              style: GoogleFonts.spectral(
                fontSize: 14,
                color: context.palette.text.danger,
              ),
            ),
          ),
      ],
    );
  }
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
    required this.onPracticeCompleted,
  });

  final ReviewHistoryItemEntity item;
  final ExpansibleController controller;
  final ValueChanged<bool> onExpansionChanged;
  final VoidCallback onPracticeCompleted;

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

    final cardBackground = switch ((item.practiceRequested, _isExpanded)) {
      (false, false) => colors.card.background,
      (false, true) => colors.background.static,
      (true, false) => colors.background.static,
      (true, true) => colors.background.static,
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
            if (!item.practiceRequested) ...[
              const SizedBox(height: 14),
              _OutlineAction(
                label: t.practice_cta,
                loading: _practiceRequestInFlight,
                onTap: _openPractice,
              ),
            ],
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
      if (!widget.item.practiceRequested) {
        final marked = await ref
            .read(reviewProvider.notifier)
            .requestPractice(widget.item.attemptId);
        if (!mounted) return;
        if (!marked) {
          widget.onPracticeCompleted();
          _showPracticeError();
          return;
        }
      }

      final timezoneId = ref.read(authenticationProvider).mapOrNull(
            authenticated: (state) => state.user?.timezoneId,
          );
      final result = await ref
          .read(dailyEditionProvider.notifier)
          .bootstrapReviewReplacement(
            sourceAttemptId: widget.item.attemptId,
            timezoneId: timezoneId,
          );
      if (!mounted) return;
      if (result != ReviewReplacementBootstrapResult.busy) {
        widget.onPracticeCompleted();
      }

      switch (result) {
        case ReviewReplacementBootstrapResult.opened:
          context.goNamed('quiz');
        case ReviewReplacementBootstrapResult.queued:
          AppSnackBar.showNotice(
            context,
            title: context.t.review.queued_title,
            message: context.t.review.queued_message,
          );
        case ReviewReplacementBootstrapResult.failed:
          _showPracticeError();
        case ReviewReplacementBootstrapResult.busy:
          break;
      }
    } finally {
      if (mounted) setState(() => _practiceRequestInFlight = false);
    }
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

class _ReviewLoading extends StatelessWidget {
  const _ReviewLoading();

  @override
  Widget build(BuildContext context) => AppShimmer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(22, 16, 22, 32),
          children: [
            Container(height: 44, color: context.palette.background.dynamic),
            const SizedBox(height: 14),
            for (var i = 0; i < 4; i++) ...[
              Container(height: 82, color: context.palette.background.dynamic),
              const SizedBox(height: 10),
            ],
          ],
        ),
      );
}

class _ReviewError extends StatelessWidget {
  const _ReviewError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(22, 28, 22, 24),
        children: [
          Text(
            context.t.review.error,
            textAlign: TextAlign.center,
            style: GoogleFonts.spectral(
              fontSize: 17,
              color: context.palette.text.primary,
            ),
          ),
          const SizedBox(height: 16),
          _OutlineAction(label: context.t.review.retry, onTap: onRetry),
        ],
      );
}
