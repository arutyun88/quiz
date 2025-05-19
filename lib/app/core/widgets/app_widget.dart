import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.backgroundColor,
    this.duration,
  });

  const AppWidget.expand({
    super.key,
    this.child = const SizedBox.expand(),
    this.padding = const EdgeInsets.all(16.0),
    this.backgroundColor,
    this.duration,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration ?? Duration.zero,
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.palette.background.static,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
