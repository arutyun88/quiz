import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/core/widgets/button/app_button.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/settings/presentation/widgets/application_settings_widget.dart';
import 'package:quiz/features/settings/presentation/widgets/user_settings_widget.dart';
import 'package:quiz/gen/strings.g.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authenticationProvider).isAuthenticated;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.profile.settings.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10.0),
          if (!isAuthenticated) ...[
            const AppWidget(child: _SignInButtonWidget()),
            const SizedBox(height: 10.0),
          ] else ...[
            const AppWidget(child: UserSettingsWidget()),
            const SizedBox(height: 10.0),
          ],
          const AppWidget(child: ApplicationSettingsWidget()),
          const SizedBox(height: 10.0),
          if (isAuthenticated) ...[
            const AppWidget(
              child: _SignOutButtonWidget(),
            ),
            const SizedBox(height: 16.0),
          ]
        ],
      ),
    );
  }
}

class _SignInButtonWidget extends StatelessWidget {
  const _SignInButtonWidget();

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: () async {
        context.push('/login');
      },
      child: Text(context.t.profile.settings.sign_in),
    );
  }
}

class _SignOutButtonWidget extends ConsumerWidget {
  const _SignOutButtonWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      scope: ButtonScope.secondary,
      onTap: () {
        ref.read(authenticationProvider.notifier).logout();
      },
      child: Text(context.t.profile.settings.sign_out),
    );
  }
}
