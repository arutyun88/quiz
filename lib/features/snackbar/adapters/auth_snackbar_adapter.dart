import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/snackbar_message.dart';
import '../provider/snackbar_provider.dart';
import 'snackbar_adapter.dart';

// Заглушка для AuthState и authProvider
class AuthState {
  final bool hasError;
  final String? errorMessage;
  final bool sessionExpired;

  const AuthState({
    this.hasError = false,
    this.errorMessage,
    this.sessionExpired = false,
  });
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  void showLoginDialog() {}
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());

class AuthSnackbarAdapter extends SnackbarAdapter {
  const AuthSnackbarAdapter();

  @override
  String get id => 'auth_adapter';

  @override
  void initialize(WidgetRef ref) {
    ref.listen<AuthState>(authProvider, (previous, current) {
      final snackbarNotifier = ref.read(snackbarProvider.notifier);

      if (current.hasError) {
        final message = BasicSnackbarMessage(
          id: 'auth_error',
          message: current.errorMessage ?? 'Ошибка аутентификации',
          type: SnackbarType.error,
          priority: SnackbarPriority.high,
          groupId: 'auth',
          actions: [
            SnackbarAction(
              label: 'Войти заново',
              onPressed: () => ref.read(authProvider.notifier).showLoginDialog(),
            ),
          ],
        );
        snackbarNotifier.showSnackbar(message);
      } else if (previous?.hasError == true && !current.hasError) {
        // Ошибка исправлена
        snackbarNotifier.hideGroup('auth');
      }

      if (current.sessionExpired) {
        const message = BasicSnackbarMessage(
          id: 'session_expired',
          message: 'Сессия истекла. Необходимо войти заново.',
          type: SnackbarType.warning,
          priority: SnackbarPriority.critical,
          persistent: true,
          groupId: 'auth',
        );
        snackbarNotifier.showSnackbar(message);
      }
    });
  }
}
