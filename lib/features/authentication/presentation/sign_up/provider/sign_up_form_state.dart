part of 'sign_up_form_provider.dart';

class SignUpFormState {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;

  const SignUpFormState({
    this.email = '',
    this.password = '',
    this.isEmailValid = false,
    this.isPasswordValid = false,
  });

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty && isEmailValid && isPasswordValid;

  SignUpFormState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return SignUpFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    );
  }
}
