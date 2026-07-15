import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/app/core/widgets/input/app_text_field_v2.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/user/domain/repository/change_password_gateway.dart';
import 'package:quiz/gen/strings.g.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _oldController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (final controller in [_oldController, _newController, _confirmController]) {
      controller.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _oldController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  bool get _isValid =>
      _oldController.text.isNotEmpty &&
      _newController.text.length >= 8 &&
      _confirmController.text == _newController.text;

  Future<void> _submit(VoidCallback complete) async {
    FocusScope.of(context).unfocus();
    final t = context.t.profile.edit.password_page;

    final result = await getIt<ChangePasswordGateway>().call(
      oldPassword: _oldController.text,
      newPassword: _newController.text,
    );
    complete();
    if (!mounted) return;

    switch (result) {
      case ResultOk():
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.success)),
        );
        context.pop();
      case ResultFailed():
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.failed),
            backgroundColor: context.palette.background.danger,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.profile.edit.password_page;

    return AppScaffold(
      title: t.title,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextFieldV2(
              label: t.old_label,
              controller: _oldController,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 18),
            AppTextFieldV2(
              label: t.new_label,
              hint: context.t.text_field.password.hint,
              controller: _newController,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 18),
            AppTextFieldV2(
              label: t.confirm_label,
              controller: _confirmController,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 28),
            AppButtonV2(
              label: t.save,
              onTap: _isValid ? _submit : null,
            ),
          ],
        ),
      ),
    );
  }
}
