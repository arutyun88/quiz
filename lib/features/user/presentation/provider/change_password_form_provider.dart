import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/features/user/domain/repository/change_password_gateway.dart';

part 'change_password_form_state.dart';

class ChangePasswordFormProvider extends StateNotifier<ChangePasswordFormState> {
  final ChangePasswordGateway _gateway;

  ChangePasswordFormProvider({
    required ChangePasswordGateway gateway,
  })  : _gateway = gateway,
        super(const ChangePasswordFormState());

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final result = await _gateway.call(oldPassword: oldPassword, newPassword: newPassword);
    return result is ResultOk;
  }

  void updateOldPasswordValidity(String? message) => state = state.copyWith(isOldPasswordValid: message == null);

  void updateNewPasswordValidity(String? message) => state = state.copyWith(isNewPasswordValid: message == null);

  void updateConfirmNewPasswordValidity(String? message) =>
      state = state.copyWith(isConfirmNewPasswordValid: message == null);
}
