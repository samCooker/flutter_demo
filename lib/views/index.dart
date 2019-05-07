import 'package:flutter/material.dart';
import 'package:flutter_app/views/home/index_home.dart';
import 'index_me.dart';
import 'index_notice.dart';


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
            new MePage(),
            new MePage(),
          ]
      ),
      bottomNavigationBar: new Material(
        color: const Color(0xFFF0EEEF),
        child: SafeArea(
            child: Container(
              height: 66,
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