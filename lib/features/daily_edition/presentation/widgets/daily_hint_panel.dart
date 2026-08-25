import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

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
          'Δ+ ×0.5',
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
    final material = MaterialLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.lightbulb_outline),
        title: const Text('Δ+ ×0.5'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('✓   Δ+ ×0.5'),
            SizedBox(height: 8),
            Text('✕   Δ− ×1'),
            SizedBox(height: 8),
            Text('XP ×1'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(material.cancelButtonLabel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(material.okButtonLabel),
          ),
        ],
      ),
    );
    if (confirmed == true) await onUseHint();
  }
}
