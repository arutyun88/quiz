import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
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
      body: switch (state) {
        ReviewLoadingState() => const _ReviewLoading(),
        ReviewDataState() => _ReviewHistory(
            state: state,
            onLoadMore: ref.read(reviewProvider.notifier).loadMore,
          ),
        ReviewFailedState() => _ReviewError(
            onRetry: ref.read(reviewProvider.notifier).fetch,
          ),
      },
    );
  }
}

class _ReviewHistory extends StatelessWidget {
  const _ReviewHistory({required this.state, required this.onLoadMore});

  final ReviewDataState state;
  final VoidCallback onLoadMore;

  @override
  Widget build(BuildContext context) {
    final t = context.t.review;
    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 32),
      children: [
        const _InfoBanner(),
        const SizedBox(height: 14),
        if (state.items.isEmpty)
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
            t.total(n: state.total).toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 9,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: context.palette.text.secondary,
            ),
          ),
          const SizedBox(height: 8),
          for (final item in state.items) _ReviewCard(item: item),
        ],
        if (state.hasMore)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: _OutlineAction(
              label: t.load_more,
              loading: state.isLoadingMore,
              onTap: onLoadMore,
            ),
          ),
        if (state.failure != null)
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

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.item});

  final ReviewHistoryItemEntity item;

  @override
  Widget build(BuildContext context) {
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

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: colors.card.background,
        border: Border.all(color: colors.card.border),
      ),
      child: ExpansionTile(
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
          _OutlineAction(
            label: t.practice_cta,
            onTap: () => context.goNamed(
              'quiz',
              queryParameters: {'reviewAttemptId': item.attemptId},
            ),
          ),
        ],
      ),
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
