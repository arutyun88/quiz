import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:quiz/app/ui/uikit/text_theme.dart';
import 'package:video_player/video_player.dart';

class FullscreenVideoPlayerControlPanel extends StatefulWidget {
  const FullscreenVideoPlayerControlPanel({
    Key? key,
    required VideoPlayerController videoPlayerController,
    required Function() playPauseOnPressed,
    required Function() muteOnPressed,
    required Function() fullscreenOnPressed,
    required ValueNotifier<bool> play,
    required ValueNotifier<bool> mute,
    required ValueNotifier<String> timer,
    required ValueNotifier<bool> viewed,
    required Size screenSize,
  })  : _videoPlayerController = videoPlayerController,
        _fullscreenOnPressed = fullscreenOnPressed,
        _muteOnPressed = muteOnPressed,
        _playPauseOnPressed = playPauseOnPressed,
        _play = play,
        _mute = mute,
        _timer = timer,
        _screenSize = screenSize,
        _viewed = viewed,
        super(key: key);

  final VideoPlayerController _videoPlayerController;

  final Function() _playPauseOnPressed;
  final Function() _muteOnPressed;
  final Function() _fullscreenOnPressed;

  final ValueNotifier<bool> _play;
  final ValueNotifier<bool> _mute;
  final ValueNotifier<String> _timer;

  final Size _screenSize;

  final ValueNotifier<bool> _viewed;

  @override
  State<FullscreenVideoPlayerControlPanel> createState() =>
      _FullscreenVideoPlayerControlPanelState();
}

class _FullscreenVideoPlayerControlPanelState
    extends State<FullscreenVideoPlayerControlPanel> {
  @override
  void initState() {
    super.initState();
    widget._videoPlayerController.addListener(_listenerViews);
  }

  @override
  void dispose() {
    widget._videoPlayerController.removeListener(_listenerViews);
    super.dispose();
  }

  void _listenerViews() {
    if (widget._viewed.value) return;
    setState(() {
      if (widget._videoPlayerController.value.position >=
          widget._videoPlayerController.value.duration) {
        widget._viewed.value = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget._screenSize.width,
      color: AppColors.black.withOpacity(.25),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16,
        ),
        child: Row(
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: widget._play,
              builder: (context, play, child) {
                return CupertinoButton(
                  minSize: 0.0,
                  padding: EdgeInsets.zero,
                  onPressed: widget._playPauseOnPressed,
                  child: Icon(
                    play ? Icons.pause : Icons.play_arrow,
                    color: AppColors.white,
                    size: 28.0,
                  ),
                );
              },
            ),
            SizedBox(width: widget._screenSize.width / 20),
            ValueListenableBuilder<bool>(
              valueListenable: widget._mute,
              builder: (context, mute, child) {
                return CupertinoButton(
                  minSize: 0.0,
                  padding: EdgeInsets.zero,
                  onPressed: widget._muteOnPressed,
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
                  valueListenable: widget._timer,
                  builder: (context, time, child) => Text(
                    time,
                    style: AppTextStyle.manrope16W700.apply(
                      color: AppColors.white,
                    ),
                  ),
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
            SizedBox(width: widget._screenSize.width / 20),
            ValueListenableBuilder<bool>(
                valueListenable: widget._viewed,
                builder: (context, viewed, child) {
                  return CupertinoButton(
                    minSize: 0.0,
                    padding: EdgeInsets.zero,
                    onPressed: viewed ? widget._fullscreenOnPressed : null,
                    child: Icon(
                      Icons.fullscreen_exit,
                      color: viewed
                          ? AppColors.white
                          : AppColors.white.withOpacity(.5),
                      size: 28.0,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
