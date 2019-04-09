import 'package:flutter/material.dart';

class MePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new MePageState();
  }

}

class MePageState extends State<MePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我的"),
        backgroundColor: Colors.blueAccent,
      ),
      body: new Center(
        child: new Text("这是我的页面"),
      ),
    );
  }

}