import 'package:flutter/material.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/profile/presentation/widgets/change_password_form_widget.dart';
import 'package:quiz/gen/strings.g.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSubheaderedScaffold(
      isScrollable: true,
      appBar: AppBar(title: Text(t.profile.edit.title)),
      body: const Column(
        children: [
          ChangePasswordFormWidget(),
        ],
      ),
    );
  }
}
