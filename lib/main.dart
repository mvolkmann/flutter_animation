import 'package:flutter/material.dart';
import './dog.dart';
import './dog_page.dart';
import './like_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dogs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var dogs = initialDogs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dogs'),
      ),
      body: Center(
        //TODO: Can you make the list reorderable by dragging?
        child: ListView.separated(
          itemCount: dogs.length,
          itemBuilder: _buildItem,
          separatorBuilder: (_, index) => Divider(
            color: Colors.black45,
            height: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    var dog = dogs[index];

    const thumbnailSize = 50.0;
    var thumbnail = SizedBox(
      child: Image.asset('assets/images/${dog.photoFileName}'),
      height: thumbnailSize,
      width: thumbnailSize,
    );

    var icon = dog.like ? Icons.favorite : Icons.favorite_outline;

    return ListTile(
      key: ObjectKey(dog),
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
          setState(() {
            dog.like = !dog.like;
          });
        },
      ),
    );
  }
}
