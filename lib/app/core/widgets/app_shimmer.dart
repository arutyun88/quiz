import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;

  const AppShimmer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.appTheme.palette.background.static,
      highlightColor: context.appTheme.palette.background.dynamic,
      child: child,
    );
  }
}
