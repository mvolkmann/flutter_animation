import 'package:flutter/material.dart';

// For other versions of this widget, see
// fade_in_stateful.dart and fail_in_low.dart.
class FadeIn extends StatelessWidget {
  static const defaultDuration = Duration(seconds: 1);

  final Widget child;
  final Duration duration;
  final VoidCallback? onComplete;

  FadeIn({
    required this.child,
    this.duration = defaultDuration,
    this.onComplete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: child,
      duration: duration,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (_, double value, Widget? child) =>
          Opacity(child: child, opacity: value),
      onEnd: onComplete,
    );
  }
}
