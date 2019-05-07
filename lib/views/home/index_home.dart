import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../components/search_input.dart';
import '../../routers/application.dart';

import 'my_menu_bloc.dart';
import 'package:flutter_app/model/model_menu.dart';

class HomePage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return new Scaffold(
      //标题栏
      appBar: new AppBar(
        elevation:0.1,
        backgroundColor:Colors.white,
        title: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text(
                "超创信息",
                style: Theme.of(context).textTheme.headline,
              ),
            ),
//            Expanded(
//              child: SearchInput(
//                  placeholder: "搜索功能",
//                  onTap: () {
//                    print("功能搜索");
//                    Application.router.navigateTo(context, "search");
//                  }),
//            )
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
            child: MyMenuProvider(
              child: MyMenuItem(),
            ),
          )
        ],
      ),
    );
  }
}

class MyMenuItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyMenuBloc myMenuBloc = MyMenuProvider.of(context);
    return Column(
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
                    myMenuBloc.saveMenuData(Application.menuList);
                    Application.menuList.add(MenuData('阿斯顿发的阿道夫', '22'));
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
        StreamBuilder<List<MenuData>>(
          stream: myMenuBloc.items,
          initialData: [],
          builder: (context, snapshot) {
            return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: snapshot.data.map((item) {
                  return Container(
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
                  );
                }).toList());
          },
        ),
      ],
    );
  }
}

class AllMenuItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("11111111");
  }
}
