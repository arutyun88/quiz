import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/base_state.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/user/domain/entity/user_statistics_entity.dart';
import 'package:quiz/features/user/domain/repository/user_statistics_repository.dart';

final userStatisticsProvider = StateNotifierProvider<UserStatisticsNotifier, BaseState<UserStatisticsEntity>>(
  (ref) => UserStatisticsNotifier(
    userStatisticsRepository: getIt<UserStatisticsRepository>(),
  ),
);

class UserStatisticsNotifier extends StateNotifier<BaseState<UserStatisticsEntity>> {
  final UserStatisticsRepository _userStatisticsRepository;
  UserStatisticsNotifier({required UserStatisticsRepository userStatisticsRepository})
      : _userStatisticsRepository = userStatisticsRepository,
        super(BaseState.loading());

  Future<void> fetch() async {
    final previousState = state;

    final result = await _userStatisticsRepository.fetch();

    switch (result) {
      case ResultOk(data: final statistics):
        state = BaseState.data(statistics);

      case ResultFailed(error: final failure):
        state = BaseState.failed(failure);

        if (previousState is BaseDataState) {
          state = previousState;
        }
    }
  }

  void updateFrom(UserStatisticsEntity statistics) => state = BaseState.data(statistics);
}
