import 'dart:async';

import 'package:flutter/material.dart';

class PressableButton<T> extends StatefulWidget {
  final Widget child;
  final FutureOr Function() onPressed;
  final Function(T)? onComplete;
  final Function(Object)? onError;

  const PressableButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.onComplete,
    this.onError,
  });

  @override
  State<PressableButton<T>> createState() => _PressableButtonState<T>();
}

class _PressableButtonState<T> extends State<PressableButton<T>> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  bool _isLoading = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: .95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (!_isPressed && !_isLoading) {
      _controller.forward();
      _isPressed = true;
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (_isPressed && !_isLoading) {
      _controller.reverse();
      _isPressed = false;
      _executeOnPressed();
    }
  }

  void _onTapCancel() {
    if (_isPressed && !_isLoading) {
      _controller.reverse();
      _isPressed = false;
    }
  }

  Future<void> _executeOnPressed() async {
    setState(() => _isLoading = true);

    try {
      final result = await widget.onPressed();
      widget.onComplete?.call(result);
    } catch (error) {
      widget.onError?.call(error);
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: widget.child,
          );
        },
      ),
    );
  }
}
