import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/input/app_input_border.dart';
import 'package:quiz/gen/strings.g.dart';

enum ValidationType { none, email, password }

class AppTextField extends StatefulWidget {
  final bool enabled;
  final String? label;
  final String? hint;
  final TextInputType? keyboardType;
  final void Function(String?)? onValidationChanged;
  final ValidationType validationType;
  final bool obscureText;
  final void Function(String)? onChanged;

  const AppTextField._({
    super.key,
    this.enabled = true,
    this.label,
    this.hint,
    this.keyboardType,
    this.onValidationChanged,
    this.validationType = ValidationType.none,
    this.obscureText = false,
    this.onChanged,
  });

  factory AppTextField({
    Key? key,
    bool enabled = true,
    String? label,
    String? hint,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
  }) =>
      AppTextField._(
        key: key,
        enabled: enabled,
        label: label,
        hint: hint,
        keyboardType: keyboardType,
        onChanged: onChanged,
      );

  factory AppTextField.email({
    Key? key,
    bool enabled = true,
    String? label,
    String? hint,
    void Function(String?)? onValidationChanged,
    void Function(String)? onChanged,
  }) =>
      AppTextField._(
        key: key,
        enabled: enabled,
        label: label ?? t.text_field.email.label,
        hint: hint ?? t.text_field.email.hint,
        keyboardType: TextInputType.emailAddress,
        onValidationChanged: onValidationChanged,
        validationType: ValidationType.email,
        onChanged: onChanged,
      );

  factory AppTextField.password({
    bool enabled = true,
    String? label,
    String? hint,
    void Function(String?)? onValidationChanged,
    void Function(String)? onChanged,
    bool obscureText = true,
  }) =>
      AppTextField._(
        enabled: enabled,
        label: label ?? t.text_field.password.label,
        hint: hint ?? t.text_field.password.hint,
        keyboardType: TextInputType.emailAddress,
        onValidationChanged: onValidationChanged,
        validationType: ValidationType.password,
        obscureText: obscureText,
        onChanged: onChanged,
      );

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      style: context.textStyle.body16Regular,
      cursorColor: context.palette.textField.cursorColor,
      keyboardType: widget.keyboardType,
      textCapitalization: _textCapitalization,
      autocorrect: _autocorrect,
      inputFormatters: _inputFormatters,
      autovalidateMode: AutovalidateMode.disabled,
      decoration: InputDecoration(
        label: widget.label != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: ColoredBox(
                  color: widget.enabled
                      ? context.palette.textField.background
                      : context.palette.textField.disabledBackground,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    child: Text(widget.label!),
                  ),
                ),
              )
            : null,
        labelStyle: context.textStyle.body16Regular.copyWith(color: context.palette.textField.labelColor),
        floatingLabelStyle: context.textStyle.body16Semibold.copyWith(color: context.palette.textField.labelColor),
        hintText: widget.hint,
        hintStyle: context.textStyle.body14Regular.copyWith(color: context.palette.textField.hintColor),
        hintMaxLines: 1,
        border: AppInputBorder.to(context, enabled: widget.enabled),
      ),
      obscureText: widget.obscureText,
      onChanged: (value) {
        _validateAndNotify(value);
        widget.onChanged?.call(value);
      },
    );
  }

  void _validateAndNotify(String value) {
    if (widget.onValidationChanged != null) {
      String? newErrorMessage;

      if (value.isNotEmpty) {
        switch (widget.validationType) {
          case ValidationType.email:
            if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
              newErrorMessage = t.text_field.email.validation_message;
            }
          case ValidationType.password:
            if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$').hasMatch(value)) {
              newErrorMessage = t.text_field.password.validation_message;
            }
          case ValidationType.none:
            newErrorMessage = null;
        }
      }
      if (newErrorMessage != errorMessage) {
        errorMessage = newErrorMessage;
        widget.onValidationChanged!(errorMessage);
      }
    }
  }

  TextCapitalization get _textCapitalization {
    switch (widget.keyboardType) {
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
    switch (widget.keyboardType) {
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

  List<TextInputFormatter> get _inputFormatters {
    switch (widget.keyboardType) {
      case TextInputType.number:
      case TextInputType.phone:
        return [FilteringTextInputFormatter.digitsOnly];
      case TextInputType.emailAddress:
      case TextInputType.visiblePassword:
      case TextInputType.url:
        return [FilteringTextInputFormatter.deny(RegExp(r'\s'))];
      case TextInputType.datetime:
        return [FilteringTextInputFormatter.allow(RegExp(r'[0-9/.: -]'))];
      default:
        return [];
    }
  }
}
