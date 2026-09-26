import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

abstract final class AppNotificationBanner {
  static const bannerKey = ValueKey<String>('app_notification_banner');

  static OverlayEntry? _entry;

  static void show(
    OverlayState overlay, {
    required String title,
    required String message,
    VoidCallback? onTap,
  }) {
    dismiss();
    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.viewPaddingOf(context).top + 12,
        left: 16,
        right: 16,
        child: Material(
          type: MaterialType.transparency,
          child: _AnimatedNotificationBanner(
            key: bannerKey,
            title: title,
            message: message,
            onTap: onTap,
            onDismiss: () {
              if (entry.mounted) entry.remove();
              if (identical(_entry, entry)) _entry = null;
            },
          ),
        ),
      ),
    );
    _entry = entry;
    overlay.insert(entry);
  }

  static void dismiss() {
    _entry?.remove();
    _entry = null;
  }
}

class _AnimatedNotificationBanner extends StatefulWidget {
  const _AnimatedNotificationBanner({
    super.key,
    required this.title,
    required this.message,
    required this.onTap,
    required this.onDismiss,
  });

  final String title;
  final String message;
  final VoidCallback? onTap;
  final VoidCallback onDismiss;

  @override
  State<_AnimatedNotificationBanner> createState() =>
      _AnimatedNotificationBannerState();
}

class _AnimatedNotificationBannerState
    extends State<_AnimatedNotificationBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 280),
    reverseDuration: const Duration(milliseconds: 180),
  );
  late final Animation<Offset> _slide = Tween<Offset>(
    begin: const Offset(0, -1.2),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    ),
  );
  late final Animation<double> _opacity = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0, 0.7, curve: Curves.easeOut),
  );
  Timer? _dismissTimer;
  bool _dismissing = false;

  @override
  void initState() {
    super.initState();
    _controller.forward();
    _dismissTimer = Timer(const Duration(seconds: 6), _dismiss);
  }

  Future<void> _dismiss({bool runAction = false}) async {
    if (_dismissing) return;
    _dismissing = true;
    _dismissTimer?.cancel();
    if (!MediaQuery.disableAnimationsOf(context)) {
      await _controller.reverse();
    }
    if (!mounted) return;
    widget.onDismiss();
    if (runAction) widget.onTap?.call();
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
    final border = BorderSide(color: colors.text.primary, width: 1.5);
    final surface = isDark ? colors.background.dynamic : colors.card.background;
    final iconSurface =
        isDark ? colors.card.border : colors.bottomSheet.headerBackground;

    final content = Semantics(
      liveRegion: true,
      button: widget.onTap != null,
      label: '${widget.title}. ${widget.message}',
      child: Dismissible(
        key: const ValueKey<String>('dismissible_notification_banner'),
        direction: DismissDirection.up,
        resizeDuration: null,
        onDismissed: (_) {
          _dismissTimer?.cancel();
          widget.onDismiss();
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: surface,
            border: Border.fromBorderSide(border),
            boxShadow: [
              BoxShadow(
                color: colors.shadow.withValues(alpha: 0.28),
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: InkWell(
            onTap: widget.onTap == null
                ? null
                : () => unawaited(_dismiss(runAction: true)),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 78),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 48,
                      decoration: BoxDecoration(
                        color: iconSurface,
                        border: Border(right: border),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.notifications_none,
                        size: 21,
                        color: colors.text.accent,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.unbounded(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: colors.text.primary,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              widget.message,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 10,
                                height: 1.3,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.35,
                                color: colors.text.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => unawaited(_dismiss()),
                      tooltip:
                          MaterialLocalizations.of(context).closeButtonTooltip,
                      icon: Icon(
                        Icons.close,
                        size: 18,
                        color: colors.text.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (MediaQuery.disableAnimationsOf(context)) return content;
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _slide, child: content),
    );
  }
}
