import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/utils/validation_exp_ex.dart';
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
  final String? validationMessage;

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
    this.validationMessage,
  });

  factory AppTextField({
    Key? key,
    bool enabled = true,
    String? label,
    String? hint,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
    String? validationMessage,
  }) =>
      AppTextField._(
        key: key,
        enabled: enabled,
        label: label,
        hint: hint,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validationMessage: validationMessage,
      );

  factory AppTextField.email({
    Key? key,
    bool enabled = true,
    String? label,
    String? hint,
    void Function(String?)? onValidationChanged,
    void Function(String)? onChanged,
    String? validationMessage,
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
        validationMessage: validationMessage,
      );

  factory AppTextField.password({
    bool enabled = true,
    String? label,
    String? hint,
    void Function(String?)? onValidationChanged,
    void Function(String)? onChanged,
    bool obscureText = true,
    String? validationMessage,
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
        validationMessage: validationMessage,
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => widget.validationMessage ?? _validateAndNotify(value ?? ''),
      decoration: InputDecoration(
        errorMaxLines: 1,
        errorStyle: context.textStyle.body10Medium,
        isDense: true,
        isCollapsed: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
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
        labelStyle: context.textStyle.body16Regular.copyWith(
          color: widget.enabled ? context.palette.textField.labelColor : context.palette.textField.hintColor,
        ),
        floatingLabelStyle: context.textStyle.body14Semibold.copyWith(color: context.palette.textField.labelColor),
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

  String? _validateAndNotify(String value) {
    if (widget.onValidationChanged != null) {
      String? newErrorMessage;

      if (value.isNotEmpty) {
        if (widget.validationMessage == null) {
          switch (widget.validationType) {
            case ValidationType.email:
              if (!value.isValidEmail) {
                newErrorMessage = t.text_field.email.validation_message;
              }
            case ValidationType.password:
              if (!value.isValidPassword) {
                newErrorMessage = t.text_field.password.validation_message;
              }
            case ValidationType.none:
              newErrorMessage = null;
          }
        } else {
          newErrorMessage = widget.validationMessage;
        }
      }
      if (newErrorMessage != errorMessage) {
        errorMessage = newErrorMessage;
        widget.onValidationChanged!(errorMessage);
      }
    }
    return errorMessage;
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
