part of 'sign_up_form_provider.dart';

class SignUpFormState {
  final String email;
  final String password;
  final String confirmPassword;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;

  const SignUpFormState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isEmailValid = false,
    this.isPasswordValid = false,
    this.isConfirmPasswordValid = false,
  });

  bool get isFormValid =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      isEmailValid &&
      isPasswordValid &&
      isConfirmPasswordValid;

  bool get isPasswordConfirm => password.isNotEmpty && isPasswordValid;

  bool get isConfirmedPassword => password.isNotEmpty && confirmPassword.isNotEmpty && password == confirmPassword;

  SignUpFormState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
  }) {
    return SignUpFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid: isConfirmPasswordValid ?? this.isConfirmPasswordValid,
    );
  }
}
