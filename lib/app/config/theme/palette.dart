import 'package:flutter/material.dart';

class Palette extends ThemeExtension<Palette> {
  Palette._({
    required this.background,
    required this.switchColor,
    required this.text,
    required this.textField,
  });

  final BackgroundColor background;
  final SwitchColor switchColor;
  final TextColor text;
  final TextFieldColor textField;

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
      accent: Colors.orange,
    ),
    textField: TextFieldColor(
      background: Colors.grey.shade100,
      disabledBackground: Colors.grey.shade50,
      labelColor: Colors.grey.shade700,
      hintColor: Colors.grey.shade500,
      cursorColor: Colors.grey.shade700,
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
      accent: Colors.orange,
    ),
    textField: TextFieldColor(
      background: const Color.fromRGBO(48, 48, 48, 1),
      disabledBackground: Colors.grey.shade900,
      labelColor: Colors.grey.shade200,
      hintColor: Colors.grey.shade400,
      cursorColor: Colors.grey.shade200,
    ),
  );

  @override
  ThemeExtension<Palette> copyWith({
    BackgroundColor? background,
    SwitchColor? switchColor,
    TextColor? text,
    TextFieldColor? textField,
  }) {
    return Palette._(
      background: background ?? this.background,
      switchColor: switchColor ?? this.switchColor,
      text: text ?? this.text,
      textField: textField ?? this.textField,
    );
  }

  @override
  Palette lerp(covariant Palette? other, double t) {
    if (other case Palette other) {
      return Palette._(
        background: background.lerp(other.background, t),
        switchColor: switchColor.lerp(other.switchColor, t),
        text: text.lerp(other.text, t),
        textField: textField.lerp(other.textField, t),
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
  final Color accent;

  TextColor({
    required this.primary,
    required this.secondary,
    required this.accent,
  });

  TextColor lerp(TextColor? other, double t) {
    if (other == null) return this;

    return TextColor(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
    );
  }
}

class TextFieldColor {
  final Color background;
  final Color disabledBackground;
  final Color labelColor;
  final Color hintColor;
  final Color cursorColor;

  TextFieldColor({
    required this.background,
    required this.disabledBackground,
    required this.labelColor,
    required this.hintColor,
    required this.cursorColor,
  });

  TextFieldColor lerp(TextFieldColor? other, double t) {
    if (other == null) return this;

    return TextFieldColor(
      background: Color.lerp(background, other.background, t)!,
      disabledBackground: Color.lerp(disabledBackground, other.disabledBackground, t)!,
      labelColor: Color.lerp(labelColor, other.labelColor, t)!,
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
      cursorColor: Color.lerp(cursorColor, other.cursorColor, t)!,
    );
  }
}
