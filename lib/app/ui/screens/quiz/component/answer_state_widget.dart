import 'package:flutter/cupertino.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';

class AnswersStateWidget extends StatelessWidget {
  const AnswersStateWidget({
    Key? key,
    required this.width,
    required this.stepsState,
    required this.currentQuestion,
  })  : _dividerCount = stepsState.length - 1,
        _currentPointSize = width / 22.5,
        _otherPointSize = width / 30,
        super(key: key);
  final double width;
  final List<bool> stepsState;
  final int currentQuestion;

  final int _dividerCount;
  final double _currentPointSize;
  final double _otherPointSize;

  final double _horizontalPadding = 30.0;
  final double _dividerPadding = 3.0;

  @override
  Widget build(BuildContext context) {
    final double currentPointWeight = _currentPointSize + (_dividerPadding * 2);
    final double otherPointWeight =
        (stepsState.length - 1) * (_otherPointSize + (_dividerPadding * 2));
    final double pointsWeight = currentPointWeight + otherPointWeight;
    final double dividerWeight =
        (width - (_horizontalPadding * 2) - pointsWeight) /
            (stepsState.length - 1);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _horizontalPadding,
        vertical: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(stepsState.length, (index) {
          var outerColor = AppColors.greyLight;
          var innerColor = AppColors.greyBlue02;
          if (currentQuestion > index) {
            outerColor =
                stepsState[index] ? AppColors.green : AppColors.red;
            innerColor = AppColors.white;
          }
          return Row(
            children: [
              currentQuestion == index
                  ? Container(
                      height: _currentPointSize,
                      width: _currentPointSize,
                      decoration: const BoxDecoration(
                        color: AppColors.blueLight,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : Container(
                      height: _otherPointSize,
                      width: _otherPointSize,
                      decoration: BoxDecoration(
                        color: outerColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        decoration: BoxDecoration(
                          color: innerColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
              if (index < _dividerCount)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _dividerPadding),
                  child: Container(
                    width: dividerWeight,
                    height: 2,
                    decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
