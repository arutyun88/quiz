import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/sync/presentation/provider/sync_provider.dart';

class SyncSnackbarOverlay extends ConsumerStatefulWidget {
  final Widget child;

  const SyncSnackbarOverlay({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<SyncSnackbarOverlay> createState() => _SyncSnackbarOverlayState();
}

class _SyncSnackbarOverlayState extends ConsumerState<SyncSnackbarOverlay> {
  final GlobalKey<OverlayState> _overlayKey = GlobalKey<OverlayState>();
  OverlayEntry? _overlayEntry;
  SyncStatus? _previousSyncStatus;
  // Добавляем стрим контроллер для обновления содержимого
  final StreamController<SyncStatus> _statusController = StreamController<SyncStatus>.broadcast();

  @override
  Widget build(BuildContext context) {
    ref.listen<SyncState>(syncProvider, (previous, current) {
      if (current.status != _previousSyncStatus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _updateOverlay(current.status);
          }
        });
        _previousSyncStatus = current.status;
      }
    });

    return Overlay(
      key: _overlayKey,
      initialEntries: [
        OverlayEntry(
          builder: (context) => widget.child,
        ),
      ],
    );
  }

  void _updateOverlay(SyncStatus status) {
    debugPrint('Обновление оверлея: $status');

    if (status == SyncStatus.syncing || status == SyncStatus.synchronized || status == SyncStatus.syncFailed) {
      if (_overlayEntry == null) {
        // Создаем оверлей только если его еще нет
        _showOverlay(status);
      }
      // Обновляем содержимое через стрим
      _statusController.add(status);
    } else {
      // Для других статусов удаляем оверлей
      _removeOverlay();
    }
  }

  void _showOverlay(SyncStatus initialStatus) {
    debugPrint('Показ оверлея');
    if (!mounted) {
      debugPrint('Виджет не подключен, отмена показа оверлея');
      return;
    }

    try {
      _overlayEntry = OverlayEntry(
        builder: (context) => _SyncSnackbarWidget(
          statusStream: _statusController.stream,
          initialStatus: initialStatus,
          onDismiss: _removeOverlay,
        ),
      );

      final overlay = _overlayKey.currentState;

      if (overlay != null) {
        overlay.insert(_overlayEntry!);
        debugPrint('Оверлей успешно добавлен');
      } else {
        debugPrint('Overlay не найден');
        _overlayEntry = null;
      }
    } catch (e) {
      debugPrint('Ошибка при создании оверлея: $e');
      _overlayEntry = null;
    }
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      debugPrint('Удаление оверлея');
      try {
        if (_overlayEntry!.mounted) {
          _overlayEntry!.remove();
          debugPrint('Оверлей успешно удален');
        } else {
          debugPrint('Оверлей уже был удален');
        }
      } catch (e) {
        debugPrint('Ошибка при удалении оверлея: $e');
      } finally {
        _overlayEntry = null;
      }
    }
  }

  @override
  void dispose() {
    _removeOverlay();
    _statusController.close();
    super.dispose();
  }
}

class _SyncSnackbarWidget extends StatefulWidget {
  final Stream<SyncStatus> statusStream;
  final SyncStatus initialStatus;
  final VoidCallback onDismiss;

  const _SyncSnackbarWidget({
    required this.statusStream,
    required this.initialStatus,
    required this.onDismiss,
  });

  @override
  State<_SyncSnackbarWidget> createState() => __SyncSnackbarWidgetState();
}

class __SyncSnackbarWidgetState extends State<_SyncSnackbarWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  Timer? _dismissTimer;
  SyncStatus? _currentStatus;
  late StreamSubscription<SyncStatus> _statusSubscription;

  @override
  void initState() {
    super.initState();

    // Устанавливаем начальный статус
    _currentStatus = widget.initialStatus;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    // Обрабатываем начальный статус
    _handleStatusChange(widget.initialStatus);

    // Подписываемся на изменения статуса
    _statusSubscription = widget.statusStream.listen((status) {
      if (mounted) {
        setState(() {
          _currentStatus = status;
        });
        _handleStatusChange(status);
      }
    });
  }

  void _handleStatusChange(SyncStatus status) {
    // Отменяем предыдущий таймер
    _dismissTimer?.cancel();

    // Если статус не syncing, запускаем таймер для скрытия
    if (status != SyncStatus.syncing) {
      _dismissTimer = Timer(const Duration(seconds: 2), () {
        if (mounted) {
          _controller.reverse().then((_) {
            if (mounted) {
              widget.onDismiss();
            }
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _statusSubscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Если статус еще не установлен, показываем пустой контейнер
    if (_currentStatus == null) {
      return const SizedBox.shrink();
    }

    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      right: 16,
      child: SlideTransition(
        position: _slideAnimation,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            constraints: const BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              color: _getBackgroundColor(_currentStatus!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildIcon(_currentStatus!),
                const SizedBox(width: 8),
                Flexible(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      _getMessage(_currentStatus!),
                      key: ValueKey(_currentStatus),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(SyncStatus status) {
    return switch (status) {
      SyncStatus.syncing => Colors.blue,
      SyncStatus.synchronized => Colors.green,
      SyncStatus.syncFailed => Colors.red,
      SyncStatus.noInternetConnection => Colors.grey,
    };
  }

  Widget _buildIcon(SyncStatus status) {
    switch (status) {
      case SyncStatus.syncing:
        return const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      case SyncStatus.synchronized:
        return const Icon(Icons.check_circle, color: Colors.white, size: 16);
      case SyncStatus.syncFailed:
        return const Icon(Icons.error, color: Colors.white, size: 16);
      default:
        return const SizedBox.shrink();
    }
  }

  String _getMessage(SyncStatus status) {
    switch (status) {
      case SyncStatus.syncing:
        return 'Синхронизация...';
      case SyncStatus.synchronized:
        return 'Синхронизация завершена успешно';
      case SyncStatus.syncFailed:
        return 'Ошибка синхронизации';
      default:
        return '';
    }
  }
}
