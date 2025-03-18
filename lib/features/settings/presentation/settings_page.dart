import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/features/settings/presentation/application_settings_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/login'),
              child: const Text('auth'),
            ),
            const Spacer(),
            const SizedBox(height: 16.0),
            const ApplicationSettingsWidget(),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
