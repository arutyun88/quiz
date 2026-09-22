import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    return RefreshIndicator.adaptive(
      color: colors.text.accent,
      backgroundColor: colors.background.static,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
