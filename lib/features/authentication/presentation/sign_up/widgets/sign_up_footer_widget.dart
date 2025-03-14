import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/style/themed_text_span.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/gen/strings.g.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: ThemedTextSpan(
        context,
        text: t.authentication.sign_up.no_account.text,
        style: context.textStyle.body14Regular,
        children: [
          const TextSpan(text: ' '),
          TextSpan(
            text: t.authentication.sign_up.no_account.sign_in,
            style: context.textStyle.body14Bold.copyWith(
              color: context.palette.text.accent,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacement('/login');
              },
          ),
        ],
      ),
    );
  }
}
