import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/gen/strings.g.dart';

class QuizLoading extends StatelessWidget {
  const QuizLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class QuizQuestionLoading extends StatelessWidget {
  const QuizQuestionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 18),
          const AppShimmer(
            child: Row(
              children: [
                _QuizSkeletonBox(width: 104, height: 11),
                Spacer(),
                _QuizSkeletonBox(width: 74, height: 11),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const AppShimmer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _QuizSkeletonBox(height: 28),
                SizedBox(height: 10),
                _QuizSkeletonBox(widthFactor: 0.9, height: 28),
                SizedBox(height: 10),
                _QuizSkeletonBox(widthFactor: 0.72, height: 28),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: _QuizSkeletonBox(widthFactor: 0.55, height: 12),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: _QuizSkeletonBox(widthFactor: 0.48, height: 12),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: palette.text.primary, width: 1.5),
              ),
            ),
            child: Column(
              children: List.generate(
                4,
                (index) => Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: palette.divider),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 15,
                  ),
                  child: const AppShimmer(
                    child: Row(
                      children: [
                        _QuizSkeletonBox(width: 34, height: 34, outlined: true),
                        SizedBox(width: 14),
                        Expanded(child: _QuizSkeletonBox(height: 18)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
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

class QuizQuestionError extends StatelessWidget {
  const QuizQuestionError({
    super.key,
    required this.onRetry,
  });

  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final t = context.t.question.state.unknown_error;

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
                      Icons.priority_high,
                      size: 28,
                      color: palette.text.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    t.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.unbounded(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: palette.text.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    t.message,
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
            label: t.retry,
            onTap: (_) => onRetry(),
          ),
        ],
      ),
    );
  }
}

enum QuizConnectionErrorKind { noInternet, serverUnavailable }

QuizConnectionErrorKind? quizConnectionErrorKind(Failure failure) =>
    switch (failure) {
      NoConnectionFailure() => QuizConnectionErrorKind.noInternet,
      ServerUnavailableFailure() => QuizConnectionErrorKind.serverUnavailable,
      NetworkFailure(
        reason: NetworkFailureTimeoutReason() || NetworkFailureServerReason()
      ) =>
        QuizConnectionErrorKind.serverUnavailable,
      NetworkFailure(reason: NetworkFailureBadResponseReason(:final statusCode))
          when statusCode != null && statusCode >= 500 =>
        QuizConnectionErrorKind.serverUnavailable,
      _ => null,
    };

class QuizConnectionError extends StatelessWidget {
  const QuizConnectionError({
    super.key,
    required this.kind,
    required this.onRetry,
  });

  final QuizConnectionErrorKind kind;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final (title, message, retry) = switch (kind) {
      QuizConnectionErrorKind.noInternet => (
          context.t.question.state.no_internet.title,
          context.t.question.state.no_internet.message,
          context.t.question.state.no_internet.retry,
        ),
      QuizConnectionErrorKind.serverUnavailable => (
          context.t.question.state.server_unavailable.title,
          context.t.question.state.server_unavailable.message,
          context.t.question.state.server_unavailable.retry,
        ),
    };

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
                      kind == QuizConnectionErrorKind.noInternet
                          ? Icons.wifi_off
                          : Icons.cloud_off,
                      size: 28,
                      color: palette.text.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.unbounded(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: palette.text.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    message,
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
            label: retry,
            onTap: (_) => onRetry(),
          ),
        ],
      ),
    );
  }
}

class _QuizSkeletonBox extends StatelessWidget {
  const _QuizSkeletonBox({
    this.width,
    this.widthFactor,
    required this.height,
    this.outlined = false,
  });

  final double? width;
  final double? widthFactor;
  final double height;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: outlined ? null : Colors.white,
        border: outlined ? Border.all(color: Colors.white, width: 1.5) : null,
      ),
    );

    if (widthFactor case final factor?) {
      return FractionallySizedBox(
        widthFactor: factor,
        alignment: Alignment.centerLeft,
        child: child,
      );
    }
    return child;
  }
}
