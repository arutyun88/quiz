import 'package:flutter/cupertino.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';

class MediaContentWidget extends StatelessWidget {
  const MediaContentWidget({
    Key? key,
    required this.onPressed,
    required this.image,
    required this.answered,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget image;
  final ValueNotifier<bool> answered;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 20.0,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 6),
              color: AppColors.greyBlue03.withOpacity(.15),
            ),
          ],
        ),
        child: ValueListenableBuilder<bool>(
            valueListenable: answered,
            builder: (context, answeredState, child) {
              return GestureDetector(
                onTap: answeredState ? null : onPressed,
                child: image,
              );
            }),
      ),
    );
  }
}
