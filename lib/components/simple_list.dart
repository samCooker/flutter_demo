import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class SimpleList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SimpleListState();
  }

}

class SimpleListState extends State<SimpleList> {

  var data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context,int index){
          return new Card(
            child: new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(data[index]['title'])
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(data[index]['time'])
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(data[index]['content'])
                    ],
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  void getData() async{
    var url = 'http://47.106.201.33:23333/data.json';
    HttpClient client = new HttpClient();
    var request = await client.getUrl(Uri.parse(url));
    var response = await request.close();
    var result = [];
    if(response.statusCode == HttpStatus.ok){
      var jsonData = await response.transform(utf8.decoder).join();
      result = jsonDecode(jsonData);
    }else{
      //error
    }

    if(!mounted){
      return;
    }

    setState(() {
      data = result;
    });
  }
}