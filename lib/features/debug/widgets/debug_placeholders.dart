import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class DebugLoading extends StatelessWidget {
  const DebugLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: context.palette.text.accent),
    );
  }
}

class DebugMessage extends StatelessWidget {
  const DebugMessage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.spectral(fontSize: 16, color: context.palette.text.primary),
        ),
      ),
    );
  }
}
