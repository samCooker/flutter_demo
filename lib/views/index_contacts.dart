import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ContactsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new ContactsPageState();
  }
  
}

class ContactsPageState extends State<ContactsPage> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("通讯录"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Text("通讯录"),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

}
