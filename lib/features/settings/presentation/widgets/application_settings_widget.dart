import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/features/settings/presentation/widgets/locale_change_widget.dart';
import 'package:quiz/features/settings/presentation/widgets/theme_switch_widget.dart';
import 'package:quiz/gen/strings.g.dart';

class ApplicationSettingsWidget extends StatelessWidget {
  const ApplicationSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(context.t.profile.settings.application.title, style: context.textStyle.heading18Bold),
        ),
        const Divider(),
        const ProfileLocaleChangeWidget(),
        const Divider(),
        const ProfileThemeSwitchWidget()
      ],
    );
  }
}
