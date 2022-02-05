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
  late Animation<Color?> _colorAnimation;
  late Animation<double> _opacityAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this, // a TickerProvider`
    );

    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);

    TickerFuture future = _controller.forward(); // start the animation
    if (widget.onComplete != null) future.whenComplete(widget.onComplete!);
  }

  @override
  dispose() {
    _controller.dispose();
    // Animations do not have a dispose method.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*
    // To only animate opacity ...
    return FadeTransition(
      opacity: _opacityAnimation
      child: widget.child,
    );
    */

    // To animate both opacity and color ...
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        var color = _colorAnimation.value;
        var opacity = _opacityAnimation.value;
        return DefaultTextStyle(
          child: widget.child,
          style: TextStyle(color: color!.withOpacity(opacity)),
        );
      },
    );
  }
}
