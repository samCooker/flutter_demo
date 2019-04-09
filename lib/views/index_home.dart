import 'package:flutter/material.dart';

import '../components/simple_list.dart';
import '../components/search_input.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }

}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("超创信息"),
            ),
            Expanded(
              child: SearchInput(placeholder: "搜索功能",),
            )
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.blueAccent,
      ),
      body: new Container(
        child: new SimpleList(),
      ),
    );
  }

}