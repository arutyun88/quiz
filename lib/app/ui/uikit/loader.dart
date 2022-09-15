import 'package:flutter/cupertino.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  final Color? color;
  final double size;

  const Loader({
    Key? key,
    this.color,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.horizontalRotatingDots(
        color: color ?? AppColors.white,
        size: size,
      ),
    );
  }
}
