import 'package:flutter/material.dart';

import './dogs_state.dart' show breedDescriptions, DogState;
import './like_button.dart';
import './extensions/widget_extensions.dart';

class DogPage extends StatelessWidget {
  static const route = 'dog';

  final DogState dog;

  const DogPage({required this.dog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final description = breedDescriptions[dog.breed] ?? 'none';
    const imageSize = 300.0;
    final image = Hero(
      tag: ObjectKey(dog),
      child: SizedBox(
        child: Image.asset('assets/images/${dog.photoFileName}'),
        height: imageSize,
        width: imageSize,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            image,
            LikeButton(
              like: dog.like,
              onToggle: () => dog.toggleLike(),
            ),
            SizedBox(height: 20),
            Text(dog.breed,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 20),
            Text(description),
          ],
        ).padding(20),
      ),
    );
  }
}
