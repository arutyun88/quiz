import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/dialog/app_confirm_dialog.dart';
import 'package:quiz/gen/strings.g.dart';

class DailyHintPanel extends StatelessWidget {
  const DailyHintPanel({
    super.key,
    required this.hintUsed,
    required this.hint,
    required this.enabled,
    required this.onUseHint,
  });

  final bool hintUsed;
  final String? hint;
  final bool enabled;
  final Future<void> Function() onUseHint;

  @override
  Widget build(BuildContext context) {
    if (hintUsed) {
      return Container(
        margin: const EdgeInsets.fromLTRB(22, 0, 22, 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: context.palette.text.accent),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.lightbulb_outline,
              size: 20,
              color: context.palette.text.accent,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: hint == null
                  ? const LinearProgressIndicator()
                  : Text(
                      hint!,
                      style: GoogleFonts.spectral(
                        fontSize: 16,
                        height: 1.35,
                        color: context.palette.text.primary,
                      ),
                    ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
      child: OutlinedButton.icon(
        onPressed: enabled ? () => _confirm(context) : null,
        icon: const Icon(Icons.lightbulb_outline, size: 18),
        label: Text(
          context.t.question.hint.action,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Future<void> _confirm(BuildContext context) async {
    final t = context.t.question.hint;
    final confirmed = await showAppConfirmDialog(
      context,
      title: t.confirm_title,
      message: t.confirm_message,
      confirmLabel: t.confirm_button,
      cancelLabel: t.cancel_button,
    );
    if (confirmed) await onUseHint();
  }
}
