import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_plus_package_entity.freezed.dart';

@freezed
class QuizPlusPackageEntity with _$QuizPlusPackageEntity {
  const factory QuizPlusPackageEntity({
    required String packageId,
    required String productId,
    required String title,
    required String description,
    required String price,
    required String? subscriptionPeriod,
  }) = _QuizPlusPackageEntity;
}

enum QuizPlusPurchaseOutcome { completed, cancelled, pending }
