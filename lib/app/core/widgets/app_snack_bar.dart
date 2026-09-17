import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

abstract final class AppSnackBar {
  static void showError(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    _show(
      context,
      title: title,
      message: message,
      kind: _AppSnackBarKind.error,
    );
  }

  static void showOffline(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    _show(
      context,
      title: title,
      message: message,
      kind: _AppSnackBarKind.offline,
    );
  }

  static void _show(
    BuildContext context, {
    required String title,
    required String message,
    required _AppSnackBarKind kind,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();
    late final ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
        controller;
    controller = messenger.showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.fromLTRB(22, 0, 22, 22),
        elevation: 0,
        duration: const Duration(days: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: _AnimatedSnackBarContent(
          title: title,
          message: message,
          kind: kind,
          onDismiss: () => controller.close(),
        ),
      ),
      snackBarAnimationStyle: AnimationStyle.noAnimation,
    );
  }
}

enum _AppSnackBarKind { error, offline }

class _AnimatedSnackBarContent extends StatefulWidget {
  const _AnimatedSnackBarContent({
    required this.title,
    required this.message,
    required this.kind,
    required this.onDismiss,
  });

  final String title;
  final String message;
  final _AppSnackBarKind kind;
  final VoidCallback onDismiss;

  @override
  State<_AnimatedSnackBarContent> createState() =>
      _AnimatedSnackBarContentState();
}

class _AnimatedSnackBarContentState extends State<_AnimatedSnackBarContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 240),
    reverseDuration: const Duration(milliseconds: 180),
  );
  late final Animation<Offset> _offset = Tween<Offset>(
    begin: const Offset(0, 1.4),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    ),
  );
  Timer? _dismissTimer;

  @override
  void initState() {
    super.initState();
    _controller.forward();
    _dismissTimer = Timer(const Duration(seconds: 4), _dismiss);
  }

  Future<void> _dismiss() async {
    if (MediaQuery.disableAnimationsOf(context)) {
      widget.onDismiss();
      return;
    }
    await _controller.reverse();
    if (mounted) widget.onDismiss();
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final (icon, iconColor) = switch (widget.kind) {
      _AppSnackBarKind.error => (Icons.bolt, colors.text.danger),
      _AppSnackBarKind.offline => (Icons.wifi_off, colors.text.accent),
    };
    final content = SizedBox(
      height: 56,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.card.background,
          border: Border.all(color: colors.text.primary, width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              color: colors.bottomSheet.headerBackground,
              alignment: Alignment.center,
              child: Icon(
                icon,
                size: 20,
                color: iconColor,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.unbounded(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: colors.text.primary,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      widget.message,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 8.5,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.8,
                        color: colors.text.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (MediaQuery.disableAnimationsOf(context)) return content;
    return SlideTransition(position: _offset, child: content);
  }
}
