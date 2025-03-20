import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/utils/validation_exp_ex.dart';
import 'package:quiz/app/core/widgets/button/app_button.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/domain/repository/password_reset_gateway.dart';
import 'package:quiz/gen/strings.g.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 180.0),
      child: GestureDetector(
        onTap: () {
          final isEmailValid = email.isValidEmail;

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                titlePadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                title: Text(t.authentication.sign_in.forget_password.dialog.title),
                contentPadding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
                content: Text(
                  isEmailValid
                      ? t.authentication.sign_in.forget_password.dialog.valid.description
                      : t.authentication.sign_in.forget_password.dialog.invalid.description,
                ),
                actionsPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                actionsOverflowButtonSpacing: 16.0,
                actions: [
                  if (isEmailValid) ...[
                    AppButton(
                      scope: ButtonScope.secondary,
                      onTap: context.pop,
                      child: Text(t.authentication.sign_in.forget_password.dialog.valid.cancel),
                    ),
                    AppButton(
                      onTap: () async {
                        final result = await getIt<PasswordResetGateway>().sendPasswordResetEmail(email);
                        if (!context.mounted) return;

                        context.pop();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              switch (result) {
                                ResultOk() => t.authentication.sign_in.forget_password.dialog.result.success,
                                ResultFailed() => t.authentication.sign_in.forget_password.dialog.result.failed,
                              },
                            ),
                          ),
                        );
                      },
                      child: Text(t.authentication.sign_in.forget_password.dialog.valid.accept),
                    ),
                  ] else
                    AppButton(
                      onTap: context.pop,
                      child: Text(t.authentication.sign_in.forget_password.dialog.invalid.button),
                    ),
                ],
              );
            },
          );
        },
        child: Text(
          t.authentication.sign_in.forget_password.button,
          style: context.textStyle.body12Regular.copyWith(
            color: context.palette.text.secondary,
          ),
        ),
      ),
    );
  }
}
