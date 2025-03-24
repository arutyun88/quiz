import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/widgets/app_bottom_sheet.dart';
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
  final locale = LocaleSettings.instance.currentLocale.languageCode;

  late final TextEditingController _nameController;
  late final TextEditingController _dateController;
  late String? _initialName;
  late DateTime? _initialDate;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    ref.read(authenticationProvider).mapOrNull(authenticated: (state) {
      _initialName = state.user?.name;
      _initialDate = state.user?.birthDate;
    });

    _nameController = TextEditingController(text: _initialName);
    _dateController = TextEditingController(
      text: _initialDate != null ? DateFormat.yMMMMd(locale).format(_initialDate!) : null,
    );

    _nameController.addListener(_updateButtonState);
    _dateController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateButtonState);
    _dateController.removeListener(_updateButtonState);

    _nameController.dispose();
    _dateController.dispose();

    super.dispose();
  }

  void _updateButtonState() {
    final bool newState = _isNameChanged || _isBirthDateChanged;
    if (newState != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = newState;
      });
    }
  }

  bool get _isNameChanged => _nameController.text.isNotEmpty && _nameController.text != _initialName;

  bool get _isBirthDateChanged {
    if (_dateController.text.isEmpty) return false;

    final parcedDate = DateFormat.yMMMMd(locale).tryParse(_dateController.text);
    return _initialDate?.year != parcedDate?.year ||
        _initialDate?.month != parcedDate?.month ||
        _initialDate?.day != parcedDate?.day;
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
          AppTextField.date(
            controller: _dateController,
            hint: t.profile.edit.main.date.hint,
            onTap: () async {
              final date = await _showDatePickerBottomSheet(context, initialDate: _initialDate);

              if (date != null) {
                _dateController.text = DateFormat.yMMMMd(locale).format(date);
              }
            },
          ),
          const SizedBox(height: 16.0),
          AppButton(
            expanded: false,
            onTap: _isButtonEnabled
                ? () async {
                    FocusScope.of(context).unfocus();

                    final parsedDate = DateFormat.yMMMMd(locale).tryParse(_dateController.text, true);

                    final result = await getIt<ChangeUserInfoGateway>().call(
                      name: _nameController.text,
                      birthDate: parsedDate,
                    );

                    switch (result) {
                      case ResultOk():
                        _showSnackBar(
                          message: t.profile.edit.main.result.success,
                        );

                        _initialName = _nameController.text;
                        _initialDate = parsedDate;

                        _updateButtonState();
                        await ref.read(authenticationProvider.notifier).reload();
                      case ResultFailed():
                        if (!context.mounted) return;
                        _showSnackBar(
                          message: t.profile.edit.main.result.failed,
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

  Future<DateTime?> _showDatePickerBottomSheet(
    BuildContext context, {
    required final DateTime? initialDate,
  }) async {
    final currentDate = DateTime.now();
    DateTime selectedDate = initialDate ?? DateTime(currentDate.year - 18, currentDate.month, currentDate.day);

    return await showAppBottomSheet(
      context,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                t.profile.edit.main.date.picker.title,
                style: context.textStyle.body16Semibold,
              ),
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              height: 220,
              child: CupertinoDatePicker(
                itemExtent: 50,
                initialDateTime: selectedDate,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (date) {
                  selectedDate = date;
                },
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              children: [
                Flexible(
                  child: AppButton(
                    scope: ButtonScope.secondary,
                    onTap: () => context.pop(),
                    child: Text(t.profile.edit.main.date.picker.button.cancel),
                  ),
                ),
                const SizedBox(width: 16.0),
                Flexible(
                  child: AppButton(
                    onTap: () => context.pop(selectedDate),
                    child: Text(t.profile.edit.main.date.picker.button.apply),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
