import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/input/app_input_border.dart';
import 'package:quiz/gen/strings.g.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.enabled,
    this.label,
    this.hint,
    this.keyboardType,
  });

  factory AppTextField.email({
    Key? key,
    required bool enabled,
    String? label,
    String? hint,
  }) =>
      AppTextField(
        key: key,
        enabled: enabled,
        label: label ?? t.text_field.email.label,
        hint: hint ?? t.text_field.email.hint,
        keyboardType: TextInputType.emailAddress,
      );

  final bool enabled;
  final String? label;
  final String? hint;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      style: context.textStyle.body16Regular,
      cursorColor: context.palette.textField.cursorColor,
      keyboardType: keyboardType,
      textCapitalization: _textCapitalization,
      autocorrect: _autocorrect,
      decoration: InputDecoration(
        label: label != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: ColoredBox(
                  color: enabled ? context.palette.textField.background : context.palette.textField.disabledBackground,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: Text(label!),
                  ),
                ),
              )
            : null,
        labelStyle: context.textStyle.body16Regular.copyWith(color: context.palette.textField.labelColor),
        floatingLabelStyle: context.textStyle.body16Semibold.copyWith(color: context.palette.textField.labelColor),
        hintText: hint,
        hintStyle: context.textStyle.body14Regular.copyWith(color: context.palette.textField.hintColor),
        hintMaxLines: 1,
        border: AppInputBorder.to(context, enabled: enabled),
      ),
    );
  }

  TextCapitalization get _textCapitalization {
    switch (keyboardType) {
      case TextInputType.name:
      case TextInputType.streetAddress:
        return TextCapitalization.words;
      case TextInputType.emailAddress:
      case TextInputType.url:
      case TextInputType.visiblePassword:
      case TextInputType.phone:
      case TextInputType.number:
      case TextInputType.datetime:
        return TextCapitalization.none;
      default:
        return TextCapitalization.sentences;
    }
  }

  bool get _autocorrect {
    switch (keyboardType) {
      case TextInputType.name:
      case TextInputType.emailAddress:
      case TextInputType.url:
      case TextInputType.visiblePassword:
      case TextInputType.phone:
      case TextInputType.number:
      case TextInputType.datetime:
        return false;
      default:
        return true;
    }
  }
}
