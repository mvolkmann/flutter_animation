import 'package:flutter/material.dart';
import 'package:flutter_animation/extensions/widget_extensions.dart';

import './dog.dart';
import './dog_page.dart';
//import './fade_in.dart';
import './fade_in_low.dart';
//import './high_level_animation.dart';
import './image_cycle.dart';
import './like_button.dart';
//import './low_level_animation.dart';

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
  final _dogs = initialDogs;
  final _fileNames = initialDogs.map((dog) => dog.photoFileName).toList();
  final _listKey = GlobalKey<AnimatedListState>();
  final _tiles = <Widget>[];

  // Create a Tween that starts with x at widget width (1 = full offset)
  // and ends with x at beginning of widget width (0 = no offset).
  // The y value will always be at the top of the widget (0 = no offset).
  final Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  void initState() {
    super.initState();

    // The callback function here is called
    // AFTER the first time the build method runs.
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      var delay = const Duration(milliseconds: 200);
      for (var i = 0; i < _dogs.length; i++) {
        await Future.delayed(delay, () {
          _tiles.add(_buildTile(_dogs[i]));
          _listKey.currentState!.insertItem(i);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dogs'),
      ),
      body: Column(
        //TODO: Can you make the list reorderable by dragging?
        children: [
          // With this, tiles start in their final position.
          //_buildListView(),

          // With this, tiles slide in from the right.
          // https://www.youtube.com/watch?v=i9g2kSuWutk&list=PL4cUxeGkcC9gP1qg8yj-Jokef29VRCLt1&index=9
          _buildAnimatedList(),

          //LowLevelAnimation(),
          //HighLevelAnimation(),
          FadeIn(
            child: Text(
              'Do you see me?',
              style: TextStyle(fontSize: 30),
            ),
            duration: Duration(seconds: 3),
            onComplete: () {
              print('FadeIn completed');
            },
          ),
          ImageCycle(fileNames: _fileNames),
        ],
      ),
    );
  }

  Widget _buildAnimatedList() {
    return AnimatedList(
      initialItemCount: _tiles.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          child: _tiles[index],
          position: animation.drive(_offset),
        );
      },
      key: _listKey,
    ).expanded;
  }

  Widget _buildListView() {
    return ListView.separated(
      itemCount: _dogs.length,
      itemBuilder: (context, index) => _tiles[index],
      separatorBuilder: (_, index) => Divider(
        color: Colors.black45,
        height: 1,
      ),
    ).expanded;
  }

  Widget _buildTile(Dog dog) {
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
          setState(() {
            dog.like = !dog.like;
          });
        },
      ),
    );
  }
}
