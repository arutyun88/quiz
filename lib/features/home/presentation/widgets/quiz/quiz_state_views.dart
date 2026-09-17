import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
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

class QuizOffline extends StatelessWidget {
  const QuizOffline({
    super.key,
    required this.onRetry,
  });

  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final copy = context.t.question.state.offline;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 22),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: palette.text.primary),
                    ),
                    child: Icon(
                      Icons.wifi_off,
                      size: 28,
                      color: palette.text.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    copy.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.unbounded(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: palette.text.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    copy.message,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.spectral(
                      fontSize: 18,
                      color: palette.text.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppButtonV2(
            label: copy.retry,
            onTap: (_) => onRetry(),
          ),
        ],
      ),
    );
  }
}
