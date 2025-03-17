part of 'sign_in_form_provider.dart';

class SignInFormState {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;

  const SignInFormState({
    this.email = '',
    this.password = '',
    this.isEmailValid = false,
    this.isPasswordValid = false,
  });

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty && isEmailValid && isPasswordValid;

  SignInFormState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return SignInFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    );
  }
}
