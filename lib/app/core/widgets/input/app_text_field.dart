import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/input/app_input_border.dart';
import 'package:quiz/gen/strings.g.dart';

class AppTextField extends StatefulWidget {
  final bool enabled;
  final String? label;
  final String? hint;
  final TextInputType? keyboardType;
  final void Function(bool)? onValidationChanged;

  const AppTextField._({
    super.key,
    this.enabled = true,
    this.label,
    this.hint,
    this.keyboardType,
    this.onValidationChanged,
  });

  factory AppTextField({
    Key? key,
    bool enabled = true,
    String? label,
    String? hint,
    TextInputType? keyboardType,
  }) =>
      AppTextField._(
        key: key,
        enabled: enabled,
        label: label,
        hint: hint,
        keyboardType: keyboardType,
      );

  factory AppTextField.email({
    Key? key,
    bool enabled = true,
    String? label,
    String? hint,
    void Function(bool)? onValidationChanged,
  }) =>
      AppTextField._(
        key: key,
        enabled: enabled,
        label: label ?? t.text_field.email.label,
        hint: hint ?? t.text_field.email.hint,
        keyboardType: TextInputType.emailAddress,
        onValidationChanged: onValidationChanged,
      );

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
      onChanged: (value) {
        if (widget.keyboardType == TextInputType.emailAddress) {
          _emailValidateAndNotify(value);
        }
      },
    );
  }

  void _emailValidateAndNotify(String value) {
    if (widget.onValidationChanged != null) {
      bool isCurrentlyValid = false;

      if (value.isNotEmpty) {
        final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
        isCurrentlyValid = emailRegExp.hasMatch(value);
      }

      if (isCurrentlyValid != _isValid) {
        _isValid = isCurrentlyValid;
        widget.onValidationChanged!(_isValid);
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
