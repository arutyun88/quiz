import 'package:flutter/material.dart';
import 'package:quiz/app/config/style/text_style_ex.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class SettingsItemWidget extends StatelessWidget {
  const SettingsItemWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Text(title, style: context.textStyle.body14Regular),
            const Spacer(),
            Icon(Icons.navigate_next, color: context.palette.text.secondary),
          ],
        ),
      ),
    );
  }
}
