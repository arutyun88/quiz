import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppBadge extends StatelessWidget {
  const AppBadge.outlined({
    super.key,
    required this.value,
    required this.label,
    this.valueColor,
  }) : _filled = false;

  const AppBadge.filled({
    super.key,
    required this.value,
    required this.label,
    this.valueColor,
  }) : _filled = true;

  static const _width = 52.0;
  static const _height = 46.0;

  final String value;
  final String label;
  final Color? valueColor;
  final bool _filled;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final resolvedValueColor =
        valueColor ?? (_filled ? colors.background.static : colors.text.accent);

    return SizedBox(
      width: _width,
      height: _height,
      child: Container(
        decoration: BoxDecoration(
          color: _filled ? colors.text.primary : null,
          border: Border.all(color: colors.text.primary),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    value,
                    maxLines: 1,
                    style: GoogleFonts.unbounded(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: resolvedValueColor,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                maxLines: 1,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 8,
                  letterSpacing: 1,
                  color: colors.text.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
