import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppInputBorder extends InputBorder {
  final BorderRadius borderRadius;
  final Color backgroundColor;

  const AppInputBorder._({
    required this.borderRadius,
    required this.backgroundColor,
    super.borderSide,
  });

  static AppInputBorder to(
    BuildContext context, {
    bool enabled = true,
  }) {
    return AppInputBorder._(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      backgroundColor: enabled ? context.palette.textField.background : context.palette.textField.disabledBackground,
      borderSide: BorderSide.none,
    );
  }

  @override
  InputBorder copyWith({
    BorderSide? borderSide,
    BorderRadius? borderRadius,
    Color? backgroundColor,
  }) {
    return AppInputBorder._(
      borderRadius: borderRadius ?? this.borderRadius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderSide: borderSide ?? this.borderSide,
    );
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(borderSide.width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect).deflate(borderSide.width));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  bool get isOutline => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final RRect rrect = borderRadius.resolve(textDirection).toRRect(rect);
    canvas.drawRRect(rrect, backgroundPaint);

    if (borderSide.width > 0) {
      final Paint borderPaint = Paint()
        ..color = borderSide.color
        ..strokeWidth = borderSide.width
        ..style = PaintingStyle.stroke;

      canvas.drawRRect(rrect, borderPaint);
    }
  }

  @override
  ShapeBorder scale(double t) {
    return AppInputBorder._(
      borderRadius: borderRadius * t,
      backgroundColor: backgroundColor,
      borderSide: borderSide.scale(t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is AppInputBorder &&
        other.borderRadius == borderRadius &&
        other.backgroundColor == backgroundColor &&
        other.borderSide == borderSide;
  }

  @override
  int get hashCode => Object.hash(borderRadius, backgroundColor, borderSide);
}
