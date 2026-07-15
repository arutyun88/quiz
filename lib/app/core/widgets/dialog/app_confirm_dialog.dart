import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

Future<bool> showAppConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmLabel,
  required String cancelLabel,
  bool danger = false,
}) async {
  final confirmed = await showDialog<bool>(
    context: context,
    barrierColor: const Color(0xFF18160F).withValues(alpha: 0.5),
    builder: (context) => _AppConfirmDialog(
      title: title,
      message: message,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      danger: danger,
    ),
  );

  return confirmed ?? false;
}

class _AppConfirmDialog extends StatelessWidget {
  const _AppConfirmDialog({
    required this.title,
    required this.message,
    required this.confirmLabel,
    required this.cancelLabel,
    required this.danger,
  });

  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 22),
      shape: const RoundedRectangleBorder(),
      backgroundColor: colors.background.static,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: colors.text.primary, width: 1.5),
        ),
        padding: const EdgeInsets.fromLTRB(22, 26, 22, 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.unbounded(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.3,
                color: colors.text.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: GoogleFonts.spectral(
                fontSize: 15,
                height: 1.5,
                color: colors.text.primary,
              ),
            ),
            const SizedBox(height: 22),
            _DialogButton(
              label: confirmLabel,
              filled: true,
              color: danger ? colors.text.danger : colors.text.primary,
              onTap: () => Navigator.of(context).pop(true),
            ),
            const SizedBox(height: 10),
            _DialogButton(
              label: cancelLabel,
              filled: false,
              color: colors.text.primary,
              onTap: () => Navigator.of(context).pop(false),
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({
    required this.label,
    required this.filled,
    required this.color,
    required this.onTap,
  });

  final String label;
  final bool filled;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: filled ? BoxDecoration(color: color) : BoxDecoration(border: Border.all(color: color)),
        alignment: Alignment.center,
        child: Text(
          label.toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
            color: filled ? colors.background.static : color,
          ),
        ),
      ),
    );
  }
}
