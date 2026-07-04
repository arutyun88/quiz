import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/widgets/app_divider.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/app/core/utils/validation_exp_ex.dart';
import 'package:quiz/app/core/widgets/input/app_text_field_v2.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/domain/repository/password_reset_gateway.dart';
import 'package:quiz/gen/strings.g.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool get _isValid => _emailController.text.isValidEmail;

  Future<void> _submit(VoidCallback complete) async {
    final result = await getIt<PasswordResetGateway>()
        .sendPasswordResetEmail(_emailController.text.trim());
    complete();
    if (!mounted) return;
    final t = context.t.forgot_password;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          switch (result) {
            ResultOk() => t.success,
            ResultFailed() => t.error,
          },
        ),
      ),
    );
    if (result is ResultOk && mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final t = context.t.forgot_password;

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: colors.background.static,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 14),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: context.pop,
                      child: Icon(Icons.arrow_back,
                          size: 22, color: colors.text.primary),
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
                      const SizedBox(height: 14),
                      Text(
                        t.subtitle,
                        style: GoogleFonts.spectral(
                          fontSize: 16,
                          color: colors.text.secondary,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ListenableBuilder(
                        listenable: _emailController,
                        builder: (context, _) => AppTextFieldV2(
                          label: t.email_label,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [
                            AutofillHints.username,
                            AutofillHints.email
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        color: colors.background.dynamic,
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.info_outline,
                                size: 18, color: colors.text.secondary),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                t.hint,
                                style: GoogleFonts.spectral(
                                  fontSize: 14,
                                  color: colors.text.secondary,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 0, 22, 28),
                child: ListenableBuilder(
                  listenable: _emailController,
                  builder: (context, _) => AppButtonV2(
                    label: t.submit,
                    onTap: _isValid ? _submit : null,
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
