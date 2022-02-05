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

    const thumbnailSize = 50.0;
    var thumbnail = Hero(
      tag: ObjectKey(dog),
      child: SizedBox(
        child: Image.asset('assets/images/${dog.photoFileName}'),
        height: thumbnailSize,
        width: thumbnailSize,
      ),
    );

    return ListTile(
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
        key: GlobalKey(), //TODO: Is this the solution?
        onToggle: () => dog.toggleLike(),
      ),
    );
  }
}
