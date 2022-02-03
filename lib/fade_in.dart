import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;

  const FadeIn({required this.child, Key? key}) : super(key: key);

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
      duration: Duration(seconds: 1),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    var transition = FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
    _controller.forward(); // starts the animation
    return transition;
  }
}
