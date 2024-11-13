import 'dart:async';

import 'package:flutter/material.dart';

const _animationDuration = Duration(milliseconds: 500);
const _bottomOffset = Offset(0.0, 0.35);
const _topOffset = Offset(0.0, -0.35);
const _smallTopOffset = Offset(0.0, -0.10);
const _smallBottomOffset = Offset(0.0, 0.10);

/// Show appearing widget with a given [FadedSlideAnimatedWidget.delay]
/// from the given [FadedSlideAnimatedWidget.offset] to [Offset.zero].
/// The duration of appearance is [_animationDuration].
class FadedSlideAnimatedWidget extends StatefulWidget {
  final Offset startOffset;
  final Duration delay;
  final Widget child;

  const FadedSlideAnimatedWidget({
    super.key,
    required this.startOffset,
    required this.child,
    this.delay = Duration.zero,
  });

  const FadedSlideAnimatedWidget.fromBottom({
    super.key,
    this.delay = Duration.zero,
    required this.child,
  }) : startOffset = _bottomOffset;

  const FadedSlideAnimatedWidget.fromTop({
    super.key,
    this.delay = Duration.zero,
    required this.child,
  }) : startOffset = _topOffset;

  const FadedSlideAnimatedWidget.slightlyFromBottom({
    super.key,
    this.delay = Duration.zero,
    required this.child,
  }) : startOffset = _smallBottomOffset;

  const FadedSlideAnimatedWidget.slightlyFromTop({
    super.key,
    this.delay = Duration.zero,
    required this.child,
  }) : startOffset = _smallTopOffset;

  @override
  State<StatefulWidget> createState() => _FadedSlideAnimatedWidgetState();
}

class _FadedSlideAnimatedWidgetState extends State<FadedSlideAnimatedWidget>
    with TickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    const duration = _animationDuration;
    _controller = AnimationController(vsync: this, duration: duration);

    final offsetTween = Tween<Offset>(
      begin: widget.startOffset,
      end: Offset.zero,
    );
    final offsetAnimation = CurvedAnimation(
      curve: Curves.decelerate,
      parent: _controller,
    );
    _offsetAnimation = offsetTween.animate(offsetAnimation);

    _timer = Timer(widget.delay, () => _controller.forward());
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
      ),
    );
  }
}
