import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/utils/authentication_failure_snack_bar.dart';
import 'package:quiz/app/core/widgets/button/app_button.dart';
import 'package:quiz/app/core/widgets/input/app_text_field.dart';
import 'package:quiz/features/authentication/presentation/sign_up/provider/sign_up_form_provider.dart';
import 'package:quiz/features/authentication/presentation/sign_up/widgets/sign_up_footer_widget.dart';
import 'package:quiz/features/authentication/presentation/widgets/agreement_widget.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  late final formProvider = StateNotifierProvider<SignUpFormProvider, SignUpFormState>(
    (ref) => SignUpFormProvider(),
  );

  @override
  Widget build(BuildContext context) {
    ref.listen(authenticationProvider, (previous, next) {
      next.when(
        authenticated: (_) => context.pop(),
        unauthenticated: (failure) {
          if (failure case Failure failure when failure is AuthenticationFailure) {
            showAuthenticationFailureSnackBar(context, type: failure.type);
          }
        },
      );
    });
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
                  t.authentication.sign_up.title,
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
                AppTextField.password(
                  label: t.authentication.sign_up.confirm_password.label,
                  hint: t.authentication.sign_up.confirm_password.hint,
                  enabled: ref.watch(formProvider.select((state) => state.isPasswordConfirm)),
                  onChanged: ref.read(formProvider.notifier).updateConfirmPassword,
                  validationMessage: ref.watch(formProvider.select((state) => state.isConfirmedPassword))
                      ? null
                      : t.authentication.sign_up.confirm_password.validation_message,
                ),
                const SizedBox(height: 4.0),
                const AgreementWidget(),
                const SizedBox(height: 16.0),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AppButton(
                    expanded: false,
                    onTap: ref.watch(formProvider.select((state) => state.isFormValid))
                        ? () async {
                            FocusScope.of(context).unfocus();

                            final formState = ref.read(formProvider);
                            await ref.read(authenticationProvider.notifier).registerWithEmail(
                                  email: formState.email,
                                  password: formState.password,
                                );
                          }
                        : null,
                    child: Text(t.authentication.sign_up.button),
                  ),
                ),
                const Spacer(flex: 3),
                const SizedBox(height: 8.0),
                const SignUpFooterWidget(),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
