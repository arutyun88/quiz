import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'sign_in_form_state.dart';

class SignInFormProvider extends StateNotifier<SignInFormState> {
  SignInFormProvider() : super(const SignInFormState());

  void updateEmail(String value) => state = state.copyWith(email: value);

  void updatePassword(String value) => state = state.copyWith(password: value);

  void updateEmailValidity(String? message) => state = state.copyWith(isEmailValid: message == null);

  void updatePasswordValidity(String? message) => state = state.copyWith(isPasswordValid: message == null);
}
