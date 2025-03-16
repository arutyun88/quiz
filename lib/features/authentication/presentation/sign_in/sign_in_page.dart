import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/core/widgets/button/app_button.dart';
import 'package:quiz/app/core/widgets/input/app_text_field.dart';
import 'package:quiz/features/authentication/presentation/sign_in/widgets/forget_password_widget.dart';
import 'package:quiz/features/authentication/presentation/sign_in/widgets/sign_in_footer_widget.dart';
import 'package:quiz/features/authentication/presentation/widgets/agreement_widget.dart';
import 'package:quiz/gen/strings.g.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Spacer(flex: 4),
                Text(
                  t.authentication.sign_in.title,
                  style: context.textStyle.heading20Bold,
                ),
                const SizedBox(height: 24.0),
                AppTextField.email(
                  enabled: true,
                  onValidationChanged: (isValid) {},
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16.0),
                AppTextField.password(
                  enabled: true,
                  onValidationChanged: (isValid) {},
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ForgetPasswordWidget(),
                    AppButton(
                      onTap: () {},
                      child: Text(t.authentication.sign_in.button),
                    ),
                  ],
                ),
                const Spacer(flex: 3),
                const SignInFooterWidget(),
                const SizedBox(height: 16.0),
                const AgreementWidget(),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
