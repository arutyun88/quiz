import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'sign_up_form_state.dart';

class SignUpFormProvider extends StateNotifier<SignUpFormState> {
  SignUpFormProvider() : super(const SignUpFormState());

  void updateEmail(String value) => state = state.copyWith(email: value);

  void updatePassword(String value) {
    if (state.password != value && state.confirmPassword.isNotEmpty) {
      state = state.copyWith(
        password: value,
        isConfirmPasswordValid: state.confirmPassword == value,
      );
    } else {
      state = state.copyWith(password: value);
    }
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(
      confirmPassword: value,
      isConfirmPasswordValid: value == state.password,
    );
  }

  void updateEmailValidity(String? message) => state = state.copyWith(isEmailValid: message == null);

  void updatePasswordValidity(String? message) => state = state.copyWith(isPasswordValid: message == null);

  void confirmPasswordValidity(String? message) => state = state.copyWith(isConfirmPasswordValid: message == null);
}
