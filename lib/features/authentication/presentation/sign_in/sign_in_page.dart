import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/core/widgets/button/app_button.dart';
import 'package:quiz/app/core/widgets/input/app_text_field.dart';
import 'package:quiz/features/authentication/presentation/sign_in/widgets/forget_password_widget.dart';
import 'package:quiz/features/authentication/presentation/sign_in/widgets/sign_in_footer_widget.dart';
import 'package:quiz/features/authentication/presentation/widgets/agreement_widget.dart';
import 'package:quiz/features/authentication/presentation/sign_in/provider/sign_in_form_provider.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final formProvider = StateNotifierProvider<SignInFormProvider, SignInFormState>(
    (ref) => SignInFormProvider(),
  );

  @override
  Widget build(BuildContext context) {
    final isFormValid = ref.watch(formProvider.select((state) => state.isFormValid));

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
                  onValidationChanged: ref.read(formProvider.notifier).updateEmailValidity,
                  onChanged: ref.read(formProvider.notifier).updateEmail,
                ),
                const SizedBox(height: 16.0),
                AppTextField.password(
                  enabled: true,
                  onValidationChanged: ref.read(formProvider.notifier).updatePasswordValidity,
                  onChanged: ref.read(formProvider.notifier).updatePassword,
                ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ForgetPasswordWidget(email: ref.watch(formProvider).email),
                    AppButton(
                      expanded: false,
                      onTap: isFormValid
                          ? () async {
                              final formState = ref.read(formProvider);
                              await ref.read(authenticationProvider.notifier).signInWithEmail(
                                    email: formState.email,
                                    password: formState.password,
                                  );
                              if (context.mounted) {
                                context.pop();
                              }
                            }
                          : null,
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
