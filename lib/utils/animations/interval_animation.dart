import 'package:flutter/material.dart';

/// Taking into account that
/// [AnimationController] is typically running values from `0` to `1`,
/// [IntervalAnimation] allows to run animation
/// only in a certaing range of values of the [parent] animation
/// (that is typically [AnimationController]).
///
/// For example, if it is needed to run an animation
/// from 3/4 of the parent animation progress
/// till the end of the parent animation,
/// this class can be used:
/// ```dart
///   // using raw double fraction values
///   animation: IntervalAnimation(
///     parent: _controller,
///     begin: 0.75, // (3 / 4)
///     end: 1,
///   );
///   // or using [Interval]
///   animation: IntervalAnimation.fromInterval(
///     parent: _controller,
///     interval: Interval(0.75, 1),
///   );
///   // or using [Interval] with overriden curve
///   animation: IntervalAnimation.fromInterval(
///     parent: _controller,
///     interval: Interval(0.75, 1, curve: curve),
///   );
/// ```
class IntervalAnimation extends CurvedAnimation {
  IntervalAnimation({
    required super.parent,
    required double begin,
    required double end,
    Curve curve = Curves.linear,
  }) : super(curve: Interval(begin, end, curve: curve));

  IntervalAnimation.fromInterval({
    required super.parent,
    required Interval interval,
  }) : super(curve: interval);
}
