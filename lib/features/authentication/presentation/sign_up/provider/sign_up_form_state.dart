part of 'sign_up_form_provider.dart';

class SignUpFormState {
  final String name;
  final String email;
  final String password;
  final DateTime? birthDate;
  final bool isEmailValid;
  final bool isPasswordValid;

  const SignUpFormState({
    this.name = '',
    this.email = '',
    this.password = '',
    this.birthDate,
    this.isEmailValid = false,
    this.isPasswordValid = false,
  });

  bool get isFormValid =>
      email.isNotEmpty && password.isNotEmpty && birthDate != null && isEmailValid && isPasswordValid;

  SignUpFormState copyWith({
    String? name,
    String? email,
    String? password,
    DateTime? birthDate,
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return SignUpFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      birthDate: birthDate ?? this.birthDate,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    );
  }
}
