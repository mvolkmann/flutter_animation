import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
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
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  dispose() {
    _controller.dispose();
    // _animation does not have a dispose method.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var transition = FadeTransition(
      opacity: _animation,
      child: widget.child,
    );

    // Start the animation.
    var future = _controller.forward();

    if (widget.onComplete != null) future.whenComplete(widget.onComplete!);

    return transition;
  }
}
