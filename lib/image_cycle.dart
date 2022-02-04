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
            key: ValueKey(fileName),
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
      ),
      ElevatedButton(
        child: Text('Next Image'),
        onPressed: () {
          setState(() {
            index = (index + 1) % widget.fileNames.length;
          });
        },
      )
    ]);
  }
}
