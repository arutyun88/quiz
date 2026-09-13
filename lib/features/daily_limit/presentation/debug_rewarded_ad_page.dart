import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DebugRewardedAdPage extends StatefulWidget {
  const DebugRewardedAdPage({
    super.key,
    required this.rewardQuestions,
  });

  final int rewardQuestions;

  @override
  State<DebugRewardedAdPage> createState() => _DebugRewardedAdPageState();
}

class _DebugRewardedAdPageState extends State<DebugRewardedAdPage> {
  static const _duration = Duration(seconds: 5);

  Timer? _timer;
  var _elapsed = Duration.zero;

  bool get _completed => _elapsed >= _duration;
  int get _secondsLeft => ((_duration - _elapsed).inMilliseconds + 999) ~/ 1000;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!mounted) return;
      final next = _elapsed + const Duration(milliseconds: 100);
      setState(() {
        _elapsed = next > _duration ? _duration : next;
      });
      if (_completed) {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = _elapsed.inMilliseconds / _duration.inMilliseconds;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFF11100B),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: progress),
                    duration: const Duration(milliseconds: 100),
                    builder: (context, value, _) => Transform.rotate(
                      angle: value * 3.14,
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF2F3BEA),
                            width: 12,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'QUIZ.',
                            style: GoogleFonts.unbounded(
                              color: const Color(0xFFF4F0E7),
                              fontSize: 34,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'ТЕСТОВЫЙ РОЛИК',
                            style: GoogleFonts.jetBrainsMono(
                              color: const Color(0xFFF4F0E7),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          icon: const Icon(
                            Icons.close,
                            color: Color(0xFFF4F0E7),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 6,
                      backgroundColor: const Color(0xFF37362F),
                      color: const Color(0xFF2F3BEA),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      height: 58,
                      child: FilledButton(
                        onPressed: _completed
                            ? () => Navigator.of(context).pop(true)
                            : null,
                        style: FilledButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          backgroundColor: const Color(0xFF2F3BEA),
                          disabledBackgroundColor: const Color(0xFF37362F),
                        ),
                        child: Text(
                          _completed
                              ? 'ПОЛУЧИТЬ +${widget.rewardQuestions} ВОПРОСОВ'
                              : 'ОСТАЛОСЬ $_secondsLeft СЕК.',
                          style: GoogleFonts.jetBrainsMono(
                            color: const Color(0xFFF4F0E7),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
