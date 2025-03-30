import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.background,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background ?? context.palette.background.static,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
