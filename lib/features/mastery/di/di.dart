import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/client/api_client.dart';
import 'package:quiz/features/mastery/data/converter/mastery_converter.dart';
import 'package:quiz/features/mastery/data/repository/remote_mastery_repository.dart';
import 'package:quiz/features/mastery/domain/repository/mastery_repository.dart';

@module
abstract class MasteryModule {
  @lazySingleton
  MasteryRepository masteryRepository({
    required ApiClient client,
    required MasteryConverter masteryConverter,
  }) =>
      RemoteMasteryRepository(
        client: client,
        masteryConverter: masteryConverter,
      );
}
