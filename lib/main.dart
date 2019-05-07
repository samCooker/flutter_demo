import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'utils/provider.dart';
import 'utils/shared_preferences.dart';
import 'views/index.dart';
import 'routers/app_routes.dart';
import 'routers/application.dart';

const int ThemeColor = 0xFFC91B3A;
SpUtil sp;
var db;

class MyApp extends StatelessWidget {

  MyApp()  {
    final router = new Router();
    AppRoutes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.blueAccent,
        buttonColor: Colors.blueAccent,
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          headline: TextStyle(color: Color(0xDD4E4E4E), fontSize: 20.0,fontWeight: FontWeight.bold),
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xDD4E4E4E), fontSize: 18.0),
          //加粗的字体，（首页菜单标题样式）
          display1: TextStyle(color: Color(0xDD4E4E4E),fontSize: 16,fontWeight: FontWeight.bold),
          //(首页菜单项样式)
          display2: TextStyle(color: Color(0xDD4E4E4E),fontSize: 14,fontWeight: FontWeight.bold),
          button: TextStyle(color: Colors.blueAccent,fontSize: 14.0,)
        ),
        iconTheme: IconThemeData(
          color: Color(ThemeColor),
          size: 35.0,
        ),
      ),
      home: MyHomePage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}

void main() async{
  final provider = new Provider();
  await provider.init(true);
  db = Provider.db;
  sp = await SpUtil.getInstance();
  runApp(MyApp());
}


