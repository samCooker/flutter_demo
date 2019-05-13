import 'package:flutter/material.dart';
import 'package:flutter_app/views/home/index_home.dart';
import 'index_me.dart';
import 'index_notice.dart';
import 'index_contacts.dart';
import '../utils/themes_bloc.dart';


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
    final ThemesBloc = ThemeBlocProvider.of(context);
    return new Scaffold(
      body: new TabBarView(
          controller: tabController,
          children: <Widget>[
            new HomePage(),
            new NoticePage(),
            new ContactsPage(),
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
                onTap: (int){
                  print("点击tab页面：$int");
                  //todo 测试修改主题
                  ThemesBloc.setThemeData(new ThemeData(
                    primaryColor: Colors.redAccent,
                    buttonColor: Colors.redAccent,
                    backgroundColor: Color(0xFFEFEFEF),
                    accentColor: Color(0xFF888888),
                    textTheme: TextTheme(
                        headline: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20.0,fontWeight: FontWeight.bold),
                        //设置Material的默认字体样式
                        body1: TextStyle(color: Color(0xDD4E4E4E), fontSize: 18.0),
                        //加粗的字体，（首页菜单标题样式）
                        display1: TextStyle(color: Color(0xDD4E4E4E),fontSize: 16,fontWeight: FontWeight.bold),
                        //(首页菜单项样式)
                        display2: TextStyle(color: Color(0xDD4E4E4E),fontSize: 14,fontWeight: FontWeight.bold),
                        button: TextStyle(color: Colors.blueAccent,fontSize: 14.0,)
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.blueAccent,
                      size: 35.0,
                    ),
                  ));
                },
                unselectedLabelColor: const Color(0xFF8E8E8E),
                tabs: menuTab,
              ),
            )
        ),
      ),
    );
  }
}