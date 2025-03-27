import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/features/settings/presentation/widgets/settings_item_widget.dart';
import 'package:quiz/gen/strings.g.dart';

class UserSettingsWidget extends StatelessWidget {
  const UserSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(context.t.profile.settings.user.title, style: context.textStyle.heading18Bold),
        ),
        const Divider(),
        SettingsItemWidget(
          title: context.t.profile.settings.user.go_to_edit,
          onTap: () => context.push('/profile/settings/edit'),
        ),
        const Divider(),
        SettingsItemWidget(
          title: context.t.profile.settings.user.go_to_notifications_settings,
          onTap: null,
        ),
        const Divider(),
        SettingsItemWidget(
          title: context.t.profile.settings.user.go_to_subscriptions,
          onTap: null,
        ),
      ],
    );
  }
}
