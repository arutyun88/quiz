part of 'change_password_form_provider.dart';

class ChangePasswordFormState {
  final bool isOldPasswordValid;
  final bool isNewPasswordValid;
  final bool isConfirmNewPasswordValid;

  const ChangePasswordFormState({
    this.isOldPasswordValid = false,
    this.isNewPasswordValid = false,
    this.isConfirmNewPasswordValid = false,
  });

  bool get isPasswordsValid => isOldPasswordValid && isNewPasswordValid && isConfirmNewPasswordValid;

  ChangePasswordFormState copyWith({
    bool? isOldPasswordValid,
    bool? isNewPasswordValid,
    bool? isConfirmNewPasswordValid,
  }) {
    return ChangePasswordFormState(
      isOldPasswordValid: isOldPasswordValid ?? this.isOldPasswordValid,
      isNewPasswordValid: isNewPasswordValid ?? this.isNewPasswordValid,
      isConfirmNewPasswordValid: isConfirmNewPasswordValid ?? this.isConfirmNewPasswordValid,
    );
  }
}
