import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/gen/strings.g.dart';

class QuizLoading extends StatelessWidget {
  const QuizLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class QuizEmpty extends StatelessWidget {
  const QuizEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Text(
          context.t.question.state.empty,
          textAlign: TextAlign.center,
          style: GoogleFonts.spectral(
            fontSize: 20,
            color: palette.text.secondary,
          ),
        ),
      ),
    );
  }
}

class QuizError extends StatelessWidget {
  const QuizError({
    super.key,
    required this.failure,
  });

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Text(
          context.t.question.state.error,
          textAlign: TextAlign.center,
          style: GoogleFonts.spectral(
            fontSize: 20,
            color: palette.text.secondary,
          ),
        ),
      ),
    );
  }
}
