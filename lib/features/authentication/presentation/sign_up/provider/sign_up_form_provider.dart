import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'sign_up_form_state.dart';

class SignUpFormProvider extends StateNotifier<SignUpFormState> {
  SignUpFormProvider() : super(const SignUpFormState());

  void updateName(String value) => state = state.copyWith(name: value);

  void updateBirthDate(DateTime value) => state = state.copyWith(birthDate: value);

  void updateEmail(String value) => state = state.copyWith(email: value);

  void updatePassword(String value) => state = state.copyWith(password: value);

  void updateEmailValidity(String? message) => state = state.copyWith(isEmailValid: message == null);

  void updatePasswordValidity(String? message) => state = state.copyWith(isPasswordValid: message == null);
}
