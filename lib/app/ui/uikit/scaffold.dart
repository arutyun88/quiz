import 'package:flutter/cupertino.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:quiz/app/ui/uikit/main_theme.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold(
      {Key? key,
      required this.body,
      this.leading,
      this.action,
      this.leadingOnPressed,
      this.actionOnPressed,
      this.height = 52,
      this.title,
      this.titleWidget,
      this.backGroundColor,
      this.avoidBottomPadding,
      this.boxDecoration})
      : super(key: key);
  final Widget body;
  final Widget? leading;
  final Widget? action;
  final String? title;
  final Widget? titleWidget;
  final VoidCallback? leadingOnPressed;
  final VoidCallback? actionOnPressed;
  final double height;
  final Color? backGroundColor;
  final bool? avoidBottomPadding;
  final BoxDecoration? boxDecoration;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: avoidBottomPadding ?? true,
      backgroundColor: backGroundColor ?? AppColors.blueLight,
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                    height: height,
                    color: boxDecoration != null ? AppColors.white : null,
                    child: Container(
                      decoration: boxDecoration,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: leadingOnPressed,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              color: AppColors.transparent,
                              height: height,
                              child: Center(child: leading),
                            ),
                          ),
                          const Spacer(),
                          titleWidget == null
                              ? Text(title ?? '',
                                  style: mainTheme.textTheme.textStyle)
                              : titleWidget!,
                          const Spacer(),
                          GestureDetector(
                            onTap: actionOnPressed,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: SizedBox(
                                height: height,
                                child: Center(child: action),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                body,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
