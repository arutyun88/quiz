import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz/features/snackbar/adapters/snackbar_adapter.dart';
import 'package:quiz/features/snackbar/domain/snackbar_message.dart';
import 'package:quiz/features/snackbar/provider/snackbar_provider.dart';

/// Перечисление для определения позиции стека снэкбаров на экране.
///
/// Определяет, в каком углу экрана будут появляться и располагаться
/// снэкбары друг относительно друга.
///
/// Варианты расположения:
/// - [topLeft] - левый верхний угол
/// - [topRight] - правый верхний угол (по умолчанию)
/// - [bottomLeft] - левый нижний угол
/// - [bottomRight] - правый нижний угол
///
/// ---
///
/// Enumeration for defining snackbar stack position on screen.
///
/// Determines in which corner of the screen snackbars will appear
/// and stack relative to each other.
///
/// Position options:
/// - [topLeft] - top left corner
/// - [topRight] - top right corner (default)
/// - [bottomLeft] - bottom left corner
/// - [bottomRight] - bottom right corner
enum StackAlignment {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

/// Главный виджет для отображения снэкбаров поверх интерфейса приложения.
///
/// [SnackbarOverlay] - это комплексное решение для управления снэкбарами,
/// которое объединяет в себе:
/// - Систему overlay для отображения поверх других виджетов
/// - Менеджер адаптеров для интеграции с внешними системами
/// - Анимированное стекирование нескольких сообщений
/// - Автоматическое скрытие с настраиваемыми таймерами
/// - Гибкое позиционирование на экране
///
/// Основные возможности:
/// - Поддержка множественных адаптеров (Firebase, Analytics, Logging)
/// - Ограничение количества одновременно видимых сообщений
/// - Анимации появления, стекирования и исчезновения
/// - Автоматическое управление жизненным циклом сообщений
/// - Реактивная интеграция с Riverpod состоянием
///
/// Пример базового использования:
/// ```dart
/// MaterialApp(
///   home: SnackbarOverlay(
///     child: MyHomePage(),
///     stackAlignment: StackAlignment.topRight,
///     maxVisibleMessages: 3,
///     padding: EdgeInsets.all(16),
///   ),
/// );
/// ```
///
/// Пример с адаптерами:
/// ```dart
/// SnackbarOverlay(
///   child: MyApp(),
///   adapters: [
///     FirebaseSnackbarAdapter(),
///     AnalyticsSnackbarAdapter(),
///     LoggingSnackbarAdapter(),
///   ],
///   maxVisibleMessages: 5,
/// );
/// ```
///
/// ---
///
/// Main widget for displaying snackbars over application interface.
///
/// [SnackbarOverlay] is a comprehensive solution for snackbar management
/// that combines:
/// - Overlay system for displaying over other widgets
/// - Adapter manager for external system integration
/// - Animated stacking of multiple messages
/// - Automatic hiding with configurable timers
/// - Flexible screen positioning
///
/// Key features:
/// - Multiple adapter support (Firebase, Analytics, Logging)
/// - Limit of simultaneously visible messages
/// - Appearance, stacking and disappearance animations
/// - Automatic message lifecycle management
/// - Reactive Riverpod state integration
///
/// Basic usage example:
/// ```dart
/// MaterialApp(
///   home: SnackbarOverlay(
///     child: MyHomePage(),
///     stackAlignment: StackAlignment.topRight,
///     maxVisibleMessages: 3,
///     padding: EdgeInsets.all(16),
///   ),
/// );
/// ```
///
/// Example with adapters:
/// ```dart
/// SnackbarOverlay(
///   child: MyApp(),
///   adapters: [
///     FirebaseSnackbarAdapter(),
///     AnalyticsSnackbarAdapter(),
///     LoggingSnackbarAdapter(),
///   ],
///   maxVisibleMessages: 5,
/// );
/// ```
class SnackbarOverlay extends ConsumerStatefulWidget {
  /// Дочерний виджет, поверх которого будут отображаться снэкбары.
  /// Обычно это корневой виджет приложения или конкретного экрана.
  ///
  /// ---
  ///
  /// Child widget over which snackbars will be displayed.
  /// Usually this is the root widget of the app or specific screen.
  final Widget child;

  /// Список адаптеров для интеграции с внешними системами.
  ///
  /// Адаптеры позволяют автоматически реагировать на события в приложении
  /// и показывать соответствующие уведомления. Например:
  /// - Firebase Messaging адаптер для push-уведомлений
  /// - Network адаптер для статуса соединения
  /// - Analytics адаптер для отслеживания ошибок
  ///
  /// ---
  ///
  /// List of adapters for external system integration.
  ///
  /// Adapters allow automatic reaction to app events
  /// and show corresponding notifications. For example:
  /// - Firebase Messaging adapter for push notifications
  /// - Network adapter for connection status
  /// - Analytics adapter for error tracking
  final List<SnackbarAdapter> adapters;

  /// Отступы от краев экрана для позиционирования снэкбаров.
  ///
  /// Если не указано, используются отступы по умолчанию (16px со всех сторон).
  /// Учитывает безопасные зоны устройства автоматически.
  ///
  /// ---
  ///
  /// Padding from screen edges for snackbar positioning.
  ///
  /// If not specified, default padding is used (16px from all sides).
  /// Automatically considers device safe areas.
  final EdgeInsets? padding;

  /// Максимальное количество одновременно видимых сообщений.
  ///
  /// При превышении лимита старые сообщения автоматически скрываются.
  /// Помогает избежать переполнения интерфейса уведомлениями.
  /// Рекомендуемые значения: 3-7 сообщений.
  ///
  /// ---
  ///
  /// Maximum number of simultaneously visible messages.
  ///
  /// When limit is exceeded, old messages are automatically hidden.
  /// Helps avoid interface overflow with notifications.
  /// Recommended values: 3-7 messages.
  final int maxVisibleMessage;

  /// Позиция стека снэкбаров на экране.
  ///
  /// Определяет, в каком углу экрана будут появляться снэкбары
  /// и в каком направлении они будут стекироваться.
  ///
  /// ---
  ///
  /// Position of snackbar stack on screen.
  ///
  /// Determines in which corner snackbars will appear
  /// and in which direction they will stack.
  final StackAlignment alignment;

  const SnackbarOverlay({
    super.key,
    required this.child,
    this.adapters = const [],
    this.padding,
    this.maxVisibleMessage = 5,
    this.alignment = StackAlignment.topRight,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SnackbarOverlayState();
}

class _SnackbarOverlayState extends ConsumerState<SnackbarOverlay> {
  /// Ключ для доступа к состоянию Overlay.
  /// Используется для добавления и удаления overlay entries.
  ///
  /// ---
  ///
  /// Key for accessing Overlay state.
  /// Used for adding and removing overlay entries.
  final GlobalKey<OverlayState> _overlayKey = GlobalKey<OverlayState>();

  /// Карта активных overlay entries по ID сообщений.
  /// Позволяет быстро находить и управлять конкретными снэкбарами.
  ///
  /// ---
  ///
  /// Map of active overlay entries by message IDs.
  /// Allows quick finding and managing of specific snackbars.
  final Map<String, OverlayEntry> _overlayEntries = {};

  /// Карта таймеров автоскрытия по ID сообщений.
  /// Каждое непостоянное сообщение имеет таймер для автоматического скрытия.
  ///
  /// ---
  ///
  /// Map of auto-hide timers by message IDs.
  /// Each non-persistent message has a timer for automatic hiding.
  final Map<String, Timer> _autoHideTimers = {};

  /// Набор ID инициализированных адаптеров.
  /// Предотвращает повторную инициализацию и отслеживает состояние.
  ///
  /// ---
  ///
  /// Set of initialized adapter IDs.
  /// Prevents duplicate initialization and tracks state.
  final Set<String> _initializedAdapters = {};

  @override
  void initState() {
    super.initState();
    _initializeAdapters();
  }

  @override
  void didUpdateWidget(covariant SnackbarOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Проверяем, изменился ли список адаптеров
    // Check if adapter list changed
    final oldAdapterIds = oldWidget.adapters.map((adapter) => adapter.id).toSet();
    final newAdapterIds = widget.adapters.map((adapter) => adapter.id).toSet();

    if (!oldAdapterIds.containsAll(newAdapterIds) || !newAdapterIds.containsAll(oldAdapterIds)) {
      _reinitializeAdapters();
    }
  }

  /// Инициализирует все адаптеры после построения виджета.
  ///
  /// Выполняется в `addPostFrameCallback` для гарантии того,
  /// что виджет полностью построен и context доступен.
  /// Обрабатывает ошибки инициализации без прерывания работы.
  ///
  /// Процесс инициализации:
  /// 1. Проверка, что виджет все еще смонтирован
  /// 2. Перебор всех адаптеров
  /// 3. Проверка, что адаптер еще не инициализирован
  /// 4. Вызов метода initialize адаптера
  /// 5. Добавление ID в набор инициализированных
  /// 6. Логирование результатов
  ///
  /// ---
  ///
  /// Initializes all adapters after widget build.
  ///
  /// Executed in `addPostFrameCallback` to ensure
  /// widget is fully built and context is available.
  /// Handles initialization errors without breaking functionality.
  ///
  /// Initialization process:
  /// 1. Check that widget is still mounted
  /// 2. Iterate through all adapters
  /// 3. Check that adapter is not yet initialized
  /// 4. Call adapter's initialize method
  /// 5. Add ID to initialized set
  /// 6. Log results
  void _initializeAdapters() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        for (final adapter in widget.adapters) {
          if (!_initializedAdapters.contains(adapter.id)) {
            try {
              adapter.initialize(ref);
              _initializedAdapters.add(adapter.id);
              debugPrint('Adapter ${adapter.id} initialized');
            } catch (e) {
              debugPrint('Adapter ${adapter.id} initialization error: $e');
            }
          }
        }
      }
    });
  }

  /// Переинициализирует адаптеры при изменении их списка.
  ///
  /// Процедура:
  /// 1. Очищает все существующие адаптеры
  /// 2. Вызывает dispose() для каждого инициализированного адаптера
  /// 3. Очищает набор инициализированных адаптеров
  /// 4. Запускает повторную инициализацию
  ///
  /// Используется при hot reload или динамическом изменении конфигурации.
  ///
  /// ---
  ///
  /// Reinitializes adapters when their list changes.
  ///
  /// Procedure:
  /// 1. Clears all existing adapters
  /// 2. Calls dispose() for each initialized adapter
  /// 3. Clears initialized adapters set
  /// 4. Starts reinitialization
  ///
  /// Used during hot reload or dynamic configuration changes.
  void _reinitializeAdapters() {
    for (final adapter in widget.adapters) {
      if (_initializedAdapters.contains(adapter.id)) {
        try {
          adapter.dispose();
        } catch (e) {
          debugPrint('Adapter ${adapter.id} disposing error: $e');
        }
      }
    }

    _initializedAdapters.clear();
    _initializeAdapters();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SnackbarState>(
      snackbarProvider,
      (previous, current) => WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _updateOverlays(previous?.sortedMessages ?? [], current.sortedMessages);
        }
      }),
    );

    return Overlay(
      key: _overlayKey,
      initialEntries: [
        OverlayEntry(builder: (context) => widget.child),
      ],
    );
  }

  /// Обновляет состояние overlay в соответствии с изменениями сообщений.
  ///
  /// Алгоритм обновления:
  /// 1. Определяет удаленные сообщения и скрывает их overlay
  /// 2. Ограничивает количество видимых сообщений максимумом
  /// 3. Скрывает сообщения, превышающие лимит видимости
  /// 4. Добавляет новые сообщения или обновляет позиции существующих
  ///
  /// Параметры:
  /// - [previousMessages] - предыдущий список сообщений
  /// - [currentMessages] - текущий список сообщений
  ///
  /// ---
  ///
  /// Updates overlay state according to message changes.
  ///
  /// Update algorithm:
  /// 1. Identifies removed messages and hides their overlays
  /// 2. Limits visible messages count to maximum
  /// 3. Hides messages exceeding visibility limit
  /// 4. Adds new messages or updates existing positions
  ///
  /// Parameters:
  /// - [previousMessages] - previous message list
  /// - [currentMessages] - current message list
  void _updateOverlays(
    List<SnackbarMessage> previousMessages,
    List<SnackbarMessage> currentMessages,
  ) {
    final previousIds = previousMessages.map((m) => m.id).toSet();
    final currentIds = currentMessages.map((m) => m.id).toSet();

    // Удаляем исчезнувшие снэкбары
    // Remove disappeared snackbars
    final removedIds = previousIds.difference(currentIds);
    for (final id in removedIds) {
      _removeOverlay(id);
    }

    // Ограничиваем количество видимых сообщений
    // Limit visible messages count
    final visibleMessages = currentMessages.take(widget.maxVisibleMessage).toList();
    final visibleIds = visibleMessages.map((m) => m.id).toSet();

    // Скрываем сообщения, которые превышают лимит
    // Hide messages exceeding limit
    final hiddenIds = currentIds.difference(visibleIds);
    for (final id in hiddenIds) {
      _removeOverlay(id);
    }

    // Добавляем/обновляем видимые снэкбары
    // Add/update visible snackbars
    for (int i = 0; i < visibleMessages.length; i++) {
      final message = visibleMessages[i];
      if (!previousIds.contains(message.id)) {
        _showOverlay(message, i);
      } else {
        _updateOverlayPosition(message.id, i);
      }
    }
  }

  /// Создает и показывает overlay для нового сообщения.
  ///
  /// Процесс создания:
  /// 1. Проверка, что виджет все еще смонтирован
  /// 2. Создание OverlayEntry с анимированным виджетом
  /// 3. Вставка entry в overlay state
  /// 4. Сохранение ссылки в карте активных entries
  /// 5. Настройка таймера автоскрытия
  ///
  /// Параметры:
  /// - [message] - сообщение для отображения
  /// - [index] - позиция в стеке (0 = верхнее)
  ///
  /// ---
  ///
  /// Creates and shows overlay for new message.
  ///
  /// Creation process:
  /// 1. Check that widget is still mounted
  /// 2. Create OverlayEntry with animated widget
  /// 3. Insert entry into overlay state
  /// 4. Save reference in active entries map
  /// 5. Set up auto-hide timer
  ///
  /// Parameters:
  /// - [message] - message to display
  /// - [index] - position in stack (0 = top)
  void _showOverlay(SnackbarMessage message, int index) {
    if (!mounted) return;

    try {
      final entry = OverlayEntry(
        builder: (context) => _StackedSnackbarWidget(
          message: message,
          index: index,
          alignment: widget.alignment,
          padding: widget.padding ?? const EdgeInsets.all(16.0),
          onDismiss: () => _removeOverlay(message.id),
        ),
      );

      final overlay = _overlayKey.currentState;
      if (overlay != null) {
        overlay.insert(entry);
        _overlayEntries[message.id] = entry;

        // Настройка автоскрытия
        // Set up auto-hide
        _scheduleAutoHide(message);
      }
    } catch (e) {
      debugPrint('Snackbar creating error: $e');
    }
  }

  /// Настраивает таймер автоматического скрытия для сообщения.
  ///
  /// Логика работы:
  /// 1. Отменяет предыдущий таймер для этого ID (если есть)
  /// 2. Пропускает персистентные сообщения и loading индикаторы
  /// 3. Использует duration из сообщения или стандартное для типа
  /// 4. Создает Timer, который скроет сообщение через заданное время
  ///
  /// Стандартные длительности:
  /// - Success: 2 секунды
  /// - Info: 2 секунды
  /// - Warning: 3 секунды
  /// - Error: 4 секунды
  /// - Loading: не скрывается автоматически
  ///
  /// Параметры:
  /// - [message] - сообщение для настройки автоскрытия
  ///
  /// ---
  ///
  /// Sets up automatic hide timer for message.
  ///
  /// Logic:
  /// 1. Cancels previous timer for this ID (if exists)
  /// 2. Skips persistent messages and loading indicators
  /// 3. Uses duration from message or default for type
  /// 4. Creates Timer that will hide message after specified time
  ///
  /// Default durations:
  /// - Success: 2 seconds
  /// - Info: 2 seconds
  /// - Warning: 3 seconds
  /// - Error: 4 seconds
  /// - Loading: not hidden automatically
  ///
  /// Parameters:
  /// - [message] - message to set up auto-hide for
  void _scheduleAutoHide(SnackbarMessage message) {
    // Отменяем предыдущий таймер
    // Cancel previous timer
    _autoHideTimers[message.id]?.cancel();

    // Не устанавливаем таймер для персистентных сообщений или loading
    // Don't set timer for persistent messages or loading
    if (message.persistent || message.type == SnackbarType.loading) {
      return;
    }

    final duration = message.duration ?? _getDefaultDuration(message.type);
    if (duration != null) {
      _autoHideTimers[message.id] = Timer(
        duration,
        () {
          if (mounted) {
            ref.read(snackbarProvider.notifier).hideSnackbar(message.id);
          }
        },
      );
    }
  }

  /// Обновляет позицию существующего overlay в стеке.
  ///
  /// В текущей реализации для простоты пересоздает overlay с новой позицией.
  /// В более сложной реализации можно добавить анимацию плавного перемещения.
  ///
  /// Процесс:
  /// 1. Находит сообщение по ID в текущем состоянии
  /// 2. Удаляет старый overlay
  /// 3. Создает новый overlay с обновленной позицией
  ///
  /// Параметры:
  /// - [id] - идентификатор сообщения
  /// - [newIndex] - новая позиция в стеке
  ///
  /// ---
  ///
  /// Updates position of existing overlay in stack.
  ///
  /// Current implementation recreates overlay with new position for simplicity.
  /// More complex implementation could add smooth movement animation.
  ///
  /// Process:
  /// 1. Finds message by ID in current state
  /// 2. Removes old overlay
  /// 3. Creates new overlay with updated position
  ///
  /// Parameters:
  /// - [id] - message identifier
  /// - [newIndex] - new position in stack
  void _updateOverlayPosition(String id, int newIndex) {
    final message = ref.read(snackbarProvider).messages.firstWhere((m) => m.id == id);
    _removeOverlay(id);
    _showOverlay(message, newIndex);
  }

  /// Удаляет overlay и очищает связанные ресурсы.
  ///
  /// Процедура очистки:
  /// 1. Отменяет и удаляет таймер автоскрытия
  /// 2. Извлекает OverlayEntry из карты активных
  /// 3. Проверяет, что entry смонтирован
  /// 4. Удаляет entry из overlay
  /// 5. Удаляет ссылку из карты
  /// 6. Обрабатывает возможные ошибки
  ///
  /// Параметры:
  /// - [id] - идентификатор сообщения для удаления
  ///
  /// ---
  ///
  /// Removes overlay and cleans up related resources.
  ///
  /// Cleanup procedure:
  /// 1. Cancels and removes auto-hide timer
  /// 2. Retrieves OverlayEntry from active map
  /// 3. Checks that entry is mounted
  /// 4. Removes entry from overlay
  /// 5. Removes reference from map
  /// 6. Handles possible errors
  ///
  /// Parameters:
  /// - [id] - message identifier to remove
  void _removeOverlay(String id) {
    _autoHideTimers[id]?.cancel();
    _autoHideTimers.remove(id);

    final entry = _overlayEntries[id];
    if (entry != null) {
      try {
        if (entry.mounted) {
          entry.remove();
        }
      } catch (e) {
        debugPrint('Snackbar remove error: $e');
      } finally {
        _overlayEntries.remove(id);
      }
    }
  }

  /// Возвращает стандартную продолжительность отображения для типа сообщения.
  ///
  /// Стандартные значения:
  /// - Success: 2 секунды (быстрое подтверждение)
  /// - Info: 2 секунды (нейтральная информация)
  /// - Warning: 3 секунды (требует внимания)
  /// - Error: 4 секунды (важная информация)
  /// - Loading: null (персистентное, скрывается вручную)
  ///
  /// Параметры:
  /// - [type] - тип сообщения
  ///
  /// Возвращает: продолжительность или null для персистентных
  ///
  /// ---
  ///
  /// Returns default display duration for message type.
  ///
  /// Default values:
  /// - Success: 2 seconds (quick confirmation)
  /// - Info: 2 seconds (neutral information)
  /// - Warning: 3 seconds (requires attention)
  /// - Error: 4 seconds (important information)
  /// - Loading: null (persistent, hidden manually)
  ///
  /// Parameters:
  /// - [type] - message type
  ///
  /// Returns: duration or null for persistent
  Duration? _getDefaultDuration(SnackbarType type) => switch (type) {
        SnackbarType.success => const Duration(seconds: 2),
        SnackbarType.info => const Duration(seconds: 2),
        SnackbarType.warning => const Duration(seconds: 3),
        SnackbarType.error => const Duration(seconds: 4),
        SnackbarType.loading => null,
      };

  @override
  void dispose() {
    // Очищаем все адаптеры
    // Clean up all adapters
    for (final adapter in widget.adapters) {
      if (_initializedAdapters.contains(adapter.id)) {
        try {
          adapter.dispose();
        } catch (e) {
          debugPrint('Adapter ${adapter.id} when disposing error: $e');
        }
      }
    }
    _initializedAdapters.clear();

    // Очищаем таймеры и overlay entries
    // Clean up timers and overlay entries
    for (final timer in _autoHideTimers.values) {
      timer.cancel();
    }
    _autoHideTimers.clear();

    for (final entry in _overlayEntries.values) {
      if (entry.mounted) {
        entry.remove();
      }
    }
    _overlayEntries.clear();

    super.dispose();
  }
}

/// Виджет для отображения отдельного снэкбара в стеке.
///
/// [_StackedSnackbarWidget] - это анимированный виджет, который:
/// - Отображает одно сообщение с соответствующим стилем
/// - Поддерживает анимации появления, стекирования и исчезновения
/// - Автоматически позиционируется в стеке относительно других сообщений
/// - Реагирует на изменения позиции в стеке с плавными переходами
///
/// Особенности анимации:
/// - Slide animation: появление сбоку экрана
/// - Scale animation: уменьшение масштаба для элементов в глубине стека
/// - Opacity animation: снижение прозрачности для создания эффекта глубины
/// - Position animation: плавное изменение позиции при перестановке
///
/// Визуальные эффекты стекирования:
/// - Каждый последующий элемент немного меньше по размеру
/// - Каждый последующий элемент немного прозрачнее
/// - Каждый последующий элемент имеет большую высоту (elevation)
/// - Каждый последующий элемент имеет более темный цвет фона
///
/// ---
///
/// Widget for displaying individual snackbar in stack.
///
/// [_StackedSnackbarWidget] is an animated widget that:
/// - Displays single message with appropriate styling
/// - Supports appearance, stacking and disappearance animations
/// - Automatically positions in stack relative to other messages
/// - Reacts to stack position changes with smooth transitions
///
/// Animation features:
/// - Slide animation: appearance from screen side
/// - Scale animation: size reduction for elements deeper in stack
/// - Opacity animation: transparency reduction for depth effect
/// - Position animation: smooth position change during reordering
///
/// Stacking visual effects:
/// - Each subsequent element is slightly smaller
/// - Each subsequent element is slightly more transparent
/// - Each subsequent element has higher elevation
/// - Each subsequent element has darker background color
class _StackedSnackbarWidget extends StatefulWidget {
  /// Сообщение для отображения.
  ///
  /// ---
  ///
  /// Message to display.
  final SnackbarMessage message;

  /// Позиция сообщения в стеке (0 = верхнее, видимое полностью).
  ///
  /// Используется для расчета:
  /// - Вертикального смещения (каждый элемент ниже предыдущего)
  /// - Масштаба (элементы в глубине стека меньше)
  /// - Прозрачности (элементы в глубине стека прозрачнее)
  /// - Цвета фона (элементы в глубине стека темнее)
  ///
  /// ---
  ///
  /// Position of message in stack (0 = top, fully visible).
  ///
  /// Used for calculating:
  /// - Vertical offset (each element below previous)
  /// - Scale (elements deeper in stack are smaller)
  /// - Opacity (elements deeper in stack are more transparent)
  /// - Background color (elements deeper in stack are darker)
  final int index;

  /// Выравнивание стека на экране.
  ///
  /// Определяет направление анимации появления и позиционирование элементов.
  ///
  /// ---
  ///
  /// Stack alignment on screen.
  ///
  /// Determines appearance animation direction and element positioning.
  final StackAlignment alignment;

  /// Отступы от краев экрана.
  ///
  /// ---
  ///
  /// Padding from screen edges.
  final EdgeInsets padding;

  /// Колбэк для обработки закрытия снэкбара.
  ///
  /// Вызывается при:
  /// - Тапе на снэкбар (если нет действий)
  /// - Нажатии на кнопку закрытия (для персистентных)
  /// - Выполнении действия (для неперсистентных)
  /// - Завершении анимации исчезновения
  ///
  /// ---
  ///
  /// Callback for handling snackbar dismissal.
  ///
  /// Called when:
  /// - Tapping on snackbar (if no actions)
  /// - Pressing close button (for persistent)
  /// - Executing action (for non-persistent)
  /// - Completion of disappearance animatio
  final VoidCallback onDismiss;

  const _StackedSnackbarWidget({
    required this.message,
    required this.index,
    required this.alignment,
    required this.padding,
    required this.onDismiss,
  });

  @override
  State<_StackedSnackbarWidget> createState() => __StackedSnackbarWidgetState();
}

class __StackedSnackbarWidgetState extends State<_StackedSnackbarWidget> with SingleTickerProviderStateMixin {
  /// Основной контроллер анимации.
  ///
  /// Управляет всеми анимациями виджета синхронно.
  /// Значение от 0.0 (начальное состояние) до 1.0 (конечное состояние).
  ///
  /// ---
  ///
  /// Main animation controller.
  ///
  /// Controls all widget animations synchronously.
  /// Value from 0.0 (initial state) to 1.0 (final state).
  late AnimationController _controller;

  /// Анимация скольжения для появления снэкбара.
  ///
  /// Начальное положение зависит от [stackAlignment]:
  /// - Правые позиции: появление справа (1.0, 0.0)
  /// - Левые позиции: появление слева (-1.0, 0.0)
  /// Конечное положение: (0.0, 0.0)
  ///
  /// ---
  ///
  /// Slide animation for snackbar appearance.
  ///
  /// Initial position depends on [stackAlignment]:
  /// - Right positions: appear from right (1.0, 0.0)
  /// - Left positions: appear from left (-1.0, 0.0)
  /// Final position: (0.0, 0.0)
  late Animation<Offset> _slideAnimation;

  /// Анимация масштабирования для эффекта стекирования.
  ///
  /// Рассчитывается динамически на основе позиции в стеке:
  /// - Верхний элемент (index 0): масштаб 1.0
  /// - Каждый следующий: масштаб уменьшается на 0.05
  /// - Максимальное уменьшение: до 0.7 (30% уменьшение)
  ///
  /// ---
  ///
  /// Scale animation for stacking effect.
  ///
  /// Calculated dynamically based on stack position:
  /// - Top element (index 0): scale 1.0
  /// - Each next: scale decreases by 0.05
  /// - Maximum reduction: to 0.7 (30% reduction)
  late Animation<double> _scaleAnimation;

  /// Анимация прозрачности для эффекта глубины.
  ///
  /// Рассчитывается динамически на основе позиции в стеке:
  /// - Верхний элемент (index 0): прозрачность 1.0
  /// - Каждый следующий: прозрачность уменьшается на 0.15
  /// - Минимальная прозрачность: 0.3 (70% прозрачности)
  ///
  /// ---
  ///
  /// Opacity animation for depth effect.
  ///
  /// Calculated dynamically based on stack position:
  /// - Top element (index 0): opacity 1.0
  /// - Each next: opacity decreases by 0.15
  /// - Minimum opacity: 0.3 (70% transparency)
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Анимация появления сбоку
    // Side appearance animation
    _slideAnimation = Tween<Offset>(
      begin: _getSlideBeginOffset(),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Анимация масштаба для стекинга
    // Scale animation for stacking
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: _getTargetScale(),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Анимация прозрачности для стекинга
    // Opacity animation for stacking
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: _getTargetOpacity(),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  Offset _getSlideBeginOffset() => switch (widget.alignment) {
        StackAlignment.topRight || StackAlignment.bottomRight => const Offset(1.0, 0.0),
        StackAlignment.topLeft || StackAlignment.bottomLeft => const Offset(-1.0, 0.0),
      };

  /// Рассчитывает целевой масштаб элемента в стеке.
  ///
  /// Формула: 1.0 - (index * 0.05), ограничено диапазоном [0.7, 1.0]
  ///
  /// Примеры:
  /// - index 0: масштаб 1.0 (100%)
  /// - index 1: масштаб 0.95 (95%)
  /// - index 2: масштаб 0.90 (90%)
  /// - index 6+: масштаб 0.7 (70%, минимум)
  ///
  /// Возвращает: целевой масштаб от 0.7 до 1.0
  ///
  /// ---
  ///
  /// Calculates target scale of element in stack.
  ///
  /// Formula: 1.0 - (index * 0.05), clamped to [0.7, 1.0] range
  ///
  /// Examples:
  /// - index 0: scale 1.0 (100%)
  /// - index 1: scale 0.95 (95%)
  /// - index 2: scale 0.90 (90%)
  /// - index 6+: scale 0.7 (70%, minimum)
  ///
  /// Returns: target scale from 0.7 to 1.0
  double _getTargetScale() {
    // Чем дальше в стеке, тем меньше масштаб
    // The deeper in stack, the smaller the scale
    return 1.0 - (widget.index * 0.05).clamp(0.0, 0.3);
  }

  /// Рассчитывает целевую прозрачность элемента в стеке.
  ///
  /// Формула: 1.0 - (index * 0.15), ограничено диапазоном [0.3, 1.0]
  ///
  /// Примеры:
  /// - index 0: прозрачность 1.0 (полностью видимый)
  /// - index 1: прозрачность 0.85 (15% прозрачности)
  /// - index 2: прозрачность 0.70 (30% прозрачности)
  /// - index 4+: прозрачность 0.3 (70% прозрачности, минимум)
  ///
  /// Возвращает: целевую прозрачность от 0.3 до 1.0
  ///
  /// ---
  ///
  /// Calculates target opacity of element in stack.
  ///
  /// Formula: 1.0 - (index * 0.15), clamped to [0.3, 1.0] range
  ///
  /// Examples:
  /// - index 0: opacity 1.0 (fully visible)
  /// - index 1: opacity 0.85 (15% transparency)
  /// - index 2: opacity 0.70 (30% transparency)
  /// - index 4+: opacity 0.3 (70% transparency, minimum)
  ///
  /// Returns: target opacity from 0.3 to 1.0
  double _getTargetOpacity() {
    // Чем дальше в стеке, тем прозрачнее
    // The deeper in stack, the more transparent
    return (1.0 - (widget.index * 0.15)).clamp(0.3, 1.0);
  }

  @override
  void didUpdateWidget(covariant _StackedSnackbarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Анимируем изменение позиции в стеке
    // Animate stack position change
    if (oldWidget.index != widget.index) {
      _scaleAnimation = Tween<double>(
        begin: _scaleAnimation.value,
        end: _getTargetScale(),
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));

      _opacityAnimation = Tween<double>(
        begin: _opacityAnimation.value,
        end: _getTargetOpacity(),
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Запускает анимацию исчезновения и закрывает снэкбар.
  ///
  /// Процесс:
  /// 1. Запускает обратную анимацию (reverse)
  /// 2. Ждет завершения анимации
  /// 3. Проверяет, что виджет все еще смонтирован
  /// 4. Вызывает колбэк onDismiss для удаления из overlay
  ///
  /// ---
  ///
  /// Starts disappearance animation and closes snackbar.
  ///
  /// Process:
  /// 1. Starts reverse animation
  /// 2. Waits for animation completion
  /// 3. Checks that widget is still mounted
  /// 4. Calls onDismiss callback to remove from overlay
  void _animateOut() {
    _controller.reverse().then((_) {
      if (mounted) {
        widget.onDismiss();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Positioned(
        top: _getTopPosition(mediaQuery),
        bottom: _getBottomPosition(mediaQuery),
        left: _getLeftPosition(),
        right: _getRightPosition(),
        child: Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: SlideTransition(
              position: _slideAnimation,
              child: child,
            ),
          ),
        ),
      ),
      child: _buildSnackbarContent(),
    );
  }

  /// Рассчитывает позицию сверху для верхних выравниваний.
  ///
  /// Учитывает:
  /// - Безопасную зону устройства (MediaQuery.padding.top)
  /// - Отступы виджета (widget.padding.top)
  /// - Смещение по индексу (index * 70.0 пикселей)
  ///
  /// Возвращает: позицию сверху или null для нижних выравниваний
  ///
  /// ---
  ///
  /// Calculates top position for top alignments.
  ///
  /// Considers:
  /// - Device safe area (MediaQuery.padding.top)
  /// - Widget padding (widget.padding.top)
  /// - Index offset (index * 70.0 pixels)
  ///
  /// Returns: top position or null for bottom alignments
  double? _getTopPosition(MediaQueryData mediaQuery) {
    return switch (widget.alignment) {
      StackAlignment.topLeft ||
      StackAlignment.topRight =>
        mediaQuery.padding.top + widget.padding.top + (widget.index * 70.0),
      StackAlignment.bottomLeft || StackAlignment.bottomRight => null,
    };
  }

  /// Рассчитывает позицию снизу для нижних выравниваний.
  ///
  /// Учитывает:
  /// - Безопасную зону устройства (MediaQuery.padding.bottom)
  /// - Отступы виджета (widget.padding.bottom)
  /// - Смещение по индексу (index * 70.0 пикселей)
  ///
  /// Возвращает: позицию снизу или null для верхних выравниваний
  ///
  /// ---
  ///
  /// Calculates bottom position for bottom alignments.
  ///
  /// Considers:
  /// - Device safe area (MediaQuery.padding.bottom)
  /// - Widget padding (widget.padding.bottom)
  /// - Index offset (index * 70.0 pixels)
  ///
  /// Returns: bottom position or null for top alignments
  double? _getBottomPosition(MediaQueryData mediaQuery) {
    return switch (widget.alignment) {
      StackAlignment.bottomLeft ||
      StackAlignment.bottomRight =>
        mediaQuery.padding.bottom + widget.padding.bottom + (widget.index * 70.0),
      StackAlignment.topLeft || StackAlignment.topRight => null,
    };
  }

  /// Рассчитывает позицию слева для левых выравниваний.
  ///
  /// Возвращает: отступ слева или null для правых выравниваний
  ///
  /// ---
  ///
  /// Calculates left position for left alignments.
  ///
  /// Returns: left padding or null for right alignments
  double? _getLeftPosition() {
    return switch (widget.alignment) {
      StackAlignment.topLeft || StackAlignment.bottomLeft => widget.padding.left,
      StackAlignment.topRight || StackAlignment.bottomRight => null,
    };
  }

  /// Рассчитывает позицию справа для правых выравниваний.
  ///
  /// Возвращает: отступ справа или null для левых выравниваний
  ///
  /// ---
  ///
  /// Calculates right position for right alignments.
  ///
  /// Returns: right padding or null for left alignments
  double? _getRightPosition() {
    return switch (widget.alignment) {
      StackAlignment.topRight || StackAlignment.bottomRight => widget.padding.right,
      StackAlignment.topLeft || StackAlignment.bottomLeft => null,
    };
  }

  /// Строит содержимое снэкбара с материальным дизайном.
  ///
  /// Структура:
  /// - Material с elevation, растущим с глубиной стека
  /// - GestureDetector для обработки тапов
  /// - Container с цветом фона, зависящим от типа и позиции
  /// - Column с основным содержимым и действиями
  /// - Row с иконкой, текстом и кнопкой закрытия
  /// - Опциональный ряд с кнопками действий
  ///
  /// Особенности:
  /// - Elevation увеличивается с индексом для эффекта глубины
  /// - Цвет фона темнеет для элементов в глубине стека
  /// - Критические сообщения имеют белую рамку
  /// - Персистентные сообщения показывают кнопку закрытия
  ///
  /// Возвращает: полностью построенный виджет снэкбара
  ///
  /// ---
  ///
  /// Builds snackbar content with material design.
  ///
  /// Structure:
  /// - Material with elevation growing with stack depth
  /// - GestureDetector for tap handling
  /// - Container with background color depending on type and position
  /// - Column with main content and actions
  /// - Row with icon, text and close button
  /// - Optional row with action buttons
  ///
  /// Features:
  /// - Elevation increases with index for depth effect
  /// - Background color darkens for elements deeper in stack
  /// - Critical messages have white border
  /// - Persistent messages show close button
  ///
  /// Returns: fully built snackbar widget
  Widget _buildSnackbarContent() {
    return Material(
      elevation: 6 + widget.index.toDouble(), // Больше высота для верхних элементов
      borderRadius: BorderRadius.circular(8),
      child: GestureDetector(
        onTap: widget.message.actions?.isEmpty ?? true ? _animateOut : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
          decoration: BoxDecoration(
            color: _getBackgroundColor(widget.message.type),
            borderRadius: BorderRadius.circular(8),
            border:
                widget.message.priority == SnackbarPriority.critical ? Border.all(color: Colors.white, width: 2) : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildIcon(widget.message),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      widget.message.message,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: widget.message.priority == SnackbarPriority.critical ? 15 : 14,
                        fontWeight:
                            widget.message.priority == SnackbarPriority.critical ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                  ),
                  if (widget.message.persistent)
                    GestureDetector(
                      onTap: _animateOut,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white70,
                        size: 18,
                      ),
                    ),
                ],
              ),
              if (widget.message.actions?.isNotEmpty ?? false) ...[
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.message.actions!.map((action) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextButton(
                        onPressed: () {
                          action.onPressed();
                          if (!widget.message.persistent) {
                            _animateOut();
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: action.textColor ?? Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          action.label,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Определяет цвет фона снэкбара на основе типа и позиции в стеке.
  ///
  /// Алгоритм:
  /// 1. Выбирает базовый цвет по типу сообщения
  /// 2. Затемняет цвет пропорционально индексу в стеке
  /// 3. Использует Color.lerp для плавного перехода к черному
  ///
  /// Базовые цвета:
  /// - Info: синий (Colors.blue)
  /// - Success: зеленый (Colors.green)
  /// - Warning: оранжевый (Colors.orange)
  /// - Error: красный (Colors.red)
  /// - Loading: синий (Colors.blue)
  ///
  /// Затемнение: каждый индекс добавляет 10% черного цвета
  ///
  /// Параметры:
  /// - [type] - тип сообщения
  ///
  /// Возвращает: рассчитанный цвет фона
  ///
  /// ---
  ///
  /// Determines snackbar background color based on type and stack position.
  ///
  /// Algorithm:
  /// 1. Selects base color by message type
  /// 2. Darkens color proportionally to stack index
  /// 3. Uses Color.lerp for smooth transition to black
  ///
  /// Base colors:
  /// - Info: blue (Colors.blue)
  /// - Success: green (Colors.green)
  /// - Warning: orange (Colors.orange)
  /// - Error: red (Colors.red)
  /// - Loading: blue (Colors.blue)
  ///
  /// Darkening: each index adds 10% black color
  ///
  /// Parameters:
  /// - [type] - message type
  ///
  /// Returns: calculated background color
  Color _getBackgroundColor(SnackbarType type) {
    final baseColor = switch (type) {
      SnackbarType.info => Colors.blue,
      SnackbarType.success => Colors.green,
      SnackbarType.warning => Colors.orange,
      SnackbarType.error => Colors.red,
      SnackbarType.loading => Colors.blue,
    };

    // Делаем цвет темнее для элементов в стеке
    // Make color darker for elements in stack
    return Color.lerp(baseColor, Colors.black, widget.index * 0.1) ?? baseColor;
  }

  /// Строит иконку для сообщения с индикаторами приоритета.
  ///
  /// Логика выбора иконки:
  /// 1. Если у сообщения есть пользовательская иконка - использует её
  /// 2. Иначе выбирает стандартную иконку по типу:
  ///    - Loading: анимированный CircularProgressIndicator
  ///    - Success: галочка (check_circle)
  ///    - Error: ошибка (error)
  ///    - Warning: предупреждение (warning)
  ///    - Info: информация (info)
  ///
  /// Для критических сообщений добавляет желтый индикатор в правом верхнем углу.
  ///
  /// Параметры:
  /// - [message] - сообщение для построения иконки
  ///
  /// Возвращает: виджет иконки с возможными индикаторами
  ///
  /// ---
  ///
  /// Builds icon for message with priority indicators.
  ///
  /// Icon selection logic:
  /// 1. If message has custom icon - uses it
  /// 2. Otherwise selects standard icon by type:
  ///    - Loading: animated CircularProgressIndicator
  ///    - Success: checkmark (check_circle)
  ///    - Error: error (error)
  ///    - Warning: warning (warning)
  ///    - Info: information (info)
  ///
  /// For critical messages adds yellow indicator in top-right corner.
  ///
  /// Parameters:
  /// - [message] - message to build icon for
  ///
  /// Returns: icon widget with possible indicators
  Widget _buildIcon(SnackbarMessage message) {
    if (message.icon != null) {
      return message.icon!;
    }

    final iconWidget = switch (message.type) {
      SnackbarType.loading => const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      SnackbarType.success => const Icon(Icons.check_circle, color: Colors.white, size: 16),
      SnackbarType.error => const Icon(Icons.error, color: Colors.white, size: 16),
      SnackbarType.warning => const Icon(Icons.warning, color: Colors.white, size: 16),
      SnackbarType.info => const Icon(Icons.info, color: Colors.white, size: 16),
    };

    // Добавляем индикатор приоритета для критических сообщений
    // Add priority indicator for critical messages
    if (message.priority == SnackbarPriority.critical) {
      return Stack(
        children: [
          iconWidget,
          Positioned(
            right: -2,
            top: -2,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      );
    }

    return iconWidget;
  }
}
