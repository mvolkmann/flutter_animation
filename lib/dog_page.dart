import 'package:flutter/material.dart';
import 'package:flutter_animation/extensions/widget_extensions.dart';

import './dog.dart';
import './like_button.dart';

class DogPage extends StatelessWidget {
  static const route = 'dog';

  final Dog dog;

  const DogPage({required this.dog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final description = breedDescriptions[dog.breed] ?? 'none';
    const imageSize = 200.0;
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
      body: Column(
        children: [
          image,
          LikeButton(
            like: dog.like,
            onToggle: () {
              /* TODO: Need a better state management approach.
                  setState(() {
                    dog.like = !dog.like;
                  });
                  */
              dog.like = !dog.like;
            },
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
    );
  }
}
