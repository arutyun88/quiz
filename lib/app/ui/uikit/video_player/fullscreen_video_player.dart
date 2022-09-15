import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/ui/uikit/video_player/fullscreen_video_player_control_panel.dart';
import 'package:video_player/video_player.dart';

class FullscreenVideoPlayer extends StatefulWidget {
  const FullscreenVideoPlayer({
    Key? key,
    required VideoPlayerController videoPlayerController,
    required Function() playPauseOnPressed,
    required Function() muteOnPressed,
    required Function() fullscreenButtonOnPressed,
    required ValueNotifier<bool> play,
    required ValueNotifier<bool> mute,
    required ValueNotifier<String> timer,
    required ValueNotifier<bool> viewed,
  })  : _videoPlayerController = videoPlayerController,
        _fullscreenOnPressed = fullscreenButtonOnPressed,
        _muteOnPressed = muteOnPressed,
        _playPauseOnPressed = playPauseOnPressed,
        _play = play,
        _mute = mute,
        _timer = timer,
        _viewed = viewed,
        super(key: key);

  final VideoPlayerController _videoPlayerController;

  final Function() _playPauseOnPressed;
  final Function() _muteOnPressed;
  final Function() _fullscreenOnPressed;

  final ValueNotifier<bool> _play;
  final ValueNotifier<bool> _mute;
  final ValueNotifier<String> _timer;

  final ValueNotifier<bool> _viewed;

  @override
  State<FullscreenVideoPlayer> createState() => _FullscreenVideoPlayerState();
}

class _FullscreenVideoPlayerState extends State<FullscreenVideoPlayer>
    with TickerProviderStateMixin {
  late AnimationController _buttonsPositionAnimationController;
  late Animation<double> _buttonsPositionAnimation;

  late Timer _ticker;

  @override
  void initState() {
    super.initState();

    _buttonsPositionAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _buttonsPositionAnimation = Tween<double>(
      begin: -45,
      end: 0.0,
    ).animate(_buttonsPositionAnimationController)
      ..addListener(_videoFinishListener);
    widget._videoPlayerController.addListener(_videoFinishListener);

    _ticker = _createTicker();
  }

  @override
  void dispose() {
    _ticker.cancel();
    widget._videoPlayerController.removeListener(_videoFinishListener);
    _buttonsPositionAnimationController.removeListener(_videoFinishListener);
    _buttonsPositionAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final aspectRatio = widget._videoPlayerController.value.size.height /
        widget._videoPlayerController.value.size.width;
    final screenSize = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                height: screenSize.width * aspectRatio,
                width: screenSize.width,
                child: GestureDetector(
                  onTap: _showButtons,
                  child: VideoPlayer(widget._videoPlayerController),
                ),
              ),
              Positioned(
                bottom: _buttonsPositionAnimation.value,
                child: FullscreenVideoPlayerControlPanel(
                  videoPlayerController: widget._videoPlayerController,
                  playPauseOnPressed: _playPauseOnPressed,
                  muteOnPressed: widget._muteOnPressed,
                  fullscreenOnPressed: widget._fullscreenOnPressed,
                  play: widget._play,
                  mute: widget._mute,
                  timer: widget._timer,
                  screenSize: screenSize,
                  viewed: widget._viewed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _playPauseOnPressed() {
    if (widget._videoPlayerController.value.isPlaying) {
      _ticker.cancel();
    } else {
      _ticker = _createTicker();
    }
    widget._playPauseOnPressed();
  }

  void _showButtons() async {
    if (_buttonsPositionAnimation.value == 0.0) {
      await _buttonsPositionAnimationController.reverse().then(
            (value) => _ticker.cancel(),
          );
    } else {
      await _buttonsPositionAnimationController.forward().then(
            (value) => _ticker = _createTicker(),
          );
    }
  }

  Timer _createTicker() => Timer(
        const Duration(seconds: 5),
        () {
          if (widget._videoPlayerController.value.isPlaying) {
            _buttonsPositionAnimationController.reverse();
          }
        },
      );

  void _videoFinishListener() => setState(
        () {
          if (widget._videoPlayerController.value.position >=
              widget._videoPlayerController.value.duration) {
            _buttonsPositionAnimationController.forward();
          }
        },
      );
}
