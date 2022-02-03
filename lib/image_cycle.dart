import 'package:flutter/material.dart';

class ImageCycle extends StatefulWidget {
  final List<String> fileNames;

  const ImageCycle({required this.fileNames, Key? key}) : super(key: key);

  @override
  _ImageCycleState createState() => _ImageCycleState();
}

class _ImageCycleState extends State<ImageCycle> {
  int index = 0;
  int nextIndex = 1;

  @override
  Widget build(BuildContext context) {
    final image = _buildImage(widget.fileNames[index]);
    final nextImage = _buildImage(widget.fileNames[nextIndex]);

    return Column(children: [
      AnimatedCrossFade(
        crossFadeState: CrossFadeState.showSecond,
        duration: Duration(milliseconds: 1000),
        firstChild: image,
        secondChild: nextImage,
      ),
      ElevatedButton(
        child: Text('Next Image'),
        onPressed: () {
          setState(() {
            index = nextIndex;
            nextIndex = (index + 1) % widget.fileNames.length;
          });
        },
      )
    ]);
  }

  Widget _buildImage(String fileName) {
    const imageSize = 200.0;
    return SizedBox(
      child: Image.asset('assets/images/$fileName'),
      height: imageSize,
      width: imageSize,
    );
  }
}
