import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/settings/presentation/provider/locale_question_sync_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class LocaleQuestionSyncPage extends ConsumerStatefulWidget {
  const LocaleQuestionSyncPage({super.key});

  @override
  ConsumerState<LocaleQuestionSyncPage> createState() => _LocaleQuestionSyncPageState();
}

class _LocaleQuestionSyncPageState extends ConsumerState<LocaleQuestionSyncPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(localeQuestionSyncProvider.notifier).syncAfterLocaleChange());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(localeQuestionSyncProvider);
    final palette = context.palette;
    final texts = context.t.profile.settings.application.language.sync;
    final isSyncing = state.status == LocaleQuestionSyncStatus.syncing;

    ref.listen(localeQuestionSyncProvider.select((state) => state.status), (_, status) {
      if (status == LocaleQuestionSyncStatus.synchronized) {
        Timer(const Duration(seconds: 1), () {
          if (context.mounted && Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
            ref.read(localeQuestionSyncProvider.notifier).resetVisibleState();
          }
        });
      }
    });

    final (title, message) = switch (state.status) {
      LocaleQuestionSyncStatus.waitingConnection => (
          texts.waiting_connection_title,
          texts.waiting_connection,
        ),
      LocaleQuestionSyncStatus.synchronized => (
          texts.success,
          '',
        ),
      LocaleQuestionSyncStatus.failed => (
          texts.failed_title,
          texts.failed,
        ),
      _ => (
          texts.title,
          texts.syncing,
        ),
    };

    return PopScope(
      canPop: !isSyncing,
      child: Scaffold(
        backgroundColor: palette.background.static,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            child: Column(
              children: [
                const Spacer(),
                _SyncMark(status: state.status),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.spectral(
                      fontSize: 28,
                      height: 1.15,
                      color: palette.text.primary,
                    ),
                  ),
                ),
                if (message.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.spectral(
                        fontSize: 17,
                        height: 1.35,
                        color: palette.text.secondary,
                      ),
                    ),
                  ),
                ],
                const Spacer(),
                if (state.status == LocaleQuestionSyncStatus.failed)
                  _ActionButton(
                    label: texts.retry,
                    onTap: () => ref.read(localeQuestionSyncProvider.notifier).retry(),
                    isPrimary: true,
                  ),
                if (state.status == LocaleQuestionSyncStatus.waitingConnection ||
                    state.status == LocaleQuestionSyncStatus.failed)
                  _ActionButton(
                    label: texts.close,
                    onTap: () {
                      Navigator.of(context).pop();
                      ref.read(localeQuestionSyncProvider.notifier).resetVisibleState();
                    },
                    isPrimary: false,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SyncMark extends StatefulWidget {
  const _SyncMark({required this.status});

  final LocaleQuestionSyncStatus status;

  @override
  State<_SyncMark> createState() => _SyncMarkState();
}

class _SyncMarkState extends State<_SyncMark> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    if (widget.status == LocaleQuestionSyncStatus.syncing) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant _SyncMark oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.status == LocaleQuestionSyncStatus.syncing && !_controller.isAnimating) {
      _controller.repeat();
    } else if (widget.status != LocaleQuestionSyncStatus.syncing && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final icon = switch (widget.status) {
      LocaleQuestionSyncStatus.waitingConnection => Icons.wifi_off_outlined,
      LocaleQuestionSyncStatus.synchronized => Icons.check,
      LocaleQuestionSyncStatus.failed => Icons.priority_high,
      _ => Icons.sync,
    };

    final color = switch (widget.status) {
      LocaleQuestionSyncStatus.synchronized => palette.answer.success,
      LocaleQuestionSyncStatus.failed => palette.answer.failure,
      _ => palette.text.accent,
    };

    return SizedBox.square(
      dimension: 84,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 1.5),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: widget.status == LocaleQuestionSyncStatus.syncing
              ? RotationTransition(
                  turns: _controller,
                  child: Icon(icon, color: color, size: 34),
                )
              : Icon(icon, color: color, size: 34),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.onTap,
    required this.isPrimary,
  });

  final String label;
  final VoidCallback onTap;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: isPrimary ? palette.text.primary : Colors.transparent,
            border: Border.all(color: palette.text.primary, width: 1),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
              color: isPrimary ? palette.background.static : palette.text.primary,
            ),
          ),
        ),
      ),
    );
  }
}
