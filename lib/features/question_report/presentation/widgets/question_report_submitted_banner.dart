import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/gen/strings.g.dart';

class QuestionReportSubmittedBanner extends StatelessWidget {
  const QuestionReportSubmittedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final t = context.t.question.report;
    return Container(
      key: const ValueKey('question-report-submitted'),
      decoration: BoxDecoration(border: Border.all(color: palette.divider)),
      padding: const EdgeInsets.fromLTRB(12, 10, 14, 10),
      child: Row(
        children: [
          Container(width: 4, height: 44, color: palette.text.accent),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.status_title,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.15,
                    color: palette.text.accent,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  t.status_message,
                  style: GoogleFonts.spectral(
                    fontSize: 13,
                    height: 1.2,
                    color: palette.text.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Icon(Icons.check, size: 20, color: palette.text.accent),
        ],
      ),
    );
  }
}
