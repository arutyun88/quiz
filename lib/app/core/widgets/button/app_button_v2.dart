import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppButtonV2 extends StatefulWidget {
  const AppButtonV2({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;

  /// Receives [complete] — call it to trigger the completion animation and
  /// return the button to its idle state.
  final FutureOr<void> Function(VoidCallback complete)? onTap;

  bool get isEnabled => onTap != null;

  @override
  State<AppButtonV2> createState() => _AppButtonV2State();
}

class _AppButtonV2State extends State<AppButtonV2> with SingleTickerProviderStateMixin {
  bool _loading = false;
  bool _completing = false;
  bool _pressed = false;

  late final AnimationController _completeController;

  @override
  void initState() {
    super.initState();
    _completeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _completeController.dispose();
    super.dispose();
  }

  void _releasePress() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) setState(() => _pressed = false);
    });
  }

  Future<void> _handleTap() async {
    if (_loading || !widget.isEnabled) return;
    HapticFeedback.lightImpact();
    var completed = false;
    void complete() {
      if (!completed) {
        completed = true;
        _complete();
      }
    }

    try {
      final result = widget.onTap!(complete);
      if (!completed) {
        setState(() => _loading = true);
        if (result is Future) await result;
      }
    } catch (e, s) {
      log('Button: onTap threw', error: e, stackTrace: s);
    } finally {
      complete();
    }
  }

  void _complete() {
    if (!mounted) return;
    setState(() => _completing = true);
    _completeController.forward(from: 0).then((_) {
      if (mounted) _reset();
    });
  }

  void _reset() {
    if (!mounted) return;
    setState(() {
      _loading = false;
      _completing = false;
    });
    _completeController.reset();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    final interactive = widget.isEnabled && !_loading;

    return GestureDetector(
      onTap: interactive ? _handleTap : null,
      onTapDown: interactive ? (_) => setState(() => _pressed = true) : null,
      onTapUp: interactive ? (_) => _releasePress() : null,
      onTapCancel: interactive ? () => _releasePress() : null,
      child: AnimatedOpacity(
        opacity: _pressed ? 0.7 : 1.0,
        duration: const Duration(milliseconds: 80),
        child: Container(
          color: widget.isEnabled ? colors.text.primary : colors.text.secondary,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: colors.background.static,
                ),
              ),
              SizedBox.square(
                dimension: 20,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 160),
                  child: _loading
                      ? _completing
                          ? FadeTransition(
                              key: const ValueKey('completing'),
                              opacity: Tween(begin: 1.0, end: 0.0).animate(_completeController),
                              child: ScaleTransition(
                                scale: Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
                                  parent: _completeController,
                                  curve: Curves.easeIn,
                                )),
                                child: CircularProgressIndicator(
                                  color: colors.background.static,
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          : CircularProgressIndicator(
                              key: const ValueKey('loading'),
                              color: colors.background.static,
                              strokeWidth: 2,
                            )
                      : Icon(
                          key: const ValueKey('arrow'),
                          Icons.arrow_forward,
                          size: 20,
                          color: colors.background.static,
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
