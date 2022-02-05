import 'package:flutter/material.dart';

import './dog_page.dart';
import './dogs_state.dart' show DogState;
import './like_button.dart';

class DogTile extends StatelessWidget {
  final DogState dog;

  DogTile({required this.dog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var key = ObjectKey(dog);

    const thumbnailSize = 50.0;
    var thumbnail = Hero(
      tag: key,
      child: SizedBox(
        child: Image.asset('assets/images/${dog.photoFileName}'),
        height: thumbnailSize,
        width: thumbnailSize,
      ),
    );

    return ListTile(
      key: key,
      leading: thumbnail,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DogPage(dog: dog),
          ),
        );
      },
      subtitle: Text(dog.breed),
      textColor: Colors.black, // text color
      title: Text(dog.name, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: LikeButton(
        like: dog.like,
        onToggle: () {
          dog.toggleLike();
        },
      ),
    );
  }
}
