import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/style/themed_text_span.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/gen/strings.g.dart';

class SignInFooterWidget extends StatelessWidget {
  const SignInFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: ThemedTextSpan(
        context,
        text: t.authentication.sign_in.no_account.text,
        style: context.textStyle.body14Regular,
        children: [
          const TextSpan(text: ' '),
          TextSpan(
            text: t.authentication.sign_in.no_account.sign_up,
            style: context.textStyle.body14Bold.copyWith(
              color: context.palette.text.accent,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacement('/registration');
              },
          ),
        ],
      ),
    );
  }
}
