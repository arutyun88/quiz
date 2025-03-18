import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/core/widgets/button/app_button.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/settings/presentation/application_settings_widget.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24.0),
            if (!isAuthenticated) ...[
              const _SignInButtonWidget(),
              const SizedBox(height: 24.0),
            ],
            const Spacer(),
            const SizedBox(height: 16.0),
            const ApplicationSettingsWidget(),
            const SizedBox(height: 24.0),
            if (isAuthenticated) ...[
              const _SignOutButtonWidget(),
              const SizedBox(height: 24.0),
            ]
          ],
        ),
      ),
    );
  }
}

class _SignInButtonWidget extends StatelessWidget {
  const _SignInButtonWidget();

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: () => context.push('/login'),
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
