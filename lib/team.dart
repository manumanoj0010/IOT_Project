import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new CategoryPage(),
    );
  }
}

class CategoryPage extends StatefulWidget {
  @override
  CategoryPageState createState() => new CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  Color blueAppBar = new Color(0xFF26C6DA);
  List<Widget> listCategories = [];
  List listaDB = [];
  List lista2DB = [];
  List listaCategory;
  final List<Widget> children = <Widget>[];

  String randomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });
    return new String.fromCharCodes(codeUnits);
  }

  @override
  void initState() {
    this.listaDB = [
      [
        {'category': 'Ram Prasad 17BCE2189'}
      ],
      [
        {'category': 'B Manoj 17BCE0546'}
      ],
      [
        {'category': 'Rishi Boda 17BCE0250'}
      ],
      [
        {'category': 'Kowshik Sola 17BCE0421'}
      ],
    ];

    for (var i in this.listaDB) {
      var category = i[0]['category'];
      children.add(new ItemCategory(
        key: new Key(randomString(20)),
        category: category,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Team'),
        backgroundColor: blueAppBar,
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) => children[index],
        itemExtent: 128.0,
        itemCount: children.length,
      ),
    );
  }
}

class ItemCategory extends StatelessWidget {
  final String category;

  ItemCategory({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        border: new Border(
          top: new BorderSide(style: BorderStyle.solid, color: Colors.black26),
        ),
        color: new Color(0xFFFAFAFA),
      ),
      margin: new EdgeInsets.only(top: 0.0, bottom: 0.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                    margin: new EdgeInsets.only(left: 16.0),
                    padding:
                        new EdgeInsets.only(right: 40.0, top: 4.5, bottom: 4.5),
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: new EdgeInsets.only(right: 16.0),
                          child: new Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 35.0,
                          ),
                        ),
                        new Text(this.category),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
