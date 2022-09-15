import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:quiz/app/ui/uikit/const/icons_const.dart';
import 'package:quiz/app/ui/uikit/text_theme.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    Key? key,
    required ValueNotifier<String> time,
  })  : _time = time,
        super(key: key);

  final ValueNotifier<String> _time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(AppIcons.clockIcon),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: ValueListenableBuilder<String>(
                valueListenable: _time,
                builder: (context, time, child) {
                  return Text(
                    time,
                    style: AppTextStyle.manrope16W500.apply(
                      color: AppColors.blue,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
