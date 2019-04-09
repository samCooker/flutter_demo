import 'package:flutter/material.dart';

import 'utils/provider.dart';
import 'utils/shared_preferences.dart';

import 'views/index_home.dart';
import 'views/index_me.dart';
import 'views/index_notice.dart';

const int ThemeColor = 0xFFC91B3A;
SpUtil sp;
var db;

void main() async{
  final provider = new Provider();
  await provider.init(true);
  db = Provider.db;
  sp = await SpUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primaryColor: Color(ThemeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 18.0),
        ),
        iconTheme: IconThemeData(
          color: Color(ThemeColor),
          size: 35.0,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  TabController tabController;

  static double iconSize = 30;
  static double fontSize = 12;

  final List<Tab> menuTab = <Tab>[
    new Tab(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(IconData(0xe679,fontFamily: 'iconfont'), size: iconSize,),
        Text("首页",style: TextStyle(fontSize: fontSize),)
      ],
    )),
    new Tab(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(IconData(0xe63b,fontFamily: 'iconfont'), size: iconSize,),
        Text("公告",style: TextStyle(fontSize: fontSize),),
      ],
    )),
    new Tab(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(IconData(0xe6d7,fontFamily: 'iconfont'), size: iconSize,),
        Text("通讯录",style: TextStyle(fontSize: fontSize),),
      ],
    )),
    new Tab(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(IconData(0xe601,fontFamily: 'iconfont'), size: iconSize,),
        Text("我的",style: TextStyle(fontSize: fontSize),),
      ],
    ))
  ];

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: menuTab.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
          controller: tabController,
          children: <Widget>[
            new HomePage(),
            new NoticePage(),
            new MePage()
          ]
      ),
      bottomNavigationBar: new Material(
        color: const Color(0xFFF0EEEF),
        child: SafeArea(
            child: Container(
              height: 66,
              decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: const Color(0xFFF0F0FF),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      offset: Offset(-1.0, -1.0),
                    )
                  ]
              ),
              child: TabBar(
                controller: tabController,
                indicatorWeight: 0.1,
                indicatorColor: Colors.blueAccent,
                labelColor: Colors.blueAccent,
                labelStyle: TextStyle(
                    fontSize: 14
                ),
                unselectedLabelColor: const Color(0xFF8E8E8E),
                tabs: menuTab,
              ),
            )
        ),
      ),
    );
  }
}
