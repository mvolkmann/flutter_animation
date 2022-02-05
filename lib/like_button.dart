import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool like;
  final VoidCallback onToggle;

  LikeButton({
    required this.like,
    required this.onToggle,
    Key? key,
  }) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  late bool _like;

  late Animation<double> _sizeAnimation;
  late AnimationController _controller;
  static const startSize = 20.0;
  static const endSize = 30.0;

  @override
  void initState() {
    super.initState();

    _like = widget.like;

    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: startSize, end: endSize),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: endSize, end: startSize),
        weight: 1, // same as first
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var icon = _like ? Icons.favorite : Icons.favorite_outline;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => IconButton(
        icon: Icon(icon, color: Colors.red, size: _sizeAnimation.value),
        onPressed: () {
          setState(() {
            _like = !_like;

            // Animate the size of the heart icon up and back down
            if (_controller.status == AnimationStatus.dismissed) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          });

          widget.onToggle(); // informs parent of change
        },
      ),
    );
  }
}
