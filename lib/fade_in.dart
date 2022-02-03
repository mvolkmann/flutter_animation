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

class _FadeInState extends State<FadeIn> {
  double _opacity = 0;

  @override
  void initState() {
    // Change the opacity to 1 after this widget is rendered.
    Future(() {
      setState(() => _opacity = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      child: widget.child,
      duration: widget.duration,
      opacity: _opacity,
      onEnd: widget.onComplete,
    );
  }
}
