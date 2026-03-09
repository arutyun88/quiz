import 'dart:async';

import 'package:injectable/injectable.dart';

abstract class UnauthorizedEventService {
  Stream<void> get stream;
  void notify();
}

@Singleton(as: UnauthorizedEventService)
class UnauthorizedEventServiceImpl implements UnauthorizedEventService {
  final _controller = StreamController<void>.broadcast();
  @override
  Stream<void> get stream => _controller.stream;
  @override
  void notify() => _controller.add(null);
}
