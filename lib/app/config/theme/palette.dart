import 'package:flutter/material.dart';

class Palette extends ThemeExtension<Palette> {
  Palette._({
    required this.background,
    required this.switchColor,
    required this.text,
  });

  final BackgroundColor background;
  final SwitchColor switchColor;
  final TextColor text;

  static Palette light = Palette._(
    background: BackgroundColor(
      static: const Color.fromRGBO(255, 255, 255, 1),
      dynamic: const Color.fromRGBO(240, 240, 240, 1),
    ),
    switchColor: SwitchColor(
      active: Colors.black54,
      inactive: Colors.grey.shade400,
    ),
    text: TextColor(
      primary: Colors.black,
      secondary: Colors.grey.shade600,
    ),
  );

  static Palette dark = Palette._(
    background: BackgroundColor(
      static: const Color(0xFF181818),
      dynamic: const Color.fromRGBO(0, 0, 0, 1),
    ),
    switchColor: SwitchColor(
      active: Colors.white,
      inactive: Colors.grey.shade600,
    ),
    text: TextColor(
      primary: Colors.white,
      secondary: Colors.grey.shade400,
    ),
  );

  @override
  ThemeExtension<Palette> copyWith({
    BackgroundColor? background,
    SwitchColor? switchColor,
    TextColor? text,
  }) {
    return Palette._(
      background: background ?? this.background,
      switchColor: switchColor ?? this.switchColor,
      text: text ?? this.text,
    );
  }

  @override
  Palette lerp(covariant Palette? other, double t) {
    if (other case Palette other) {
      return Palette._(
        background: background.lerp(other.background, t),
        switchColor: switchColor.lerp(other.switchColor, t),
        text: text.lerp(other.text, t),
      );
    }
    return this;
  }
}

class BackgroundColor {
  final Color static;
  final Color dynamic;

  BackgroundColor({
    required this.static,
    required this.dynamic,
  });

  BackgroundColor lerp(BackgroundColor? other, double t) {
    if (other == null) return this;

    return BackgroundColor(
      static: Color.lerp(static, other.static, t)!,
      dynamic: Color.lerp(dynamic, other.dynamic, t)!,
    );
  }
}

class SwitchColor {
  final Color active;
  final Color inactive;

  SwitchColor({
    required this.active,
    required this.inactive,
  });

  SwitchColor lerp(SwitchColor? other, double t) {
    if (other == null) return this;

    return SwitchColor(
      active: Color.lerp(active, other.active, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
    );
  }
}

class TextColor {
  final Color primary;
  final Color secondary;

  TextColor({
    required this.primary,
    required this.secondary,
  });

  TextColor lerp(TextColor? other, double t) {
    if (other == null) return this;

    return TextColor(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
    );
  }
}
