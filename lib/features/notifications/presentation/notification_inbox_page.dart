import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/app/config/theme/theme_ex.dart';
import 'package:quiz/app/core/widgets/app_refresh_indicator.dart';
import 'package:quiz/app/core/widgets/app_shimmer.dart';
import 'package:quiz/app/core/widgets/app_snack_bar.dart';
import 'package:quiz/app/core/widgets/button/app_button_v2.dart';
import 'package:quiz/app/core/widgets/scaffold/app_scaffold.dart';
import 'package:quiz/features/notifications/domain/entity/notification_inbox_entity.dart';
import 'package:quiz/features/notifications/presentation/provider/notification_inbox_provider.dart';
import 'package:quiz/gen/strings.g.dart';

class NotificationInboxPage extends ConsumerStatefulWidget {
  const NotificationInboxPage({super.key});

  @override
  ConsumerState<NotificationInboxPage> createState() =>
      _NotificationInboxPageState();
}

class _NotificationInboxPageState extends ConsumerState<NotificationInboxPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notificationInboxProvider.notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationInboxProvider);
    final notifier = ref.read(notificationInboxProvider.notifier);

    return AppScaffold(
      title: context.t.notifications.title,
      trailing: state.unreadCount > 0
          ? _MarkAllReadAction(
              onTap: () async {
                if (!await notifier.markAllRead() && context.mounted) {
                  _showActionError(context);
                }
              },
            )
          : null,
      body: AppRefreshIndicator(
        onRefresh: () async {
          if (!await notifier.refresh() && context.mounted) {
            AppSnackBar.showError(
              context,
              title: context.t.notifications.refresh_error_title,
              message: context.t.notifications.refresh_error_message,
            );
          }
        },
        child: _body(context, state, notifier),
      ),
    );
  }

  Widget _body(
    BuildContext context,
    NotificationInboxState state,
    NotificationInboxNotifier notifier,
  ) {
    if (!state.hasLoaded && state.isLoading) {
      return const _NotificationLoading();
    }
    if (!state.hasLoaded && state.failure != null) {
      return _NotificationError(onRetry: notifier.fetch);
    }
    if (state.hasLoaded && state.items.isEmpty) {
      return const _NotificationEmpty();
    }
    return _NotificationList(
      state: state,
      onLoadMore: () async {
        if (!await notifier.loadMore() && context.mounted) {
          AppSnackBar.showError(
            context,
            title: context.t.notifications.refresh_error_title,
            message: context.t.notifications.action_error_message,
          );
        }
      },
      onTap: (notification) async {
        if (!await notifier.markRead(notification.id) && context.mounted) {
          _showActionError(context);
        }
        if (context.mounted) {
          _openDestination(context, notification.destination);
        }
      },
    );
  }

  void _showActionError(BuildContext context) => AppSnackBar.showError(
        context,
        title: context.t.notifications.action_error_title,
        message: context.t.notifications.action_error_message,
      );
}

class _MarkAllReadAction extends StatelessWidget {
  const _MarkAllReadAction({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            context.t.notifications.mark_all_read,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 8.5,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              color: context.palette.text.accent,
            ),
          ),
        ),
      );
}

class _NotificationList extends StatelessWidget {
  const _NotificationList({
    required this.state,
    required this.onLoadMore,
    required this.onTap,
  });

  final NotificationInboxState state;
  final VoidCallback onLoadMore;
  final ValueChanged<InboxNotificationEntity> onTap;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    String? previousSection;
    for (final notification in state.items) {
      final section = _sectionLabel(context, notification.createdAt);
      if (section != previousSection) {
        if (rows.isNotEmpty) {
          rows.add(const SizedBox(height: 18));
        }
        rows
          ..add(_SectionLabel(section))
          ..add(const SizedBox(height: 10));
        previousSection = section;
      }
      rows
        ..add(
          _NotificationCard(
            notification: notification,
            onTap: () => onTap(notification),
          ),
        )
        ..add(const SizedBox(height: 10));
    }

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 32),
      children: [
        ...rows,
        if (state.hasMore) ...[
          const SizedBox(height: 4),
          AppButtonV2(
            label: context.t.notifications.load_more,
            onTap: state.isLoadingMore ? null : (_) => onLoadMore(),
          ),
        ],
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) => Text(
        '// $label',
        style: GoogleFonts.jetBrainsMono(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 2.1,
          color: context.palette.text.accent,
        ),
      );
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({
    required this.notification,
    required this.onTap,
  });

  final InboxNotificationEntity notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.palette;
    final content = _content(context, notification);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: notification.isRead
              ? Colors.transparent
              : colors.background.dynamic,
          border: Border.all(color: colors.card.border),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 4,
                color: notification.isRead
                    ? Colors.transparent
                    : colors.text.accent,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.text.primary),
                  ),
                  child: Icon(
                    _icon(notification.type),
                    size: 20,
                    color: notification.isRead
                        ? colors.text.secondary
                        : colors.text.accent,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 10, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              content.$1,
                              style: GoogleFonts.unbounded(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w700,
                                color: colors.text.primary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _dateLabel(notification.createdAt),
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 8,
                              color: colors.text.secondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        content.$2,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.spectral(
                          fontSize: 15,
                          height: 1.25,
                          color: notification.isRead
                              ? colors.text.secondary
                              : colors.text.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (notification.destination != InboxNotificationDestination.none)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: colors.text.secondary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationLoading extends StatelessWidget {
  const _NotificationLoading();

  @override
  Widget build(BuildContext context) => AppShimmer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 32),
          children: [
            Container(
              width: 80,
              height: 10,
              color: context.palette.background.dynamic,
            ),
            const SizedBox(height: 12),
            for (var i = 0; i < 5; i++) ...[
              Container(
                height: 86,
                decoration: BoxDecoration(
                  border: Border.all(color: context.palette.card.border),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ],
        ),
      );
}

class _NotificationEmpty extends StatelessWidget {
  const _NotificationEmpty();

  @override
  Widget build(BuildContext context) => _CenteredState(
        icon: Icons.notifications_none,
        title: context.t.notifications.empty_title,
        message: context.t.notifications.empty_message,
      );
}

class _NotificationError extends StatelessWidget {
  const _NotificationError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => _CenteredState(
        icon: Icons.notifications_off_outlined,
        title: context.t.notifications.error_title,
        message: context.t.notifications.error_message,
        action: AppButtonV2(
          label: context.t.notifications.retry,
          onTap: (_) => onRetry(),
        ),
      );
}

class _CenteredState extends StatelessWidget {
  const _CenteredState({
    required this.icon,
    required this.title,
    required this.message,
    this.action,
  });

  final IconData icon;
  final String title;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 24, 22, 24),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: context.palette.text.primary,
                              ),
                            ),
                            child: Icon(icon, size: 30),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.unbounded(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            message,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spectral(
                              fontSize: 18,
                              color: context.palette.text.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (action != null) action!,
                ],
              ),
            ),
          ),
        ],
      );
}

(String, String) _content(
  BuildContext context,
  InboxNotificationEntity notification,
) {
  final payload = notification.payload;
  return switch (notification.type) {
    InboxNotificationType.achievementUnlocked => (
        context.t.notifications.achievement_title,
        context.t.notifications.achievement_message(
          name: _achievementName(context, payload),
          points: payload['achievement_points']?.toString() ?? '0',
        ),
      ),
    InboxNotificationType.levelUp => (
        context.t.notifications.level_title,
        context.t.notifications.level_message(
          level: payload['new_level']?.toString() ?? '—',
        ),
      ),
    InboxNotificationType.system || InboxNotificationType.unknown => (
        payload['title']?.toString() ?? context.t.notifications.system_title,
        payload['message']?.toString() ?? '',
      ),
  };
}

String _achievementName(BuildContext context, Map<String, Object?> payload) {
  final names = context.t.notifications.achievement_names;
  final localized = switch (payload['achievement_code']?.toString()) {
    'FIRST_QUESTION' => names.FIRST_QUESTION,
    'FIRST_CORRECT' => names.FIRST_CORRECT,
    'QUESTION_MASTER_10' => names.QUESTION_MASTER_10,
    'QUESTION_MASTER_50' => names.QUESTION_MASTER_50,
    'QUESTION_MASTER_100' => names.QUESTION_MASTER_100,
    'PERFECT_10' => names.PERFECT_10,
    'PERFECT_50' => names.PERFECT_50,
    'STREAK_3' => names.STREAK_3,
    'STREAK_7' => names.STREAK_7,
    'STREAK_30' => names.STREAK_30,
    'POINTS_100' => names.POINTS_100,
    'POINTS_500' => names.POINTS_500,
    'POINTS_1000' => names.POINTS_1000,
    'ACCURACY_80' => names.ACCURACY_80,
    'ACCURACY_90' => names.ACCURACY_90,
    'ACCURACY_95' => names.ACCURACY_95,
    'FLAWLESS' => names.FLAWLESS,
    _ => null,
  };
  return localized ?? payload['achievement_name']?.toString() ?? '—';
}

IconData _icon(InboxNotificationType type) => switch (type) {
      InboxNotificationType.achievementUnlocked => Icons.emoji_events_outlined,
      InboxNotificationType.levelUp => Icons.north_east,
      InboxNotificationType.system ||
      InboxNotificationType.unknown =>
        Icons.bolt,
    };

String _sectionLabel(BuildContext context, DateTime value) {
  final local = value.toLocal();
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final day = DateTime(local.year, local.month, local.day);
  final difference = today.difference(day).inDays;
  if (difference == 0) return context.t.notifications.today;
  if (difference == 1) return context.t.notifications.yesterday;
  return context.t.notifications.earlier;
}

String _dateLabel(DateTime value) {
  final local = value.toLocal();
  final day = local.day.toString().padLeft(2, '0');
  final month = local.month.toString().padLeft(2, '0');
  final hour = local.hour.toString().padLeft(2, '0');
  final minute = local.minute.toString().padLeft(2, '0');
  return '$day.$month · $hour:$minute';
}

void _openDestination(
  BuildContext context,
  InboxNotificationDestination destination,
) {
  switch (destination) {
    case InboxNotificationDestination.home:
      context.go('/');
    case InboxNotificationDestination.rating:
      context.go('/rating');
    case InboxNotificationDestination.profile:
      context.go('/profile');
    case InboxNotificationDestination.achievements:
      context.push('/profile/achievements');
    case InboxNotificationDestination.review:
      context.push('/profile/review');
    case InboxNotificationDestination.none:
      break;
  }
}
