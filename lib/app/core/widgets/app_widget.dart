import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.palette.background.static,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: child,
    );
  }
}
