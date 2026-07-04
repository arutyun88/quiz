import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/utils/authentication_failure_snack_bar.dart';
import 'package:quiz/app/core/utils/validation_exp_ex.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/app/core/widgets/input/app_text_field_v2.dart';
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

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.sign_in;

    ref.listen(authenticationProvider, (_, next) {
      next.when(
        authenticated: (user) {
          if (user?.name is! String || user?.birthDate is! DateTime) {
            context.goNamed('profile-edit');
          } else {
            context.pop();
          }
        },
        unauthenticated: (failure) {
          if (failure case Failure failure when failure is AuthenticationFailure) {
            showAuthenticationFailureSnackBar(context, type: failure.type);
          }
        },
      );
    });

    final isFormValid = ref.watch(formProvider.select((s) => s.isFormValid));

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 14),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: context.pop,
                      child: Icon(Icons.arrow_back, size: 22, color: colors.text.primary),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'QUIZ.',
                      style: GoogleFonts.unbounded(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: colors.text.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const AppDivider(indent: 22, endIndent: 22),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(22, 28, 22, 0),
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.title,
                          style: GoogleFonts.unbounded(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                            color: colors.text.primary,
                            height: 0.95,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 30),
                        AppTextFieldV2(
                          label: t.email_label,
                          controller: _emailController,
                          focusNode: _emailFocus,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.username, AutofillHints.email],
                          onSubmitted: (_) => _passwordFocus.requestFocus(),
                          onChanged: (v) {
                            ref.read(formProvider.notifier).updateEmail(v);
                            ref.read(formProvider.notifier).updateEmailValidity(v.isValidEmail ? null : '');
                          },
                        ),
                        const SizedBox(height: 8),
                        AppTextFieldV2(
                          label: t.password_label,
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          autofillHints: const [AutofillHints.password],
                          onChanged: (v) {
                            ref.read(formProvider.notifier).updatePassword(v);
                            ref.read(formProvider.notifier).updatePasswordValidity(v.isValidPassword ? null : '');
                          },
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => context.pushNamed('forgot-password'),
                            child: Text(
                              t.forgot_password,
                              style: GoogleFonts.spectral(fontSize: 14, color: colors.text.accent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 0, 22, 8),
                child: AppButtonV2(
                  label: t.submit,
                  onTap: isFormValid
                      ? (complete) async {
                          FocusScope.of(context).unfocus();
                          final s = ref.read(formProvider);
                          await ref
                              .read(authenticationProvider.notifier)
                              .signInWithEmail(email: s.email, password: s.password);
                          complete();
                        }
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () => context.pushNamed('registration'),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${context.t.sign_in.no_account} ',
                          style: GoogleFonts.spectral(fontSize: 14, color: colors.text.secondary),
                        ),
                        TextSpan(
                          text: t.register_link,
                          style: GoogleFonts.spectral(fontSize: 14, color: colors.text.accent),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
