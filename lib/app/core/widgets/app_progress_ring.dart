import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

/// Circular day-progress ring with a big Unbounded value
class AppProgressRing extends StatelessWidget {
  const AppProgressRing({
    super.key,
    required this.size,
    required this.progress,
    required this.value,
    required this.label,
    required this.valueFontSize,
    this.progressColor,
  });

  final double size;

  /// 0..1 — clamped internally.
  final double progress;
  final String value;
  final String label;
  final double valueFontSize;

  /// Defaults to the accent colour; Г1 passes a muted grey for guest progress.
  final Color? progressColor;

  static const _strokeWidth = 6.0;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _RingPainter(
          progress: progress.clamp(0, 1),
          trackColor: colors.background.dynamic,
          progressColor: progressColor ?? colors.text.accent,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: GoogleFonts.unbounded(
                  fontSize: valueFontSize,
                  fontWeight: FontWeight.w800,
                  height: 0.85,
                  color: colors.text.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                  color: colors.text.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({
    required this.progress,
    required this.trackColor,
    required this.progressColor,
  });

  final double progress;
  final Color trackColor;
  final Color progressColor;

  @override
  void paint(Canvas canvas, Size size) {
    // 0.44 keeps the design ratio at both sizes: 200 → r88, 180 → r79
    final radius = size.width * 0.44;
    final center = Offset(size.width / 2, size.height / 2);

    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = AppProgressRing._strokeWidth
      ..color = trackColor;

    canvas.drawCircle(center, radius, track);

    if (progress <= 0) return;

    final arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = AppProgressRing._strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = progressColor;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      arc,
    );
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.trackColor != trackColor ||
      oldDelegate.progressColor != progressColor;
}
