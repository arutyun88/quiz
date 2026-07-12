import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/features/user/domain/entity/user_entity.dart';
import 'package:quiz/gen/strings.g.dart';

class ProfileUserBlock extends StatelessWidget {
  const ProfileUserBlock({
    super.key,
    required this.profile,
    required this.isPublic,
  });

  final UserEntity profile;
  final bool isPublic;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final subStyle = GoogleFonts.jetBrainsMono(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: colors.text.secondary,
    );

    return Row(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            border: Border.all(color: colors.text.primary, width: 1.5),
          ),
          alignment: Alignment.center,
          child: Text(
            _initials(profile),
            style: GoogleFonts.unbounded(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: isPublic ? colors.text.primary : colors.text.accent,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _displayName(profile),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.spectral(
                  fontSize: 21,
                  color: colors.text.primary,
                ),
              ),
              const SizedBox(height: 3),
              if (!isPublic && profile.email != null) ...[
                Text(
                  profile.email!.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: subStyle,
                ),
                const SizedBox(height: 1),
              ],
              Text(
                context.t.profile.view.member_since(
                  date: _memberSinceDate(profile.memberSince),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: subStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _displayName(UserEntity profile) {
    final name = profile.name?.trim();
    if (name != null && name.isNotEmpty) return name;
    return profile.email ?? '—';
  }

  String _initials(UserEntity profile) {
    final name = profile.name?.trim();
    if (name != null && name.isNotEmpty) {
      final parts = name.split(RegExp(r'\s+'));
      final initials = parts.take(2).map((part) => part[0]).join();
      return initials.toUpperCase();
    }

    final email = profile.email;
    if (email != null && email.isNotEmpty) return email[0].toUpperCase();

    return '?';
  }

  String _memberSinceDate(DateTime memberSince) {
    final locale = LocaleSettings.instance.currentLocale.languageCode;
    return DateFormat('MMMM yyyy', locale).format(memberSince).toUpperCase();
  }
}
