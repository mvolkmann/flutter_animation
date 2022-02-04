import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool like;
  final VoidCallback onToggle;

  const LikeButton({
    required this.like,
    required this.onToggle,
    Key? key,
  }) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    var icon = widget.like ? Icons.favorite : Icons.favorite_outline;
    return IconButton(
      icon: Icon(icon, color: Colors.red, size: 20),
      onPressed: widget.onToggle,
    );
  }
}
