import 'package:injectable/injectable.dart';
import 'package:quiz/app/core/model/data_page/data_page_dto.dart';
import 'package:quiz/app/core/model/dto_converter.dart';
import 'package:quiz/features/review/data/dto/review_history_dto.dart';
import 'package:quiz/features/review/domain/entity/review_history_entity.dart';
import 'package:quiz/features/question_report/domain/entity/question_report_status.dart';

typedef ReviewHistoryConverter
    = DtoConverter<ReviewHistoryEntity, DataPageDto<ReviewHistoryItemDto>>;

@Injectable(as: ReviewHistoryConverter)
final class ReviewHistoryConverterImpl extends ReviewHistoryConverter {
  @override
  ReviewHistoryEntity convert(DataPageDto<ReviewHistoryItemDto> dto) =>
      ReviewHistoryEntity(
        items: dto.data.map(_convertItem).toList(),
        total: dto.meta.total,
        offset: dto.meta.offset,
        limit: dto.meta.limit,
      );

  ReviewHistoryItemEntity _convertItem(ReviewHistoryItemDto dto) =>
      ReviewHistoryItemEntity(
        attemptId: dto.attemptId,
        questionId: dto.questionId,
        questionVersionId: dto.questionVersionId,
        editionDate: dto.editionDate,
        answeredAt: dto.answeredAt,
        action: dto.action,
        answerId: dto.answerId,
        correctAnswerId: dto.correctAnswerId,
        question: dto.question,
        topic: dto.topic,
        answer: dto.answer,
        correctAnswer: dto.correctAnswer,
        description: dto.description,
        hint: dto.hint,
        hintUsed: dto.hintUsed,
        versionStatus: switch (dto.versionStatus) {
          'CURRENT' => ReviewVersionStatus.current,
          'UPDATED' => ReviewVersionStatus.updated,
          'WITHDRAWN' => ReviewVersionStatus.withdrawn,
          _ => ReviewVersionStatus.unknown,
        },
        practiceRequested: dto.practiceRequested,
        practiceStatus: switch (dto.practiceStatus) {
          'COMPLETED' => ReviewPracticeStatus.completed,
          'QUEUED' => ReviewPracticeStatus.queued,
          _ when dto.practiceRequested => ReviewPracticeStatus.queued,
          _ => ReviewPracticeStatus.none,
        },
        reportSubmitted: dto.reportSubmitted,
        reportStatus: switch (dto.reportStatus) {
          'PROCESSED' => QuestionReportStatus.processed,
          'PENDING' => QuestionReportStatus.pending,
          _ when dto.reportSubmitted => QuestionReportStatus.pending,
          _ => QuestionReportStatus.none,
        },
        contentRedacted: dto.contentRedacted,
      );
}
