import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  createState() => MyAppState();
}

updateData(isSwitched) {
  Firestore.instance
      .collection('iot')
      .document('lightstatus')
      .updateData({'status': isSwitched});
}

class MyAppState extends State<MyApp> {
  bool isSwitched1 = true;
  bool isSwitched2 = true;
  bool isSwitched3 = true;
  bool isSwitched4 = true;

//  var databaseReference =
//      Firestore.instance.collection('iot').where('lightstatus');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Switch Check',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: new AppBar(
              elevation: 0.1,
              backgroundColor: Colors.blue,
              title: Text('Control'),
//              actions: <Widget>[
//                new IconButton(
//                    icon: Icon(Icons.search),
//                    color: Colors.white,
//                    onPressed: () {}),
//              ],
            ),
            body: new ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    new Container(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: new Text('Light-1'),
                            ),
                          ),
                          Expanded(
                            child: new MaterialButton(
                                child: Switch(
                                  value: isSwitched1,
                                  onChanged: (value) async {
                                    setState(() {
                                      isSwitched1 = value;
                                      updateData(isSwitched1);
                                      print(isSwitched1);
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                ),
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: new Text('Light-2'),
                            ),
                          ),
                          Expanded(
                            child: new MaterialButton(
                                child: Switch(
                                  value: isSwitched2,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched2 = value;
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                ),
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    new Divider(),
                    new Container(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: new Text('Fan-1'),
                            ),
                          ),
                          Expanded(
                            child: new MaterialButton(
                                child: Switch(
                                  value: isSwitched3,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched3 = value;
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                ),
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: new Text('Fan-2'),
                            ),
                          ),
                          Expanded(
                            child: new MaterialButton(
                                child: Switch(
                                  value: isSwitched4,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched4 = value;
                                    });
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                ),
                                color: Colors.red),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )));
  }
}
