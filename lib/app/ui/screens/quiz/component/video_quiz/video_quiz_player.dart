import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoQuizPlayer extends StatefulWidget {
  const VideoQuizPlayer({
    Key? key,
    required VideoPlayerController controller,
  })  : _videoPlayerController = controller,
        super(key: key);

  final VideoPlayerController _videoPlayerController;

  @override
  State<VideoQuizPlayer> createState() => _VideoQuizPlayerState();
}

class _VideoQuizPlayerState extends State<VideoQuizPlayer> {
  late bool landscaped = false;

  @override
  void initState() {
    super.initState();
    landscaped = widget._videoPlayerController.value.size.width >=
        widget._videoPlayerController.value.size.height;

    if (landscaped) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    }
  }

  @override
  void dispose() {
    if (landscaped) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget._videoPlayerController.value.size;
    final screenSize = MediaQuery.of(context).size;
    final aspectRatio = size.width / size.height;
    final height = screenSize.width / aspectRatio;
    final width = screenSize.width;
    log('$height = ${size.height} = ${size.height / height}');
    log('$width = ${size.width} = ${size.width / width}');
    widget._videoPlayerController.play();

    return Center(
      child: SizedBox(
        height: screenSize.width / aspectRatio,
        width: screenSize.width,
        child: VideoPlayer(widget._videoPlayerController),
      ),
    );
  }
}
