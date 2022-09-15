import 'package:dio/dio.dart';
import 'package:quiz/app/data/config/dio_settings.dart';
import 'package:quiz/app/data/config/path.dart';
import 'package:quiz/app/data/model/api_quiz_question_model.dart';
import 'package:quiz/app/data/model/api_quiz_video_model.dart';
import 'package:quiz/app/data/model/exceptions.dart';

/// QUIZ
///
/// SIMPLE QUIZ = "SQ"
///
/// VIDEO PREDICTION QUIZ = "VPQ"
class QuizApi {
  final _dio = DioSettings.createDio();
  final String _quizPath = Path.quizPath;
  final String _quizVideoPath = Path.quizVideoPath;

  Future<List<ApiQuizQuestionModel>> getSimpleQuiz(int id) async {
    // var response = await _dio.get('$_quizPath$id/');
    var response = await _fakeSimpleQuiz(_quizPath, id);
    var responseMapping = _simpleQuizResponseMapping(response);
    return responseMapping;
  }

  Future<ApiQuizVideoModel> getVideoQuiz(int id) async {
    // var response = await _dio.get('$_quizPath$id/');
    var response = await _fakeVideoQuiz(_quizVideoPath);
    var responseMapping = _videoQuizResponseMapping(response);
    return responseMapping;
  }

  List<ApiQuizQuestionModel> _simpleQuizResponseMapping(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        var quiz = response.data['questions'] as List;
        return List.generate(
          quiz.length,
          (index) => ApiQuizQuestionModel.fromApi(
            quiz[index] as Map<String, dynamic>,
          ),
        );
      default:
        throw _exception(response);
    }
  }

  ApiQuizVideoModel _videoQuizResponseMapping(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        var quiz = response.data;
        return ApiQuizVideoModel.fromApi(quiz);
      default:
        throw _exception(response);
    }
  }

  Exception _exception(Response response) {
    switch (response.statusCode) {
      default:
        throw NetworkOtherException(response.statusCode.toString());
    }
  }

  Future<Response<dynamic>> _fakeSimpleQuiz(String path, int id) async {
    var result = {
      'questions': [
        {
          'id': 0,
          'time': 15,
          'description': 'Здесь текст вопроса к видео 0. Для современного '
              'мира высокотехнологичная концепция общественного уклада '
              'однозначно фиксирует необходимость системы массового участия.',
          'url': 'https://assets.mixkit.co/videos/preview/mixkit-woman-'
              'cleaning-her-house-dancing-happy-43379-large.mp4',
          'gameType': 'video',
          'answers': [
            {
              'id': 0,
              'variant': 'a',
              'value': 'Answer text 1',
              'isCorrect': false,
            },
            {
              'id': 1,
              'variant': 'b',
              'value': 'Answer text 2',
              'isCorrect': true,
            },
            {
              'id': 2,
              'variant': 'c',
              'value': 'Answer text 3',
              'isCorrect': false,
            },
          ],
        },
        {
          'id': 1,
          'time': 10,
          'description': 'Здесь текст вопроса к фотографии 1. Для современного '
              'мира высокотехнологичная концепция общественного уклада '
              'однозначно фиксирует необходимость системы массового участия.',
          'url': 'https://thumbs.dreamstime.com/b/young-woman-traveler-alps-'
              'mountains-winter-travel-active-lifestyle-concept-young-woman-'
              'traveler-alps-mountains-travel-130546060.jpg',
          'gameType': 'image',
          'answers': [
            {
              'id': 1,
              'variant': 'a',
              'value': 'Answer text 1',
              'isCorrect': true,
            },
            {
              'id': 2,
              'variant': 'b',
              'value': 'Answer text 2',
              'isCorrect': false,
            },
            {
              'id': 3,
              'variant': 'c',
              'value': 'Answer text 3',
              'isCorrect': false,
            },
          ],
        },
        {
          'id': 2,
          'time': 10,
          'description': 'Здесь текст вопроса без мультимедиа 1. Для '
              'современного мира высокотехнологичная концепция общественного '
              'уклада однозначно фиксирует необходимость системы массового '
              'участия.',
          'gameType': 'text',
          'answers': [
            {
              'id': 1,
              'variant': 'a',
              'value': 'Answer text 1',
              'isCorrect': false,
            },
            {
              'id': 2,
              'variant': 'b',
              'value': 'Answer text 2',
              'isCorrect': false,
            },
            {
              'id': 3,
              'variant': 'c',
              'value': 'Answer text 3',
              'isCorrect': true,
            },
          ],
        },
        {
          'id': 3,
          'time': 15,
          'description': 'Здесь текст вопроса к фотографии 3. Для современного '
              'мира высокотехнологичная концепция общественного уклада '
              'однозначно фиксирует необходимость системы массового участия.',
          'url': 'https://i.pinimg.com/474x/01/88/dc/0188dc41881e0e410b5375cd'
              'ead5f49a.jpg',
          'gameType': 'image',
          'answers': [
            {
              'id': 1,
              'variant': 'a',
              'value': 'Answer text 1',
              'isCorrect': true,
            },
            {
              'id': 2,
              'variant': 'b',
              'value': 'Answer text 2',
              'isCorrect': false,
            },
            {
              'id': 3,
              'variant': 'c',
              'value': 'Answer text 3',
              'isCorrect': false,
            },
          ],
        },
        {
          'id': 4,
          'time': 15,
          'description': 'Здесь текст вопроса к видео 4. Для современного '
              'мира высокотехнологичная концепция общественного уклада '
              'однозначно фиксирует необходимость системы массового участия.',
          'url': 'https://assets.mixkit.co/videos/preview/mixkit-man-'
              'runs-past-ground-level-shot-32809-large.mp4',
          'gameType': 'video',
          'answers': [
            {
              'id': 0,
              'variant': 'a',
              'value': 'Answer text 1',
              'isCorrect': false,
            },
            {
              'id': 1,
              'variant': 'b',
              'value': 'Answer text 2',
              'isCorrect': true,
            },
            {
              'id': 2,
              'variant': 'c',
              'value': 'Answer text 3',
              'isCorrect': false,
            },
          ],
        },
        {
          'id': 5,
          'time': 15,
          'description': 'Здесь текст вопроса к фотографии 5. Для современного '
              'мира высокотехнологичная концепция общественного уклада '
              'однозначно фиксирует необходимость системы массового участия.',
          'url': 'https://images.panda.org/assets/images/pages/welcome/'
              'orangutan_1600x1000_279157.jpg',
          'gameType': 'image',
          'answers': [
            {
              'id': 1,
              'variant': 'a',
              'value': 'Answer text 1',
              'isCorrect': true,
            },
            {
              'id': 2,
              'variant': 'b',
              'value': 'Answer text 2',
              'isCorrect': false,
            },
            {
              'id': 3,
              'variant': 'c',
              'value': 'Answer text 3',
              'isCorrect': false,
            },
          ],
        },
      ],
    };

    return Future.delayed(const Duration(milliseconds: 100)).then(
      (value) => Response(
        data: result,
        statusCode: 200,
        requestOptions: RequestOptions(path: path),
      ),
    );
  }

  Future<Response<dynamic>> _fakeVideoQuiz(String path) async {
    var result = {
      'id': 11,
      'url': 'https://assets.mixkit.co/videos/preview/mixkit-going-down-a-'
          'curved-highway-through-a-mountain-range-41576-large.mp4',
      'questions': [
        {
          'id': 12,
          'timestamp': 5,
          'question': {
            'id': 6,
            'time': 15,
            'description': 'Здесь текст вопроса к видео 6. Для современного '
                'мира высокотехнологичная концепция общественного уклада '
                'однозначно фиксирует необходимость системы массового участия.',
            'gameType': 'text',
            'answers': [
              {
                'id': 1,
                'variant': 'a',
                'value': 'Answer text 1',
                'isCorrect': true,
              },
              {
                'id': 2,
                'variant': 'b',
                'value': 'Answer text 2',
                'isCorrect': false,
              },
              {
                'id': 3,
                'variant': 'c',
                'value': 'Answer text 3',
                'isCorrect': false,
              },
            ],
          }
        },
        {
          'id': 13,
          'timestamp': 10,
          'question': {
            'id': 7,
            'time': 10,
            'description': 'Здесь текст вопроса к видео 7. Для современного '
                'мира высокотехнологичная концепция общественного уклада '
                'однозначно фиксирует необходимость системы массового участия.',
            'gameType': 'text',
            'answers': [
              {
                'id': 1,
                'variant': 'a',
                'value': 'Answer text 1',
                'isCorrect': false,
              },
              {
                'id': 2,
                'variant': 'b',
                'value': 'Answer text 2',
                'isCorrect': true,
              },
              {
                'id': 3,
                'variant': 'c',
                'value': 'Answer text 3',
                'isCorrect': false,
              },
            ],
          }
        },
        {
          'id': 14,
          'timestamp': 15,
          'question': {
            'id': 8,
            'time': 10,
            'description': 'Здесь текст вопроса к видео 8. Для современного '
                'мира высокотехнологичная концепция общественного уклада '
                'однозначно фиксирует необходимость системы массового участия.',
            'gameType': 'text',
            'answers': [
              {
                'id': 1,
                'variant': 'a',
                'value': 'Answer text 1',
                'isCorrect': false,
              },
              {
                'id': 2,
                'variant': 'b',
                'value': 'Answer text 2',
                'isCorrect': true,
              },
              {
                'id': 3,
                'variant': 'c',
                'value': 'Answer text 3',
                'isCorrect': false,
              },
            ],
          }
        },
        {
          'id': 15,
          'timestamp': 20,
          'question': {
            'id': 9,
            'time': 10,
            'description': 'Здесь текст вопроса к видео 9. Для современного '
                'мира высокотехнологичная концепция общественного уклада '
                'однозначно фиксирует необходимость системы массового участия.',
            'gameType': 'text',
            'answers': [
              {
                'id': 1,
                'variant': 'a',
                'value': 'Answer text 1',
                'isCorrect': false,
              },
              {
                'id': 2,
                'variant': 'b',
                'value': 'Answer text 2',
                'isCorrect': true,
              },
              {
                'id': 3,
                'variant': 'c',
                'value': 'Answer text 3',
                'isCorrect': false,
              },
            ],
          }
        },
        {
          'id': 16,
          'timestamp': 25,
          'question': {
            'id': 10,
            'time': 10,
            'description': 'Здесь текст вопроса к видео 10. Для современного '
                'мира высокотехнологичная концепция общественного уклада '
                'однозначно фиксирует необходимость системы массового участия.',
            'gameType': 'text',
            'answers': [
              {
                'id': 1,
                'variant': 'a',
                'value': 'Answer text 1',
                'isCorrect': false,
              },
              {
                'id': 2,
                'variant': 'b',
                'value': 'Answer text 2',
                'isCorrect': true,
              },
              {
                'id': 3,
                'variant': 'c',
                'value': 'Answer text 3',
                'isCorrect': false,
              },
            ],
          }
        },
      ],
    };
    return Future.delayed(const Duration(milliseconds: 100)).then(
      (value) => Response(
        data: result,
        statusCode: 200,
        requestOptions: RequestOptions(path: path),
      ),
    );
  }
}
