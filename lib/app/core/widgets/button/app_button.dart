import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        textStyle: context.textStyle.body16Semibold,
        backgroundColor: context.palette.button.background,
        foregroundColor: context.palette.button.foreground,
        disabledBackgroundColor: context.palette.button.disabledBackground,
        disabledForegroundColor: context.palette.button.disabledForeground,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        minimumSize: const Size(120, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: child,
    );
  }
}
