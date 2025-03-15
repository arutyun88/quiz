import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/input/app_input_border.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.enabled,
    this.label,
    this.hint,
  });

  final bool enabled;
  final String? label;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      style: context.textStyle.body16Regular,
      cursorColor: context.palette.textField.cursorColor,
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
}
