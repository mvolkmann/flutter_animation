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

class _LikeButtonState extends State<LikeButton> {
  late bool like;

  @override
  void initState() {
    like = widget.like;
    print('like_button.dart initState: like = $like');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('like_button.dart build: like = $like');
    print('like_button.dart build: widget.like = ${widget.like}');
    var icon = like ? Icons.favorite : Icons.favorite_outline;
    return IconButton(
      icon: Icon(icon, color: Colors.red, size: 20),
      onPressed: () {
        setState(() => like = !like);
        widget.onToggle(); // informs parent of change
      },
    );
  }
}
