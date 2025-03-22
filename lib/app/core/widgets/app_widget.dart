import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.palette.background.static,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
