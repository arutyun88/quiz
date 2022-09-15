import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/domain/model/quiz_model.dart';
import 'package:quiz/app/ui/screens/quiz/component/video_quiz/video_quiz_player.dart';
import 'package:quiz/app/ui/state/quiz/quiz_cubit.dart';
import 'package:quiz/app/ui/uikit/const/colors_const.dart';
import 'package:quiz/app/ui/uikit/const/dictionary_const.dart';
import 'package:quiz/app/ui/uikit/loader.dart';
import 'package:quiz/app/ui/uikit/text_theme.dart';
import 'package:video_player/video_player.dart';

class VideoQuizPage extends StatelessWidget {
  const VideoQuizPage({
    Key? key,
    required QuizModel quiz,
  })  : _quiz = quiz,
        super(key: key);
  final QuizModel _quiz;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizCubit(),
      child: VideoQuizView(id: _quiz.id),
    );
  }
}

class VideoQuizView extends StatefulWidget {
  const VideoQuizView({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<VideoQuizView> createState() => _VideoQuizViewState();
}

class _VideoQuizViewState extends State<VideoQuizView> {
  late VideoPlayerController _videoPlayerController;
  late bool _videoPlayerControllerIsInit = false;

  @override
  void initState() {
    super.initState();
    context.read<QuizCubit>().getVideoQuiz(widget.id);
  }

  @override
  void dispose() {
    if (_videoPlayerControllerIsInit) {
      _videoPlayerController.dispose();
    }
    super.dispose();
  }

  Future<VideoPlayerController> _initVideoController(url) async {
    _videoPlayerController = VideoPlayerController.network(url);
    if (!_videoPlayerController.value.isInitialized) {
      await _videoPlayerController.initialize();
    }
    _videoPlayerControllerIsInit = true;
    return _videoPlayerController;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.black,
      child: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizVideoReceived) {
            return FutureBuilder(
              future: _initVideoController(state.videoGame.videoUrl),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return VideoQuizPlayer(controller: _videoPlayerController);
                }
                return Center(
                  child: Loader(color: AppColors.white.withOpacity(.7)),
                );
              },
            );
          } else if (state is QuizRequested) {
            return Center(
              child: Loader(color: AppColors.white.withOpacity(.7)),
            );
          } else {
            return Center(
              child: Text(
                AppDictionary.networkError,
                textAlign: TextAlign.center,
                style: AppTextStyle.manrope14W400.apply(
                  color: AppColors.white.withOpacity(.7),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
