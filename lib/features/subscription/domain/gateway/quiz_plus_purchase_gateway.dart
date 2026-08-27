import 'package:quiz/features/subscription/domain/entity/quiz_plus_package_entity.dart';

abstract interface class QuizPlusPurchaseGateway {
  bool get available;

  Future<bool> identify(String userId);

  Future<void> clearIdentity();

  Future<List<QuizPlusPackageEntity>> fetchPackages();

  Future<QuizPlusPurchaseOutcome> purchase(String packageId);

  Future<void> restore();
}
