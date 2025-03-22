import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/core/widgets/button/app_button.dart';
import 'package:quiz/app/core/widgets/input/app_text_field.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/profile/domain/repository/change_password_gateway.dart';
import 'package:quiz/features/profile/presentation/provider/change_password_form_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class ChangePasswordFormWidget extends ConsumerStatefulWidget {
  const ChangePasswordFormWidget({super.key});

  @override
  ConsumerState<ChangePasswordFormWidget> createState() => _ChangePasswordFormWidgetState();
}

class _ChangePasswordFormWidgetState extends ConsumerState<ChangePasswordFormWidget> {
  late final StateNotifierProvider<ChangePasswordFormProvider, ChangePasswordFormState> changePasswordFormProvider;

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    changePasswordFormProvider =
        StateNotifierProvider((ref) => ChangePasswordFormProvider(gateway: getIt<ChangePasswordGateway>()));

    _newPasswordController.addListener(_updateConfirmNewPassword);
    _confirmNewPasswordController.addListener(_updateConfirmNewPassword);
  }

  @override
  void dispose() {
    super.dispose();
    _newPasswordController.removeListener(_updateConfirmNewPassword);
    _confirmNewPasswordController.removeListener(_updateConfirmNewPassword);

    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
  }

  void _updateConfirmNewPassword() {
    final message =
        _newPasswordController.text == _confirmNewPasswordController.text || _confirmNewPasswordController.text.isEmpty
            ? null
            : t.profile.edit.password.confirm_password_validation_message;

    ref.read(changePasswordFormProvider.notifier).updateConfirmNewPasswordValidity(message);
  }

  void _resetControllers() {
    _oldPasswordController.text = '';
    _newPasswordController.text = '';
    _confirmNewPasswordController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return AppWidget(
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              context.t.profile.edit.password.title,
              style: context.textStyle.body16Semibold,
            ),
          ),
          const SizedBox(height: 12.0),
          AppTextField.password(
            controller: _oldPasswordController,
            hint: t.profile.edit.password.old_password_hint,
            onValidationChanged: ref.read(changePasswordFormProvider.notifier).updateOldPasswordValidity,
          ),
          const SizedBox(height: 12.0),
          AppTextField.password(
            controller: _newPasswordController,
            enabled: ref.watch(changePasswordFormProvider.select((state) => state.isOldPasswordValid)) &&
                _oldPasswordController.text.isNotEmpty,
            hint: t.profile.edit.password.new_password_hint,
            onValidationChanged: ref.read(changePasswordFormProvider.notifier).updateNewPasswordValidity,
          ),
          const SizedBox(height: 12.0),
          AppTextField.password(
            controller: _confirmNewPasswordController,
            enabled: ref.watch(
                  changePasswordFormProvider.select((state) => state.isOldPasswordValid && state.isNewPasswordValid),
                ) &&
                _oldPasswordController.text.isNotEmpty &&
                _newPasswordController.text.isNotEmpty,
            hint: t.profile.edit.password.new_confirm_password_hint,
            validationMessage: ref.watch(
              changePasswordFormProvider.select((state) => state.isConfirmNewPasswordValid),
            )
                ? null
                : t.profile.edit.password.confirm_password_validation_message,
          ),
          const SizedBox(height: 16.0),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: AppButton(
              expanded: false,
              onTap: ref.watch(changePasswordFormProvider.select((state) => state.isPasswordsValid)) &&
                      _oldPasswordController.text.isNotEmpty &&
                      _newPasswordController.text.isNotEmpty &&
                      _confirmNewPasswordController.text.isNotEmpty
                  ? () async {
                      FocusScope.of(context).unfocus();

                      final email =
                          ref.read(authenticationProvider).mapOrNull(authenticated: (state) => state.user?.email);

                      if (email == null) {
                        return;
                      }

                      final result = await ref.read(changePasswordFormProvider.notifier).changePassword(
                            email: email,
                            oldPassword: _oldPasswordController.text,
                            newPassword: _newPasswordController.text,
                          );

                      if (result == true) {
                        _resetControllers();
                        _showSnackBar(
                          message: t.profile.edit.password.result.success,
                        );
                      } else {
                        if (!context.mounted) return;

                        _showSnackBar(
                          message: t.profile.edit.password.result.failed,
                          backgroundColor: context.palette.background.danger,
                        );
                      }
                    }
                  : null,
              child: Text(t.profile.edit.password.button),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar({
    required String message,
    Color? backgroundColor,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
        ),
      );
}
