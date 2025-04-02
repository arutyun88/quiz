import 'package:flutter/material.dart';

class Palette extends ThemeExtension<Palette> {
  Palette._({
    required this.background,
    required this.switchColor,
    required this.text,
    required this.textField,
    required this.button,
    required this.progress,
    required this.shadow,
    required this.answer,
  });

  final BackgroundColor background;
  final SwitchColor switchColor;
  final TextColor text;
  final TextFieldColor textField;
  final ButtonColor button;
  final Color progress;
  final Color shadow;
  final AnswerColor answer;

  static Palette light = Palette._(
    background: BackgroundColor(
      static: const Color.fromRGBO(255, 255, 255, 1),
      dynamic: const Color.fromRGBO(240, 240, 240, 1),
      temporary: Colors.grey,
      danger: const Color.fromARGB(255, 255, 174, 167),
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
    button: ButtonColor(
      background: Colors.lightGreen.shade50,
      foreground: Colors.lightGreen.shade900,
      disabledBackground: Colors.grey.shade50,
      disabledForeground: Colors.grey.shade400,
    ),
    progress: Colors.orange,
    shadow: Colors.white,
    answer: AnswerColor(
      failure: const Color.fromARGB(255, 253, 178, 178),
      success: Colors.green.shade200,
      select: Colors.blueGrey.shade200,
    ),
  );

  static Palette dark = Palette._(
    background: BackgroundColor(
      static: const Color(0xFF181818),
      dynamic: const Color.fromRGBO(0, 0, 0, 1),
      temporary: Colors.grey,
      danger: const Color.fromARGB(255, 255, 174, 167),
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
    button: ButtonColor(
      background: Colors.green.shade900,
      foreground: Colors.lightGreen.shade50,
      disabledBackground: const Color.fromRGBO(48, 48, 48, 1),
      disabledForeground: Colors.grey.shade700,
    ),
    progress: Colors.orange,
    shadow: Colors.black,
    answer: AnswerColor(
      failure: Colors.red.shade200,
      success: Colors.green.shade100,
      select: Colors.grey.shade200,
    ),
  );

  @override
  ThemeExtension<Palette> copyWith({
    BackgroundColor? background,
    SwitchColor? switchColor,
    TextColor? text,
    TextFieldColor? textField,
    ButtonColor? button,
    Color? progress,
    Color? shadow,
    AnswerColor? answer,
  }) {
    return Palette._(
      background: background ?? this.background,
      switchColor: switchColor ?? this.switchColor,
      text: text ?? this.text,
      textField: textField ?? this.textField,
      button: button ?? this.button,
      progress: progress ?? this.progress,
      shadow: shadow ?? this.shadow,
      answer: answer ?? this.answer,
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
        button: button.lerp(other.button, t),
        progress: Color.lerp(progress, other.progress, t)!,
        shadow: Color.lerp(shadow, other.shadow, t)!,
        answer: answer.lerp(other.answer, t),
      );
    }
    return this;
  }
}

class BackgroundColor {
  final Color static;
  final Color dynamic;
  final Color temporary;
  final Color danger;

  BackgroundColor({
    required this.static,
    required this.dynamic,
    required this.temporary,
    required this.danger,
  });

  BackgroundColor lerp(BackgroundColor? other, double t) {
    if (other == null) return this;

    return BackgroundColor(
      static: Color.lerp(static, other.static, t)!,
      dynamic: Color.lerp(dynamic, other.dynamic, t)!,
      temporary: Color.lerp(temporary, other.temporary, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
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

class ButtonColor {
  final Color background;
  final Color foreground;
  final Color disabledBackground;
  final Color disabledForeground;

  ButtonColor({
    required this.background,
    required this.foreground,
    required this.disabledBackground,
    required this.disabledForeground,
  });

  ButtonColor lerp(ButtonColor? other, double t) {
    if (other == null) return this;

    return ButtonColor(
      background: Color.lerp(background, other.background, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      disabledBackground: Color.lerp(disabledBackground, other.disabledBackground, t)!,
      disabledForeground: Color.lerp(disabledForeground, other.disabledForeground, t)!,
    );
  }
}

class AnswerColor {
  final Color failure;
  final Color success;
  final Color select;

  AnswerColor({
    required this.failure,
    required this.success,
    required this.select,
  });

  AnswerColor lerp(AnswerColor? other, double t) {
    if (other == null) return this;

    return AnswerColor(
      failure: Color.lerp(failure, other.failure, t)!,
      success: Color.lerp(success, other.success, t)!,
      select: Color.lerp(select, other.select, t)!,
    );
  }
}
