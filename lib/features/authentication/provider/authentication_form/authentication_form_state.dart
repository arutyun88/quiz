part of 'authentication_form_provider.dart';

class AuthenticationFormState {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;

  const AuthenticationFormState({
    this.email = '',
    this.password = '',
    this.isEmailValid = false,
    this.isPasswordValid = false,
  });

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty && isEmailValid && isPasswordValid;

  AuthenticationFormState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return AuthenticationFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    );
  }
}
