import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/features/settings/presentation/widgets/locale_change_widget.dart';
import 'package:quiz/features/settings/presentation/widgets/theme_switch_widget.dart';
import 'package:quiz/gen/strings.g.dart';

class SettingsFlow extends StatelessWidget {
  const SettingsFlow({super.key});

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
            const Spacer(),
            const SizedBox(height: 16.0),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(context.t.profile.application, style: context.textStyle.heading18Bold),
            ),
            const Divider(),
            const ProfileLocaleChangeWidget(),
            const Divider(),
            const ProfileThemeSwitchWidget(),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
