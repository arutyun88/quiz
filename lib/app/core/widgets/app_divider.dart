import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.indent,
    this.endIndent,
  });

  final double? indent;
  final double? endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.5,
      thickness: 1.5,
      indent: indent,
      endIndent: endIndent,
      color: context.palette.text.primary,
    );
  }
}

class AppDividerLight extends StatelessWidget {
  const AppDividerLight({super.key, this.indent, this.endIndent});

  final double? indent;
  final double? endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: indent,
      endIndent: endIndent,
      color: context.palette.divider,
    );
  }
}
