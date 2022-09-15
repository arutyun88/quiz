import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz/app/domain/model/quiz_answer_model.dart';
import 'package:quiz/app/domain/model/quiz_item_model.dart';
import 'package:quiz/app/domain/model/quiz_model.dart';
import 'package:quiz/app/ui/screens/quiz/component/answer_state_widget.dart';
import 'package:quiz/app/ui/screens/quiz/component/media_content_widget.dart';
import 'package:quiz/app/ui/screens/quiz/component/possible_answer_button.dart';
import 'package:quiz/app/ui/screens/quiz/component/question_widget.dart';
import 'package:quiz/app/ui/screens/quiz/component/timer_widget.dart';
import 'package:quiz/app/ui/state/quiz/quiz_cubit.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:quiz/app/ui/uikit/const/dictionary_const.dart';
import 'package:quiz/app/ui/uikit/const/icons_const.dart';
import 'package:quiz/app/ui/uikit/loader.dart';
import 'package:quiz/app/ui/uikit/text_theme.dart';
import 'package:quiz/app/ui/uikit/video_builder.dart';

class SimpleQuizPage extends StatelessWidget {
  const SimpleQuizPage({
    Key? key,
    required QuizModel quiz,
  })  : _quiz = quiz,
        super(key: key);
  final QuizModel _quiz;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizCubit(),
      child: SimpleQuizView(quiz: _quiz),
    );
  }
}

class SimpleQuizView extends StatefulWidget {
  SimpleQuizView({
    Key? key,
    required QuizModel quiz,
  })  : _id = quiz.id,
        super(key: key);
  final int _id;

  @override
  State<SimpleQuizView> createState() => _SimpleQuizViewState();
}

class _SimpleQuizViewState extends State<SimpleQuizView>
    with TickerProviderStateMixin {
  late List<QuizItemModel> _questions;
  late ValueNotifier<List<bool>> _answersState;
  late ValueNotifier<int> _currentQuestion;
  late Image _image;
  late OverlayEntry? entry;

  late Timer _timer;
  late ValueNotifier<int> _time;
  late ValueNotifier<String> _timerStr;
  late ValueNotifier<String> _question;

  late Size _imageSize;

  late AnimationController _questionAnimationController;
  late Animation<double> _questionAnimation;

  late OverlayState? _overlay;
  late AnimationController _backgroundOpacityAnimationController;
  late AnimationController _imageOpacityAnimationController;
  late Animation<double> _backgroundOpacityAnimation;
  late Animation<double> _imageOpacityAnimation;

  late ValueNotifier<bool> _isAnswered;

  late int? _answeredIndex;

  late ValueNotifier<bool> _timerStarted;
  late ValueNotifier<bool> _viewed;

  late bool _received = false;

  @override
  void initState() {
    super.initState();

    context.read<QuizCubit>().getSimpleQuiz(widget._id).then(
      (value) {
        if (context.read<QuizCubit>().state is QuizSimpleReceived) {
          var state = context.read<QuizCubit>().state as QuizSimpleReceived;
          _questions = state.games;

          _timerStarted = ValueNotifier(false);
          _viewed = ValueNotifier(false);
          _answersState = ValueNotifier(
            List.generate(_questions.length, (_) => false),
          );
          _currentQuestion = ValueNotifier(0);
          _question =
              ValueNotifier(_questions[_currentQuestion.value].url ?? '');
          _time = ValueNotifier(_questions[0].time);
          _timerStr = ValueNotifier('');
          _calculationTime();
          _timer = _createTimer();
          entry = null;
          _overlay = null;

          _questionAnimationController = AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 100),
          );
          _questionAnimation = Tween(
            begin: 1.0,
            end: 0.0,
          ).animate(_questionAnimationController)
            ..addListener(_questionAnimationListener);

          _backgroundOpacityAnimationController = AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 100),
          );
          _backgroundOpacityAnimation = Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(_backgroundOpacityAnimationController);

          _imageOpacityAnimationController = AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 200),
          );
          _imageOpacityAnimation = Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(_imageOpacityAnimationController);

          _isAnswered = ValueNotifier(false);
          _answeredIndex = null;
        }

        _received = context.read<QuizCubit>().state is QuizSimpleReceived;
      },
    );
  }

  @override
  void dispose() {
    if (_received) {
      if (_timer.isActive) {
        _timer.cancel();
      }
      _currentQuestion.dispose();
      _timerStr.dispose();
      _questionAnimation.removeListener(_questionAnimationListener);
      _questionAnimationController.dispose();
      _imageOpacityAnimationController.dispose();
      _backgroundOpacityAnimationController.dispose();

      _isAnswered.dispose();
    }

    super.dispose();
  }

  Timer _createTimer() => Timer.periodic(
        const Duration(seconds: 1),
        (timer) async {
          if (_isAnswered.value) return;
          if (_questions[_currentQuestion.value].url != null) {
            if (!_timerStarted.value) return;
          } else {
            _timerStarted.value = true;
          }

          if (_time.value != 0) {
            if (_time.value <= 3) {
              _closeImage();
            }
            _time.value -= 1;
            _calculationTime();
          } else {
            _answersState.value = _checkAnswer(null);
            _changeStep();
          }
        },
      );

  void _questionAnimationListener() => setState(() {});

  Future<void> _changeStep() async {
    _isAnswered.value = true;
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      _isAnswered.value = false;
      _answeredIndex = null;
      _timerStarted.value = false;
      _viewed.value = false;
      if (_currentQuestion.value != _questions.length - 1) {
        _questionAnimationController.forward().whenComplete(() {
          _currentQuestion.value += 1;
          _time.value = _questions[_currentQuestion.value].time;
          _question.value = _questions[_currentQuestion.value].url ?? '';
          _calculationTime();
          _questionAnimationController.reset();
          _isAnswered.value = false;
        });
      } else {
        Navigator.of(context).pop();
      }
    }).onError((error, stackTrace) => null);
  }

  void _calculationTime() {
    var minute = (_time.value ~/ 60).toString().padLeft(2, '0');
    var second = (_time.value % 60).toString().padLeft(2, '0');
    _timerStr.value = '$minute : $second';
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      child: SafeArea(
        bottom: false,
        child: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is QuizSimpleReceived) {
              return ValueListenableBuilder<int>(
                valueListenable: _currentQuestion,
                builder: (context, question, child) {
                  return Column(
                    children: [
                      ValueListenableBuilder<List<bool>>(
                          valueListenable: _answersState,
                          builder: (context, stepsState, child) {
                            return AnswersStateWidget(
                              width: width,
                              stepsState: stepsState,
                              currentQuestion: question,
                            );
                          }),
                      TimerWidget(time: _timerStr),
                      Flexible(
                        child: Opacity(
                          opacity: _questionAnimation.value,
                          child: CustomScrollView(
                            physics: const ClampingScrollPhysics(),
                            slivers: [
                              SliverFillRemaining(
                                hasScrollBody: false,
                                child: Column(
                                  children: [
                                    QuestionWidget(
                                      width: width,
                                      currentQuestionNumber: question,
                                      question:
                                          _questions[question].description,
                                    ),
                                    if (_questions[question].url != null)
                                      _questions[question].gameType ==
                                              QuizItemType.image
                                          ? FutureBuilder<Size>(
                                              future:
                                                  _calculateImageDimension(),
                                              builder: _imageBuilder,
                                            )
                                          : ValueListenableBuilder<String>(
                                              valueListenable: _question,
                                              builder: (context, question, _) {
                                                return VideoBuilder(
                                                  url: question,
                                                  timerStarted: _timerStarted,
                                                  time: _time,
                                                  viewed: _viewed,
                                                );
                                              },
                                            ),
                                    const Spacer(),
                                    ValueListenableBuilder<bool>(
                                        valueListenable: _timerStarted,
                                        builder: (context, show, child) {
                                          if (show) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 20.0,
                                                horizontal: 16.0,
                                              ),
                                              child:
                                                  ValueListenableBuilder<bool>(
                                                      valueListenable:
                                                          _isAnswered,
                                                      builder: (context,
                                                          clicked, child) {
                                                        return Column(
                                                          children:
                                                              List.generate(
                                                            _questions[question]
                                                                .answers
                                                                .length,
                                                            (index) {
                                                              final answer =
                                                                  _questions[question]
                                                                          .answers[
                                                                      index];
                                                              return PossibleAnswerButton(
                                                                answer: answer,
                                                                buttonColor:
                                                                    _setButtonColor(
                                                                        answer,
                                                                        index),
                                                                textColor:
                                                                    _setButtonTextColor(
                                                                        index),
                                                                icon:
                                                                    _setButtonIcon(
                                                                        answer,
                                                                        index),
                                                                onPressed:
                                                                    clicked
                                                                        ? null
                                                                        : () {
                                                                            _isAnswered.value =
                                                                                true;
                                                                            _answeredIndex =
                                                                                index;
                                                                            _answersState.value =
                                                                                _checkAnswer(answer.isCorrect);
                                                                            _changeStep();
                                                                          },
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      }),
                                            );
                                          } else {
                                            return const SizedBox.shrink();
                                          }
                                        }),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else if (state is QuizRequested) {
              return const Center(
                child: Loader(color: AppColors.blue),
              );
            } else {
              return Center(
                child: Text(
                  AppDictionary.networkError,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.manrope14W400.apply(
                    color: AppColors.blue.withOpacity(.7),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  List<bool> _checkAnswer(bool? correct) {
    final tempList = _answersState.value;
    List<bool> result = [];
    for (int i = 0; i < tempList.length; i++) {
      if (i == _currentQuestion.value) {
        result.add(correct ?? false);
      } else {
        result.add(tempList[i]);
      }
    }
    return result;
  }

  Color? _setButtonColor(QuizAnswerModel answer, int index) {
    if (_isAnswered.value) {
      if (_answeredIndex != null && _answeredIndex == index) {
        if (answer.isCorrect) {
          return AppColors.green;
        }
        return AppColors.red;
      }
      return AppColors.grey.withOpacity(.05);
    }
    return null;
  }

  Color? _setButtonTextColor(int? index) {
    if (_isAnswered.value &&
        _answeredIndex != null &&
        _answeredIndex == index) {
      return AppColors.white;
    }
    return null;
  }

  Widget _setButtonIcon(QuizAnswerModel answer, int index) {
    var state =
        _isAnswered.value && _answeredIndex != null && _answeredIndex == index;
    final iconColor = _setButtonColor(answer, index);
    return Container(
      width: MediaQuery.of(context).size.width / 12,
      height: MediaQuery.of(context).size.width / 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: !state ? Border.all(width: 1.0, color: AppColors.greyBlue02) : null,
        color: state ? AppColors.white : AppColors.transparent,
      ),
      child: Center(
        child: state
            ? answer.isCorrect
                ? SvgPicture.asset(AppIcons.correctIcon, color: iconColor)
                : SvgPicture.asset(AppIcons.cancelIcon, color: iconColor)
            : Text(
                answer.variant,
                style:
                    AppTextStyle.manrope16W500.apply(color: AppColors.greyBlue02),
              ),
      ),
    );
  }

  Widget _imageBuilder(BuildContext context, AsyncSnapshot<Size> snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      _imageSize = snapshot.data!;
    }

    return ValueListenableBuilder<bool>(
        valueListenable: _timerStarted,
        builder: (context, show, child) {
          if (show) {
            return ValueListenableBuilder<int>(
              valueListenable: _time,
              builder: (context, val, child) {
                return MediaContentWidget(
                  onPressed: val > 3 ? _openImage : null,
                  image: _image,
                  answered: _isAnswered,
                );
              },
            );
          } else {
            return CupertinoButton(
              onPressed: _openImage,
              child: Text(
                'Показать\nизображение',
                textAlign: TextAlign.center,
                style: AppTextStyle.manrope24W600.apply(
                  color: AppColors.greyBlue01,
                ),
              ),
            );
          }
        });
  }

  Future<Size> _calculateImageDimension() {
    Completer<Size> completer = Completer();
    _image = Image(image: _buildImage());
    _image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          Size size = Size(
            image.image.width.toDouble(),
            image.image.height.toDouble(),
          );
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }

  CachedNetworkImageProvider _buildImage() {
    return CachedNetworkImageProvider(_questions[_currentQuestion.value].url!);
  }

  void _openImage() {
    const double minScale = 1.0;
    double maxScaleCalc = 1.0;
    if (_imageSize.height < _imageSize.width) {
      maxScaleCalc = MediaQuery.of(context).size.height /
          (_imageSize.height *
              (MediaQuery.of(context).size.width / _imageSize.width));
    } else {
      maxScaleCalc = MediaQuery.of(context).size.height / _imageSize.height;
    }
    final double maxScale = maxScaleCalc < minScale ? minScale : maxScaleCalc;

    entry = OverlayEntry(
      builder: (context) {
        return Opacity(
          opacity: _backgroundOpacityAnimation.value,
          child: CupertinoPageScaffold(
            backgroundColor: AppColors.black,
            child: _backgroundOpacityAnimation.value >= 1.0
                ? Center(
                    child: GestureDetector(
                      onTap: _closeImage,
                      child: InteractiveViewer(
                        clipBehavior: Clip.none,
                        minScale: minScale,
                        maxScale: maxScale,
                        child: Opacity(
                          opacity: _imageOpacityAnimation.value,
                          child: _image,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        );
      },
    );
    _overlay = Overlay.of(context);
    _backgroundOpacityAnimationController.addListener(_overlayListener);
    _imageOpacityAnimationController.addListener(_overlayListener);
    _overlay?.insert(entry!);
    _backgroundOpacityAnimationController.forward().whenComplete(() {
      _imageOpacityAnimationController.forward();
    });
  }

  void _overlayListener() => _overlay?.setState(() {});

  void _closeImage() {
    if (entry != null) {
      _imageOpacityAnimationController.reverse().whenComplete(
            () => _backgroundOpacityAnimationController.reverse().whenComplete(
              () {
                entry?.remove();
                entry = null;
                _backgroundOpacityAnimationController
                    .removeListener(_overlayListener);
                _timerStarted.value = true;
              },
            ),
          );
    }
  }
}
