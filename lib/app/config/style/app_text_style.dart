import 'package:flutter/material.dart';

class AppTextStyle extends ThemeExtension<AppTextStyle> {
  /// fontSize: 10px
  ///
  /// height: 14px
  ///
  /// fontWeight: 500
  final TextStyle body10Medium;

  /// fontSize: 12px
  ///
  /// height: 16px
  ///
  /// fontWeight: 400
  final TextStyle body12Regular;

  /// fontSize: 14px
  ///
  /// height: 20px
  ///
  /// fontWeight: 400
  final TextStyle body14Regular;

  /// fontSize: 14px
  ///
  /// height: 20px
  ///
  /// fontWeight: 700
  final TextStyle body14Bold;

  /// fontSize: 14px
  ///
  /// height: 20px
  ///
  /// fontWeight: 600
  final TextStyle body14Semibold;

  /// fontSize: 18px
  ///
  /// height: 23px
  ///
  /// fontWeight: 700
  final TextStyle heading18Bold;

  const AppTextStyle._({
    required this.body10Medium,
    required this.body12Regular,
    required this.body14Regular,
    required this.body14Bold,
    required this.body14Semibold,
    required this.heading18Bold,
  });

  static const AppTextStyle base = AppTextStyle._(
    body10Medium: TextStyle(fontSize: 10.0, height: 1.4, fontWeight: FontWeight.w500),
    body12Regular: TextStyle(fontSize: 12.0, height: 16 / 12, fontWeight: FontWeight.w400),
    body14Regular: TextStyle(fontSize: 14.0, height: 20 / 14, fontWeight: FontWeight.w400),
    body14Bold: TextStyle(fontSize: 14.0, height: 20 / 14, fontWeight: FontWeight.w700),
    body14Semibold: TextStyle(fontSize: 14.0, height: 20 / 14, fontWeight: FontWeight.w600),
    heading18Bold: TextStyle(fontSize: 18.0, height: 23 / 18, fontWeight: FontWeight.w700),
  );
  @override
  ThemeExtension<AppTextStyle> copyWith({
    TextStyle? body10Medium,
    TextStyle? body12Regular,
    TextStyle? body14Regular,
    TextStyle? body14Bold,
    TextStyle? body14Semibold,
    TextStyle? heading18Bold,
  }) =>
      AppTextStyle._(
        body10Medium: body10Medium ?? this.body10Medium,
        body12Regular: body12Regular ?? this.body12Regular,
        body14Regular: body14Regular ?? this.body14Regular,
        body14Bold: body14Bold ?? this.body14Bold,
        body14Semibold: body14Semibold ?? this.body14Semibold,
        heading18Bold: heading18Bold ?? this.heading18Bold,
      );

  @override
  ThemeExtension<AppTextStyle> lerp(covariant AppTextStyle? other, double t) {
    if (other case AppTextStyle other) {
      return AppTextStyle._(
        body10Medium: TextStyle.lerp(body10Medium, other.body10Medium, t)!,
        body12Regular: TextStyle.lerp(body12Regular, other.body12Regular, t)!,
        body14Regular: TextStyle.lerp(body14Regular, other.body14Regular, t)!,
        body14Bold: TextStyle.lerp(body14Bold, other.body14Bold, t)!,
        body14Semibold: TextStyle.lerp(body14Semibold, other.body14Semibold, t)!,
        heading18Bold: TextStyle.lerp(heading18Bold, other.heading18Bold, t)!,
      );
    }
    return this;
  }
}
