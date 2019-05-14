
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../routers/application.dart';
import '../../components/search_input.dart';
import 'my_menu_bloc.dart';
import 'package:flutter_app/model/model_menu.dart';
import '../../utils/themes_bloc.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  final List<Image> homeImgs = <Image>[
    Image.asset(
      "assets/images/home-3.jpg",
      fit: BoxFit.fill,
    ),
    Image.asset(
      "assets/images/home-4.jpg",
      fit: BoxFit.fill,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themesBloc = ThemeBlocProvider.of(context);
    super.build(context);
    return new Scaffold(
      //标题栏
      appBar: new AppBar(
          elevation:0.1,
          backgroundColor:Theme.of(context).primaryColor,
          title: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text(
                  "超创信息",
                  style: Theme.of(context).textTheme.headline,
                ),
              )
            ],
          ),
          centerTitle: false
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 180,
            padding: EdgeInsets.all(10),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: homeImgs[index],
                );
              },
              itemCount: 2,
              pagination: SwiperPagination(),
              autoplay: true,
              autoplayDelay: 8000,
              scale: 0.1,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "我常用的",
                      style: Theme.of(context).textTheme.display1,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
//todo 测试修改主题
                            themesBloc.setThemeData(new CustomTheme(
                              primaryColor: Colors.redAccent,
                              iconColor: Colors.redAccent,
                              backgroundColor: Colors.amberAccent,
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "编 辑",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                MyMenuProvider(
                  child: MyMenuItem(),
                )
              ],
            ),
          ),
          AllMenuItem()
        ],
      ),
    );
  }

}

class MyMenuItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final MyMenuBloc myMenuBloc = MyMenuProvider.of(context);
    //获取菜单
    // todo 测试使用
    new Timer(Duration(seconds: 4),(){
        Application.myMenuList = [];
        Application.myMenuList.add(MenuData('阿斯顿发的阿道夫', '22'));
        Application.myMenuList.add(MenuData('阿斯顿发的阿道夫', '22'));
        Application.myMenuList.add(MenuData('阿斯顿发的阿道夫', '22'));
        myMenuBloc.saveMenuData(Application.myMenuList);
    });
    return StreamBuilder<Map>(
      stream: myMenuBloc.items,
      initialData: {'isLoading':true,'data':[]},
      builder: (context, snapshot) {
        if(snapshot.data['isLoading']){
          return Container(
            alignment: Alignment.center,
            height: 40,
            child: SpinKitWave(
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          );
        }
        List<MenuData> _menuList = snapshot.data['data'];
        return MenuRow(menuList:_menuList);
      },
    );
  }

  Widget getMenuWidget(MenuData item,BuildContext context,int i){
    return Expanded(
      flex: i,
      child: Container(
        width: 74,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              width: 50,
              alignment: Alignment.center,
              child: FlatButton(
                padding: EdgeInsets.only(top: 6, bottom: 10),
                onPressed: () {
                  print(item.url);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                ),
                color: item.color ?? Theme.of(context).buttonColor,
                child: Icon(
                  IconData(item.iconHex, fontFamily: 'iconfont'),
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                item.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.display2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuRow extends StatelessWidget{

  final List<MenuData> menuList;

  MenuRow({this.menuList});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    //每行最多显示4个
    int maxCount = 4;
    for(var i=0;i<menuList.length;i=i+maxCount){
      List<Widget> expandedList = [];
      if(i+maxCount-1<menuList.length){
        for(var j=0;j<maxCount;j++){
          expandedList.add(getMenuWidget(menuList[i+j],context,1));
        }
      }else{
        int left = menuList.length%maxCount;
        for(var j=0;j<left;j++) {
          expandedList.add(getMenuWidget(menuList[j], context, 1));
        }
        expandedList.add(Expanded(child: Container(),flex: maxCount-left,));
      }
      widgetList.add(
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              children: expandedList,
            ),
          )
      );
    }
    return Column(
      children: widgetList,
    );
  }

  Widget getMenuWidget(MenuData item,BuildContext context,int i){
    return Expanded(
      flex: i,
      child: Container(
        width: 74,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              width: 50,
              alignment: Alignment.center,
              child: FlatButton(
                padding: EdgeInsets.only(top: 6, bottom: 10),
                onPressed: () {
                  print(item.url);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                ),
                color: item.color ?? Theme.of(context).buttonColor,
                child: Icon(
                  IconData(item.iconHex, fontFamily: 'iconfont'),
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                item.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.display2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AllMenuItem extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return AllMenuItemState();
  }
}

class AllMenuItemState extends State<AllMenuItem>{

  bool isLoading = false;

  @override
  void initState() {
    print("AllMenuItemState");
    super.initState();
    if(Application.allMenuData==null) {
      isLoading = true;
      // todo 获取数据
      new Timer(Duration(seconds: 5), () {
        Application.allMenuData = {
          '公文处理': [
            new MenuData('待办公文', '111'),
            new MenuData('经办公文', '111'),
            new MenuData('待阅公文', '111'),
            new MenuData('公文监控', '111'),
          ]
        };
        isLoading = false;
        print("获取数据");
        setState(() {

        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if(isLoading){
      widget = Container(
        alignment: Alignment.center,
        height: 40,
        child: SpinKitWave(
          color: Theme.of(context).primaryColor,
          size: 20,
        ),
      );
    }else{
      List<Widget> _widgetList = [];
      Application.allMenuData.forEach((key,value){
        _widgetList.add(Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  key,
                  style: Theme.of(context).textTheme.display1,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "收 起",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            MenuRow(menuList: value)
          ],
        ));
      });
      widget = Column(
        children: _widgetList,
      );
    }
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget,
    );
  }

}
