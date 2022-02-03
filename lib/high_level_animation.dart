import 'package:flutter/material.dart';

class HighLevelAnimation extends StatelessWidget {
  const HighLevelAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: 100),
      duration: const Duration(seconds: 5),
      builder: (BuildContext context, int number, Widget? child) {
        return Text('$number');
      },
    );
  }
}
