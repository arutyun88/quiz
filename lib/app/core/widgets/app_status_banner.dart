import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppStatusBanner extends StatelessWidget {
  const AppStatusBanner({
    super.key,
    required this.title,
    required this.message,
    this.color,
  });

  final String title;
  final String message;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final statusColor = color ?? palette.text.accent;
    return Container(
      decoration: BoxDecoration(border: Border.all(color: palette.divider)),
      padding: const EdgeInsets.fromLTRB(12, 10, 14, 10),
      child: Row(
        children: [
          Container(width: 4, height: 44, color: statusColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.15,
                    color: statusColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
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
          Icon(Icons.check, size: 20, color: statusColor),
        ],
      ),
    );
  }
}
