import 'package:flutter/material.dart';

import './dog_page.dart';
import './dogs_state.dart' show DogState;
import './like_button.dart';

class DogTile extends StatefulWidget {
  final DogState dog;

  DogTile({required this.dog, Key? key}) : super(key: key);

  @override
  State<DogTile> createState() => _DogTileState();
}

class _DogTileState extends State<DogTile> {
  @override
  Widget build(BuildContext context) {
    var dog = widget.dog;
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

    print('dog_tile.dart build: dog.like = ${dog.like}');
    return ListTile(
      key: key,
      leading: thumbnail,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DogPage(dog: dog),
          ),
        ).then((value) {
          // This is called when navigation returns to this page.
          // value will be null.
          print('dog_tile.dart x: dog.like = ${dog.like}');
          //TODO: Is the next line really needed?
          setState(() {}); // forces rebuild
        });
      },
      subtitle: Text(dog.breed),
      textColor: Colors.black, // text color
      title: Text(
        widget.dog.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: LikeButton(
        like: dog.like,
        key: ObjectKey(dog), //TODO: Does this help anything?
        onToggle: () => dog.toggleLike(),
      ),
    );
  }
}
