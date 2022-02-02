import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import './dog.dart';
import './dog_page.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dogs'),
      ),
      body: Center(
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

    return ListTile(
      iconColor: Colors.red,
      key: ObjectKey(dog),
      leading: thumbnail,
      onTap: () {
        print('got tap on ${dog.name}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DogPage(dog: dog),
          ),
        );
      },
      //selected: selected,
      subtitle: Text(dog.breed),
      textColor: Colors.black, // text color
      title: Text(dog.name, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: Icon(CupertinoIcons.heart),
      //selectedColor: Colors.green, // text and icon color
      //selectedTileColor: selectedTileColor,
      //tileColor: tileColor,
    );
  }
}
