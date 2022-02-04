import 'package:flutter/material.dart';

class ImageCycle extends StatefulWidget {
  final List<String> fileNames;

  const ImageCycle({required this.fileNames, Key? key}) : super(key: key);

  @override
  _ImageCycleState createState() => _ImageCycleState();
}

class _ImageCycleState extends State<ImageCycle> {
  int index = 0;
  late List<Widget> images;

  @override
  void initState() {
    const imageSize = 200.0;
    images = widget.fileNames
        .map(
          (fileName) => SizedBox(
            child: Image.asset('assets/images/$fileName'),
            height: imageSize,
            key: ValueKey(fileName), // must have this!
            width: imageSize,
          ),
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AnimatedSwitcher(
        child: images[index],
        duration: Duration(seconds: 1),
        // This performs a fade transition by default.
        // For a different animation, set the transitionBuilder argument.
        transitionBuilder: (child, animation) =>
            //FadeTransition(child: child, opacity: animation),
            ScaleTransition(child: child, scale: animation),
      ),
      ElevatedButton(
        child: Text('Next'),
        onPressed: () {
          setState(() {
            index = (index + 1) % widget.fileNames.length;
          });
        },
      )
    ]);
  }
}
