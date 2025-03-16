import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/gen/strings.g.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 180.0),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          t.authentication.sign_in.forget_password,
          style: context.textStyle.body12Regular.copyWith(
            color: context.palette.text.secondary,
          ),
        ),
      ),
    );
  }
}
