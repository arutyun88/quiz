import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/review/data/dto/review_queue_dto.dart';
import 'package:quiz/features/review/domain/entity/review_queue_entity.dart';

typedef ReviewQueueConverter = DtoConverter<ReviewQueueEntity, DataDto<ReviewQueueDto>>;

@Injectable(as: ReviewQueueConverter)
final class ReviewQueueConverterImpl extends ReviewQueueConverter {
  @override
  ReviewQueueEntity convert(DataDto<ReviewQueueDto> dto) {
    return ReviewQueueEntity(
      queued: dto.data.queued.map(_convertItem).toList(),
      queuedTotal: dto.data.queuedTotal,
      masteredTotal: dto.data.masteredTotal,
    );
  }

  ReviewItemEntity _convertItem(ReviewItemDto dto) {
    return ReviewItemEntity(
      question: dto.question,
      topic: dto.topic,
      wrongCount: dto.wrongCount,
      correctCount: dto.correctCount,
      dueInDays: dto.dueInDays,
    );
  }
}
