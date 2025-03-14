import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class ThemedTextSpan extends TextSpan {
  ThemedTextSpan(
    BuildContext context, {
    required,
    super.text,
    super.children,
    TextStyle? style,
  }) : super(
          style: TextStyle(
            color: context.appTheme.palette.text.primary,
          ).merge(style),
        );
}
