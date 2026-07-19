import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/database/dao/question_dao.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/home/presentation/provider/start_day_config_provider.dart';
import 'package:quiz/features/question/domain/repository/question_repository.dart';

/// Topics of the upcoming daily issue, read from the local question cache.
///
/// The cache is filled with the day's batch on first quiz entry; here it is prefetched early so the
/// start-day screen can show the topic chips (and the first question opens instantly).
final dailyTopicsProvider = FutureProvider.autoDispose<List<String>>((ref) async {
  final dao = getIt<QuestionDao>();

  final cached = await dao.getCachedTopicNames();
  if (cached.isNotEmpty) return cached;

  final limit = ref.watch(startDayConfigProvider).questionCount;
  final result = await getIt<QuestionRepository>().fetch(limit: limit);
  if (result case ResultOk(:final data) when data.items.isNotEmpty) {
    await dao.save(data.items);
    return await dao.getCachedTopicNames();
  }

  return const [];
});
