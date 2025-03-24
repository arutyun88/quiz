import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/widgets/app_widget.dart';
import 'package:quiz/app/core/widgets/button/app_button.dart';
import 'package:quiz/app/core/widgets/input/app_text_field.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/profile/domain/repository/change_user_name_gateway.dart';
import 'package:quiz/gen/strings.g.dart';

class ChangeMainInfoFormWidget extends ConsumerStatefulWidget {
  const ChangeMainInfoFormWidget({super.key});
  @override
  ConsumerState<ChangeMainInfoFormWidget> createState() => _ChangeNameFormWidgetState();
}

class _ChangeNameFormWidgetState extends ConsumerState<ChangeMainInfoFormWidget> {
  late final TextEditingController _nameController;
  late String? _initialName;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _initialName = ref.read(authenticationProvider).mapOrNull(authenticated: (state) => state.user?.name);

    _nameController = TextEditingController(text: _initialName);
    _nameController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateButtonState);
    _nameController.dispose();

    super.dispose();
  }

  void _updateButtonState() {
    final bool newState = _nameController.text.isNotEmpty && _nameController.text != _initialName;
    if (newState != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = newState;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            context.t.profile.edit.main.title,
            style: context.textStyle.body16Semibold,
          ),
          const SizedBox(height: 12.0),
          AppTextField(
            controller: _nameController,
            label: t.profile.edit.main.name.label,
            hint: t.profile.edit.main.name.hint,
            autocorrect: false,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 16.0),
          AppButton(
            expanded: false,
            onTap: _isButtonEnabled
                ? () async {
                    FocusScope.of(context).unfocus();

                    final result = await getIt<ChangeUserNameGateway>().call(name: _nameController.text);

                    switch (result) {
                      case ResultOk():
                        _showSnackBar(
                          message: t.profile.edit.main.name.result.success,
                        );

                        _initialName = _nameController.text;
                        _updateButtonState();
                        await ref.read(authenticationProvider.notifier).reload();
                      case ResultFailed():
                        if (!context.mounted) return;
                        _showSnackBar(
                          message: t.profile.edit.main.name.result.failed,
                          backgroundColor: context.palette.background.danger,
                        );
                    }
                  }
                : null,
            child: Text(t.profile.edit.password.button),
          ),
        ],
      ),
    );
  }

  void _showSnackBar({
    required String message,
    Color? backgroundColor,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
        ),
      );
}
