// THIS IS NOT CURRENTLY USED!
import 'package:flutter/material.dart';
import './dog.dart';

class DogWidget extends StatefulWidget {
  final Dog dog;

  const DogWidget({required this.dog, Key? key}) : super(key: key);

  @override
  _DogWidgetState createState() => _DogWidgetState();
}

class _DogWidgetState extends State<DogWidget> {
  @override
  Widget build(BuildContext context) {
    var dog = widget.dog;
    return Column(
      children: [
        Text(dog.name),
        Text(dog.breed),
        SizedBox(
          child: Image.asset('assets/images/${dog.photoFileName}'),
          height: 200,
          width: 200,
        ),
      ],
    );
  }
}
