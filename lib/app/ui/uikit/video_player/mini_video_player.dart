import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:quiz/app/ui/uikit/text_theme.dart';
import 'package:video_player/video_player.dart';

class MiniVideoPlayer extends StatelessWidget {
  const MiniVideoPlayer({
    Key? key,
    required VideoPlayerController videoPlayerController,
    required Function() playPauseOnPressed,
    required Function() muteOnPressed,
    required Function()? fullscreenOnPressed,
    required ValueNotifier<bool> play,
    required ValueNotifier<bool> mute,
    required ValueNotifier<String> timer,
  })  : _videoPlayerController = videoPlayerController,
        _fullscreenOnPressed = fullscreenOnPressed,
        _muteOnPressed = muteOnPressed,
        _playPauseOnPressed = playPauseOnPressed,
        _play = play,
        _mute = mute,
        _timer = timer,
        super(key: key);

  final VideoPlayerController _videoPlayerController;

  final Function() _playPauseOnPressed;
  final Function() _muteOnPressed;
  final Function()? _fullscreenOnPressed;

  final ValueNotifier<bool> _play;
  final ValueNotifier<bool> _mute;
  final ValueNotifier<String> _timer;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = screenWidth * 0.625;

    final double videoHeight;
    final double videoWidth;
    final controllerSize = _videoPlayerController.value.size;

    if (controllerSize.aspectRatio > 1.6) {
      videoHeight =
          controllerSize.height * (screenWidth / (controllerSize.width));
      videoWidth = screenWidth;
    } else {
      videoHeight = screenHeight;
      videoWidth =
          controllerSize.width * (screenHeight / controllerSize.height);
    }

    return Column(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
          ),
          clipBehavior: Clip.hardEdge,
          child: Center(
            child: SizedBox(
              width: videoWidth,
              height: videoHeight,
              child: VideoPlayer(_videoPlayerController),
            ),
          ),
        ),
        Container(
          width: screenWidth,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(12.0),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                offset: const Offset(0, 6),
                color: AppColors.greyBlue03.withOpacity(.15),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: ValueListenableBuilder<bool>(
              valueListenable: _play,
              builder: (context, play, child) {
                return Row(
                  children: [
                    CupertinoButton(
                      minSize: 0.0,
                      padding: EdgeInsets.zero,
                      onPressed: _playPauseOnPressed,
                      child: Icon(
                        play ? Icons.pause : Icons.play_arrow,
                        color: AppColors.white,
                        size: 28.0,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    ValueListenableBuilder<bool>(
                      valueListenable: _mute,
                      builder: (context, mute, child) {
                        return CupertinoButton(
                          minSize: 0.0,
                          padding: EdgeInsets.zero,
                          onPressed: _muteOnPressed,
                          child: Icon(
                            mute ? Icons.volume_off : Icons.volume_up,
                            color: AppColors.white,
                            size: 28.0,
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: ValueListenableBuilder<String>(
                          valueListenable: _timer,
                          builder: (context, time, child) {
                            return Text(
                              time,
                              style: AppTextStyle.manrope16W700.apply(
                                color: AppColors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    CupertinoButton(
                      minSize: 0.0,
                      padding: EdgeInsets.zero,
                      onPressed: null,
                      child: Icon(
                        Icons.settings,
                        color: AppColors.white.withOpacity(.5),
                        size: 24.0,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    CupertinoButton(
                      minSize: 0.0,
                      padding: EdgeInsets.zero,
                      onPressed: _fullscreenOnPressed,
                      child: const Icon(
                        Icons.fullscreen,
                        color: AppColors.white,
                        size: 28.0,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
