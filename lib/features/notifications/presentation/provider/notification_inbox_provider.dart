import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/app/core/model/result.dart';
import 'package:quiz/app/di/di.dart';
import 'package:quiz/features/authentication/provider/authentication_provider.dart';
import 'package:quiz/features/notifications/domain/entity/notification_inbox_entity.dart';
import 'package:quiz/features/notifications/domain/repository/notification_inbox_repository.dart';

final notificationInboxProvider =
    StateNotifierProvider<NotificationInboxNotifier, NotificationInboxState>(
  (ref) {
    final userId = ref.watch(
      authenticationProvider.select(
        (state) => state.mapOrNull(
          authenticated: (state) => state.user?.id,
        ),
      ),
    );
    return NotificationInboxNotifier(
      repository: getIt<NotificationInboxRepository>(),
      isAuthenticated: userId != null,
    );
  },
);

class NotificationInboxState {
  const NotificationInboxState({
    this.items = const [],
    this.total = 0,
    this.unreadCount = 0,
    this.hasLoaded = false,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.failure,
  });

  final List<InboxNotificationEntity> items;
  final int total;
  final int unreadCount;
  final bool hasLoaded;
  final bool isLoading;
  final bool isLoadingMore;
  final Failure? failure;

  bool get hasMore => items.length < total;

  NotificationInboxState copyWith({
    List<InboxNotificationEntity>? items,
    int? total,
    int? unreadCount,
    bool? hasLoaded,
    bool? isLoading,
    bool? isLoadingMore,
    Failure? failure,
    bool clearFailure = false,
  }) =>
      NotificationInboxState(
        items: items ?? this.items,
        total: total ?? this.total,
        unreadCount: unreadCount ?? this.unreadCount,
        hasLoaded: hasLoaded ?? this.hasLoaded,
        isLoading: isLoading ?? this.isLoading,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        failure: clearFailure ? null : failure ?? this.failure,
      );
}

class NotificationInboxNotifier extends StateNotifier<NotificationInboxState> {
  NotificationInboxNotifier({
    required NotificationInboxRepository repository,
    bool isAuthenticated = true,
    bool autoFetchUnread = true,
  })  : _repository = repository,
        _isAuthenticated = isAuthenticated,
        super(const NotificationInboxState()) {
    if (isAuthenticated && autoFetchUnread) fetchUnreadCount();
  }

  static const _pageSize = 20;
  final NotificationInboxRepository _repository;
  final bool _isAuthenticated;
  Future<bool>? _pendingFetch;

  Future<bool> fetch() => _pendingFetch ??= _fetch().whenComplete(
        () => _pendingFetch = null,
      );

  Future<bool> refresh() => fetch();

  Future<void> fetchUnreadCount() async {
    if (!_isAuthenticated) return;
    final result = await _repository.fetchUnreadCount();
    if (result case ResultOk(data: final count)) {
      state = state.copyWith(unreadCount: count);
    }
  }

  Future<void> handleIncomingNotification() async {
    await fetchUnreadCount();
    if (state.hasLoaded) await fetch();
  }

  Future<bool> _fetch() async {
    final hadData = state.hasLoaded;
    if (!hadData) {
      state = state.copyWith(isLoading: true, clearFailure: true);
    }
    final result = await _repository.fetch(limit: _pageSize, offset: 0);
    switch (result) {
      case ResultOk(data: final page):
        state = state.copyWith(
          items: page.items,
          total: page.total,
          unreadCount: page.items.where((item) => !item.isRead).length,
          hasLoaded: true,
          isLoading: false,
          clearFailure: true,
        );
        await fetchUnreadCount();
        return true;
      case ResultFailed(error: final failure):
        state = state.copyWith(
          isLoading: false,
          failure: failure,
        );
        return false;
    }
  }

  Future<bool> loadMore() async {
    if (state.isLoadingMore || !state.hasMore) return true;
    state = state.copyWith(isLoadingMore: true, clearFailure: true);
    final result = await _repository.fetch(
      limit: _pageSize,
      offset: state.items.length,
    );
    switch (result) {
      case ResultOk(data: final page):
        state = state.copyWith(
          items: [...state.items, ...page.items],
          total: page.total,
          isLoadingMore: false,
          clearFailure: true,
        );
        return true;
      case ResultFailed(error: final failure):
        state = state.copyWith(isLoadingMore: false, failure: failure);
        return false;
    }
  }

  Future<bool> markRead(String notificationId) async {
    final index = state.items.indexWhere((item) => item.id == notificationId);
    if (index < 0 || state.items[index].isRead) return true;
    final previousItems = state.items;
    final updatedItems = [...previousItems];
    updatedItems[index] = updatedItems[index].copyWith(isRead: true);
    state = state.copyWith(
      items: updatedItems,
      unreadCount: (state.unreadCount - 1).clamp(0, state.unreadCount),
    );
    final result = await _repository.markRead(notificationId);
    if (result case ResultFailed()) {
      state = state.copyWith(
        items: previousItems,
        unreadCount: state.unreadCount + 1,
      );
      return false;
    }
    return true;
  }

  Future<bool> markAllRead() async {
    if (state.unreadCount == 0) return true;
    final previousItems = state.items;
    final previousCount = state.unreadCount;
    state = state.copyWith(
      items: [
        for (final item in previousItems) item.copyWith(isRead: true),
      ],
      unreadCount: 0,
    );
    final result = await _repository.markAllRead();
    if (result case ResultFailed()) {
      state = state.copyWith(
        items: previousItems,
        unreadCount: previousCount,
      );
      return false;
    }
    return true;
  }
}
