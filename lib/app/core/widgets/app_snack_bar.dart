import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

abstract final class AppSnackBar {
  static void showNotice(
    BuildContext context, {
    required String title,
    required String message,
    bool aboveRoutes = false,
  }) {
    _show(
      context,
      title: title,
      message: message,
      kind: _AppSnackBarKind.notice,
      aboveRoutes: aboveRoutes,
    );
  }

  static void showError(
    BuildContext context, {
    required String title,
    required String message,
    bool aboveRoutes = false,
  }) {
    _show(
      context,
      title: title,
      message: message,
      kind: _AppSnackBarKind.error,
      aboveRoutes: aboveRoutes,
    );
  }

  static void showOffline(
    BuildContext context, {
    required String title,
    required String message,
    bool aboveRoutes = false,
  }) {
    _show(
      context,
      title: title,
      message: message,
      kind: _AppSnackBarKind.offline,
      aboveRoutes: aboveRoutes,
    );
  }

  static OverlayEntry? _overlayEntry;

  static void dismissAboveRoutes() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  static void _show(
    BuildContext context, {
    required String title,
    required String message,
    required _AppSnackBarKind kind,
    required bool aboveRoutes,
  }) {
    if (aboveRoutes) {
      _showAboveRoutes(
        context,
        title: title,
        message: message,
        kind: kind,
      );
      return;
    }

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

  static void _showAboveRoutes(
    BuildContext context, {
    required String title,
    required String message,
    required _AppSnackBarKind kind,
  }) {
    dismissAboveRoutes();

    final overlay = Overlay.of(context, rootOverlay: true);
    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (overlayContext) => Positioned(
        left: 22,
        right: 22,
        bottom: MediaQuery.viewPaddingOf(overlayContext).bottom + 22,
        child: Material(
          type: MaterialType.transparency,
          child: _AnimatedSnackBarContent(
            title: title,
            message: message,
            kind: kind,
            onDismiss: () {
              if (entry.mounted) entry.remove();
              if (identical(_overlayEntry, entry)) _overlayEntry = null;
            },
          ),
        ),
      ),
    );
    _overlayEntry = entry;
    overlay.insert(entry);
  }
}

enum _AppSnackBarKind { notice, error, offline }

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
    final isDark = context.appTheme.themeMode.isDark;
    final (icon, iconColor) = switch (widget.kind) {
      _AppSnackBarKind.notice => (Icons.bolt, colors.text.accent),
      _AppSnackBarKind.error => (Icons.bolt, colors.text.danger),
      _AppSnackBarKind.offline => (Icons.wifi_off, colors.text.accent),
    };
    final surfaceColor =
        isDark ? colors.background.dynamic : colors.card.background;
    final iconSurfaceColor =
        isDark ? colors.card.border : colors.bottomSheet.headerBackground;
    final border = BorderSide(color: colors.text.primary, width: 1.5);
    final content = ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 68),
      child: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
            color: surfaceColor,
          ),
          foregroundDecoration: BoxDecoration(
            border: Border.fromBorderSide(border),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 42,
                decoration: BoxDecoration(
                  color: iconSurfaceColor,
                  border: Border(right: border),
                ),
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  size: 20,
                  color: iconColor,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
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
                      const SizedBox(height: 4),
                      Text(
                        widget.message,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 9.5,
                          height: 1.25,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.6,
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
      ),
    );

    if (MediaQuery.disableAnimationsOf(context)) return content;
    return SlideTransition(position: _offset, child: content);
  }
}
