import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/gen/strings.g.dart';

class DemoHintPanel extends StatelessWidget {
  final String hint;
  final bool visible;
  final bool enabled;
  final VoidCallback onShow;

  const DemoHintPanel({
    super.key,
    required this.hint,
    required this.visible,
    required this.enabled,
    required this.onShow,
  });

  @override
  Widget build(BuildContext context) {
    if (visible) {
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
              child: Text(
                hint,
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
        onPressed: enabled ? onShow : null,
        icon: const Icon(Icons.lightbulb_outline, size: 18),
        label: Text(
          context.t.demo.quiz.show_hint,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
