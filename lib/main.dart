import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import './dog.dart';
import './dog_widget.dart';

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
  var dogs = <Dog>[
    Dog(
      name: 'Maisey',
      breed: 'Treeing Walker Coonhound',
      photoFileName: 'treeing-walker-coonhound.jpg',
    ),
    Dog(
      name: 'Ramsay',
      breed: 'Native American Indian Dog',
      photoFileName: 'native-american-indian-dog.jpg',
    ),
    Dog(
      name: 'Oscar',
      breed: 'German Shorthaired Pointer',
      photoFileName: 'german-shorthaired-pointer.jpg',
    ),
    Dog(
      name: 'Comet',
      breed: 'Whippet',
      photoFileName: 'whippet.jpg',
    ),
  ];

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

    var thumbnail = SizedBox(
      child: Image.asset('assets/images/${dog.photoFileName}'),
      height: 50,
      width: 50,
    );

    return ListTile(
      iconColor: Colors.red,
      key: ObjectKey(dog),
      leading: thumbnail,
      onTap: () {
        print('got tap on ${dog.name}');
        /*
        setState(() {
          item.selected = !item.selected;
        });
        */
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
