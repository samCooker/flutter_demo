import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return new NoticePageState();
  }
  
}

class NoticePageState extends State<NoticePage> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("通知公告"),
        backgroundColor: Colors.blueAccent,
      ),
      body: new Center(
        child: new Text("这是一个公告页面"),
      ),
    );
  }
  
}