import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final Function()? onTap;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _loading || widget.onTap == null
          ? null
          : () async {
              setState(() {
                _loading = true;
              });
              await widget.onTap?.call();
              setState(() {
                _loading = false;
              });
            },
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
      child: Stack(
        children: [
          AnimatedOpacity(
            curve: const Cubic(0.25, 0.1, 0.25, 1),
            duration: const Duration(milliseconds: 140),
            opacity: _loading ? 0 : 1,
            child: widget.child,
          ),
          Positioned.fill(
            child: Center(
              child: SizedBox.square(
                dimension: 16.0,
                child: AnimatedOpacity(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 120),
                  opacity: _loading ? 1 : 0,
                  child: TickerMode(
                    enabled: _loading,
                    child: CircularProgressIndicator(
                      color: context.palette.progress,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
