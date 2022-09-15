import 'package:flutter/cupertino.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:quiz/app/ui/uikit/loader.dart';
import 'package:quiz/app/ui/uikit/text_theme.dart';
import 'package:quiz/app/ui/uikit/video_player/fullscreen_video_player.dart';
import 'package:quiz/app/ui/uikit/video_player/mini_video_player.dart';
import 'package:video_player/video_player.dart';

class VideoBuilder extends StatefulWidget {
  const VideoBuilder({
    Key? key,
    required String url,
    required ValueNotifier<bool> timerStarted,
    required ValueNotifier<int> time,
    required ValueNotifier<bool> viewed,
  })  : _url = url,
        _timerStarted = timerStarted,
        _time = time,
        _viewed = viewed,
        super(key: key);

  final String _url;
  final ValueNotifier<bool> _timerStarted;
  final ValueNotifier<int> _time;
  final ValueNotifier<bool> _viewed;

  @override
  State<VideoBuilder> createState() => _VideoBuilderState();
}

class _VideoBuilderState extends State<VideoBuilder>
    with TickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;

  late ValueNotifier<bool> _playing;
  late ValueNotifier<bool> _muting;
  late ValueNotifier<String> _timer;

  late OverlayEntry? _fullScreenEntry;
  late OverlayState? _fullScreenOverlay;

  late AnimationController _backgroundOpacityAnimationController;
  late Animation<double> _backgroundOpacityAnimation;

  late AnimationController _contentOpacityAnimationController;
  late Animation<double> _contentOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _playing = ValueNotifier(false);
    _muting = ValueNotifier(false);
    _timer = ValueNotifier('00:00 / 00:00');

    _fullScreenEntry = null;
    _fullScreenOverlay = null;

    _backgroundOpacityAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _backgroundOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_backgroundOpacityAnimationController);

    _contentOpacityAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _contentOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_contentOpacityAnimationController);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _videoPlayerController.removeListener(_listener);

    _playing.dispose();
    _timer.dispose();

    _backgroundOpacityAnimationController.dispose();
    _contentOpacityAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initVideoController(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ValueListenableBuilder<bool>(
            valueListenable: widget._timerStarted,
            builder: (context, show, child) {
              if (show) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ValueListenableBuilder<int>(
                      valueListenable: widget._time,
                      builder: (context, time, child) {
                        return MiniVideoPlayer(
                          videoPlayerController: _videoPlayerController,
                          playPauseOnPressed: _playPauseOnPressed,
                          muteOnPressed: _muteOnPressed,
                          fullscreenOnPressed: time <= 5
                              ? null
                              : _fullScreenEntry == null
                                  ? _openVideoOnPressed
                                  : _closeVideoOnPressed,
                          play: _playing,
                          mute: _muting,
                          timer: _timer,
                        );
                      }),
                );
              } else {
                return CupertinoButton(
                  onPressed: _openVideoOnPressed,
                  child: Text(
                    'Показать\nвидео',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.manrope24W600.apply(
                      color: AppColors.greyBlue01,
                    ),
                  ),
                );
              }
            },
          );
        } else {
          return const Center(child: Loader(color: AppColors.greyBlue01));
        }
      },
    );
  }

  Future _initVideoController() async {
    _videoPlayerController = VideoPlayerController.network(
      widget._url,
    );
    if (!_videoPlayerController.value.isInitialized) {
      await _videoPlayerController.initialize();
    }
    _videoPlayerController.addListener(_listener);
  }

  void _listener() {
    _playing.value = _videoPlayerController.value.isPlaying;
    _muting.value = _videoPlayerController.value.volume == 0.0;

    _calculationTime();
  }

  void _calculationTime() {
    var currentMinute = (_videoPlayerController.value.position.inSeconds ~/ 60)
        .toString()
        .padLeft(2, '0');
    var lostMinute = (_videoPlayerController.value.duration.inSeconds ~/ 60)
        .toString()
        .padLeft(2, '0');
    var currentSecond = (_videoPlayerController.value.position.inSeconds % 60)
        .toString()
        .padLeft(2, '0');
    var lostSecond = (_videoPlayerController.value.duration.inSeconds % 60)
        .toString()
        .padLeft(2, '0');

    _timer.value = '$currentMinute:$currentSecond / $lostMinute:$lostSecond';
  }

  void _playPauseOnPressed() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
    } else {
      _videoPlayerController.play();
    }
  }

  void _muteOnPressed() {
    if (_videoPlayerController.value.volume == 0.0) {
      _videoPlayerController.setVolume(1.0);
    } else {
      _videoPlayerController.setVolume(0.0);
    }
  }

  void _openVideoOnPressed() {
    _fullScreenEntry = OverlayEntry(
      builder: (context) {
        return Opacity(
          opacity: _backgroundOpacityAnimation.value,
          child: CupertinoPageScaffold(
            backgroundColor: AppColors.black,
            child: Opacity(
              opacity: _contentOpacityAnimation.value,
              child: FullscreenVideoPlayer(
                videoPlayerController: _videoPlayerController,
                playPauseOnPressed: _playPauseOnPressed,
                muteOnPressed: _muteOnPressed,
                fullscreenButtonOnPressed: _closeVideoOnPressed,
                play: _playing,
                mute: _muting,
                timer: _timer,
                viewed: widget._viewed,
              ),
            ),
          ),
        );
      },
    );
    _fullScreenOverlay = Overlay.of(context);

    _backgroundOpacityAnimationController.addListener(_overlayListener);
    _contentOpacityAnimationController.addListener(_overlayListener);

    _fullScreenOverlay?.insert(_fullScreenEntry!);

    _backgroundOpacityAnimationController.forward().whenComplete(
          () => _contentOpacityAnimationController.forward().whenComplete(
                () async => await _videoPlayerController.play(),
              ),
        );
  }

  void _overlayListener() => _fullScreenOverlay?.setState(() {});

  void _closeVideoOnPressed() {
    if (_fullScreenEntry != null) {
      _contentOpacityAnimationController.reverse().whenComplete(
            () => _backgroundOpacityAnimationController.reverse().whenComplete(
              () {
                _fullScreenEntry?.remove();
                _fullScreenEntry = null;

                _backgroundOpacityAnimationController
                    .removeListener(_overlayListener);
                _contentOpacityAnimationController
                    .removeListener(_overlayListener);
                widget._timerStarted.value = true;
              },
            ),
          );
    }
  }
}
