import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/review/domain/entity/review_queue_entity.dart';
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
        BaseLoadingState() => const _ReviewLoading(),
        BaseDataState(:final data) => _ReviewView(queue: data),
        _ => _ReviewError(onRetry: () => ref.read(reviewProvider.notifier).fetch()),
      },
    );
  }
}

class _ReviewView extends StatelessWidget {
  const _ReviewView({required this.queue});

  final ReviewQueueEntity queue;

  @override
  Widget build(BuildContext context) {
    final t = context.t.review;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(22, 16, 22, 8),
            children: [
              const _InfoBanner(),
              if (queue.queued.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Text(
                    t.empty,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.spectral(fontSize: 17, color: context.palette.text.primary),
                  ),
                )
              else ...[
                const SizedBox(height: 14),
                for (var i = 0; i < queue.queued.length; i++)
                  _ReviewRow(
                    item: queue.queued[i],
                    isFirst: i == 0,
                    isLast: i == queue.queued.length - 1,
                  ),
              ],
              if (queue.queuedTotal > 0 || queue.masteredTotal > 0) _CountersBlock(queue: queue),
            ],
          ),
        ),
        const _Footer(),
      ],
    );
  }
}

class _InfoBanner extends StatelessWidget {
  const _InfoBanner();

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Container(
      color: colors.background.dynamic,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
      child: Row(
        children: [
          Icon(Icons.lock_clock, size: 18, color: colors.text.accent),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              context.t.review.info_banner.toUpperCase(),
              style: GoogleFonts.jetBrainsMono(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                height: 1.4,
                color: colors.text.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  const _ReviewRow({
    required this.item,
    required this.isFirst,
    required this.isLast,
  });

  final ReviewItemEntity item;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.review;
    final progressLabel =
        item.correctCount > 0 ? t.mastered_times(n: item.correctCount) : t.wrong_times(n: item.wrongCount);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: isFirst ? BorderSide(color: colors.text.primary, width: 1.5) : BorderSide(color: colors.divider),
          bottom: isLast ? BorderSide(color: colors.divider) : BorderSide.none,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
      child: Row(
        children: [
          SizedBox(
            width: 54,
            child: Column(
              children: [
                Text(
                  t.due_days(n: item.dueInDays),
                  style: GoogleFonts.unbounded(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    height: 1,
                    color: isFirst ? colors.text.accent : colors.text.primary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  t.due_label.toUpperCase(),
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: colors.text.secondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: BorderDirectional(start: BorderSide(color: colors.divider)),
              ),
              padding: const EdgeInsetsDirectional.only(start: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.question,
                    style: GoogleFonts.spectral(
                      fontSize: 16,
                      height: 1.3,
                      color: colors.text.primary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${item.topic} · $progressLabel'.toUpperCase(),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: colors.text.secondary,
                    ),
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

class _CountersBlock extends StatelessWidget {
  const _CountersBlock({required this.queue});

  final ReviewQueueEntity queue;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.review;

    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  queue.queuedTotal.toString(),
                  style: GoogleFonts.unbounded(
                    fontSize: 56,
                    fontWeight: FontWeight.w800,
                    height: 0.85,
                    color: colors.text.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  t.queued_label.toUpperCase(),
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    color: colors.text.secondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                queue.masteredTotal.toString(),
                style: GoogleFonts.unbounded(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  height: 1,
                  color: colors.answer.success,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                t.mastered_label.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: colors.text.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.fromLTRB(22, 16, 22, 12),
      child: Text(
        context.t.review.footer.toUpperCase(),
        textAlign: TextAlign.center,
        style: GoogleFonts.jetBrainsMono(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
          color: context.palette.text.secondary,
        ),
      ),
    );
  }
}

class _ReviewLoading extends StatelessWidget {
  const _ReviewLoading();

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return AppShimmer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 32),
        children: [
          Container(height: 40, color: colors.background.dynamic),
          const SizedBox(height: 14),
          for (var i = 0; i < 4; i++) ...[
            Container(height: 60, color: colors.background.dynamic),
            const SizedBox(height: 8),
          ],
          const SizedBox(height: 16),
          Container(height: 60, color: colors.background.dynamic),
        ],
      ),
    );
  }
}

class _ReviewError extends StatelessWidget {
  const _ReviewError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 28, 22, 24),
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: colors.text.primary, width: 1.5),
              bottom: BorderSide(color: colors.divider),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Column(
            children: [
              Text(
                context.t.review.error,
                textAlign: TextAlign.center,
                style: GoogleFonts.spectral(fontSize: 17, color: colors.text.primary),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onRetry,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.text.primary, width: 1.5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.refresh, size: 18, color: colors.text.primary),
                      const SizedBox(width: 8),
                      Text(
                        context.t.review.retry.toUpperCase(),
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: colors.text.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
