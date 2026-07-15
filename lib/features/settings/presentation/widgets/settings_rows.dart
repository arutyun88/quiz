import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class SettingsSectionLabel extends StatelessWidget {
  const SettingsSectionLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      '// ${label.toUpperCase()}',
      style: GoogleFonts.jetBrainsMono(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 2,
        color: context.palette.text.accent,
      ),
    );
  }
}

class SettingsRowGroup extends StatelessWidget {
  const SettingsRowGroup({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return Column(
      children: [
        for (var i = 0; i < children.length; i++)
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: i == 0 ? BorderSide(color: colors.text.primary, width: 1.5) : BorderSide(color: colors.divider),
                bottom: i == children.length - 1 ? BorderSide(color: colors.text.primary, width: 1.5) : BorderSide.none,
              ),
            ),
            child: children[i],
          ),
      ],
    );
  }
}

class SettingsLinkRow extends StatelessWidget {
  const SettingsLinkRow({
    super.key,
    required this.label,
    this.value,
    this.onTap,
  });

  final String label;
  final String? value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  color: colors.text.primary,
                ),
              ),
            ),
            if (value != null)
              Text(
                value!.toUpperCase(),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: colors.text.secondary,
                ),
              )
            else
              Icon(Icons.arrow_forward, size: 20, color: colors.text.primary),
          ],
        ),
      ),
    );
  }
}
