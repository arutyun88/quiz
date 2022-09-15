import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:quiz/app/ui/uikit/text_theme.dart';

final CupertinoThemeData mainTheme = CupertinoThemeData(
  primaryColor: Colors.transparent,
  scaffoldBackgroundColor: AppColors.blueLight,
  barBackgroundColor: AppColors.white,
  textTheme: CupertinoTextThemeData(
    textStyle: AppTextStyle.manrope14W400.apply(color: AppColors.white),
    actionTextStyle: AppTextStyle.manrope16W500.apply(color: AppColors.white),
  ),
);
