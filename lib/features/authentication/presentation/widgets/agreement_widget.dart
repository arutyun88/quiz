import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/gen/strings.g.dart';

class AgreementWidget extends StatelessWidget {
  const AgreementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      t.authentication.agreement(
        link: (text) {
          return TextSpan(
            text: text,
            style: TextStyle(color: context.palette.text.primary),
            recognizer: TapGestureRecognizer()..onTap = () {},
          );
        },
      ),
      style: context.textStyle.body10Medium.copyWith(
        color: context.palette.text.secondary,
      ),
      textAlign: TextAlign.center,
    );
  }
}
