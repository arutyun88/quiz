import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
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
        const _GoToEditWidget(),
      ],
    );
  }
}

class _GoToEditWidget extends StatelessWidget {
  const _GoToEditWidget();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.push('/profile/settings/edit'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Text(context.t.profile.settings.user.go_to_edit, style: context.textStyle.body14Regular),
            const Spacer(),
            Icon(Icons.navigate_next, color: context.palette.text.secondary),
          ],
        ),
      ),
    );
  }
}
