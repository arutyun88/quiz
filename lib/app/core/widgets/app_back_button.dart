import 'package:flutter/material.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: IconTheme(
        data: Theme.of(context).appBarTheme.iconTheme ??
            IconThemeData(
              size: 16.0,
              color: context.palette.text.primary,
            ),
        child: const BackButton(),
      ),
    );
  }
}
