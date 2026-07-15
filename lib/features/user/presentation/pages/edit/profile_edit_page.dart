import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/core/widgets/dialog/app_confirm_dialog.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/features/user/domain/repository/change_user_info_gateway.dart';
import 'package:quiz/gen/strings.g.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({super.key});

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  late final TextEditingController _nameController;
  String? _initialName;

  @override
  void initState() {
    super.initState();
    _initialName = _user?.name;
    _nameController = TextEditingController(text: _initialName);
    _nameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  UserEntity? get _user => ref.read(authenticationProvider).mapOrNull(authenticated: (state) => state.user);

  bool get _isNameChanged => _nameController.text.trim().isNotEmpty && _nameController.text.trim() != _initialName;

  Future<void> _save() async {
    FocusScope.of(context).unfocus();

    final result = await getIt<ChangeUserInfoGateway>().call(name: _nameController.text.trim());

    switch (result) {
      case ResultOk():
        await ref.read(authenticationProvider.notifier).reload();
        if (mounted) context.pop();
      case ResultFailed():
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.profile.edit.save_failed),
            backgroundColor: context.palette.background.danger,
          ),
        );
    }
  }

  Future<void> _deleteAccount() async {
    final t = context.t.profile.edit.delete_dialog;

    final confirmed = await showAppConfirmDialog(
      context,
      title: t.title,
      message: t.message,
      confirmLabel: t.confirm,
      cancelLabel: t.cancel,
      danger: true,
    );
    if (!confirmed || !mounted) return;

    final deleted = await ref.read(authenticationProvider.notifier).deleteAccount();
    if (!mounted) return;

    if (deleted) {
      context.go('/profile/settings');
    } else {
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
    final colors = context.palette;
    final t = context.t.profile.edit;
    final user = ref.watch(authenticationProvider).mapOrNull(authenticated: (state) => state.user);

    return AppScaffold(
      title: t.title,
      trailing: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _isNameChanged ? _save : null,
        child: Text(
          t.done.toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: _isNameChanged ? colors.text.accent : colors.text.secondary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: _UserBadge(user: user)),
            const SizedBox(height: 22),
            _FieldLabel(label: t.name_label),
            TextField(
              controller: _nameController,
              autocorrect: false,
              textCapitalization: TextCapitalization.words,
              style: GoogleFonts.spectral(fontSize: 18, color: colors.text.primary),
              cursorColor: colors.text.primary,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: _valueBorder(colors.divider),
                enabledBorder: _valueBorder(colors.divider),
                focusedBorder: _valueBorder(colors.text.primary),
              ),
            ),
            const SizedBox(height: 8),
            _FieldLabel(label: t.email_label),
            _FieldValue(text: user?.email ?? ''),
            const SizedBox(height: 8),
            _FieldLabel(label: t.password_label),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.push('/profile/settings/edit/password'),
              child: _FieldValue(
                text: t.change_password,
                color: colors.text.accent,
              ),
            ),
            const SizedBox(height: 28),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _deleteAccount,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  t.delete_account.toUpperCase(),
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    color: colors.text.danger,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  UnderlineInputBorder _valueBorder(Color color) =>
      UnderlineInputBorder(borderSide: BorderSide(color: color, width: 1));
}

class _UserBadge extends StatelessWidget {
  const _UserBadge({required this.user});

  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final locale = LocaleSettings.instance.currentLocale.languageCode;
    final memberSince = user?.memberSince;

    return Column(
      children: [
        Container(
          width: 78,
          height: 78,
          decoration: BoxDecoration(
            border: Border.all(color: colors.text.primary, width: 1.5),
          ),
          alignment: Alignment.center,
          child: Text(
            _initials(user?.name),
            style: GoogleFonts.unbounded(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: colors.text.accent,
            ),
          ),
        ),
        if (memberSince != null) ...[
          const SizedBox(height: 10),
          Text(
            context.t.profile.view
                .member_since(date: DateFormat('MMMM yyyy', locale).format(memberSince))
                .toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: colors.text.secondary,
            ),
          ),
        ],
      ],
    );
  }

  String _initials(String? name) {
    final parts = (name ?? '').trim().split(RegExp(r'\s+')).where((part) => part.isNotEmpty);
    if (parts.isEmpty) return '?';
    return parts.take(2).map((part) => part[0]).join().toUpperCase();
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colors.text.primary, width: 1.5)),
      ),
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.jetBrainsMono(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 2,
          color: colors.text.secondary,
        ),
      ),
    );
  }
}

class _FieldValue extends StatelessWidget {
  const _FieldValue({required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colors.divider)),
      ),
      child: Text(
        text,
        style: GoogleFonts.spectral(fontSize: 18, color: color ?? colors.text.primary),
      ),
    );
  }
}
