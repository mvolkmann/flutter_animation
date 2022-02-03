import 'package:flutter/material.dart';

class LowLevelAnimation extends StatefulWidget {
  const LowLevelAnimation({Key? key}) : super(key: key);

  @override
  _LowLevelAnimationState createState() => _LowLevelAnimationState();
}

class _LowLevelAnimationState extends State<LowLevelAnimation>
    with SingleTickerProviderStateMixin<LowLevelAnimation> {
  late AnimationController _controller;
  int number = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    _controller.addListener(_update);
    _controller.forward(); // starts animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _update() {
    setState(() {
      // _controller.value is a number between 0 and 1.
      number = (_controller.value * 100).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('$number');
  }
}
