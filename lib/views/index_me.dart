import 'package:flutter/material.dart';
import 'package:flutter_app/utils/themes_bloc.dart';

class MePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themesBloc = ThemeBlocProvider.of(context);
    return Material(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
//              image: DecorationImage(
//                image: AssetImage("assets/images/home-4.jpg"),
//                fit: BoxFit.cover
//              )
            ),
            padding: EdgeInsets.only(left: 20),
            height: 160,
            child: Stack(
              alignment:Alignment.center,
              children: <Widget>[
                Positioned(
                  right: 26,
                  top:30,
                  child: IconButton(
                      icon: Icon(IconData(0xe66f, fontFamily: 'iconfont')),
                      iconSize: 30,
                      onPressed: (){
                        print("主题设置");
                        //todo 测试修改主题
                        themesBloc.setThemeData(new CustomTheme(
                          primaryColor: Colors.redAccent,
                          iconColor: Colors.redAccent,
                          backgroundColor: Colors.amberAccent,
                        ));

                      },
                      color: Color(0xFFFFFFFF)
                  ),
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius:46,
                      backgroundImage: AssetImage("assets/images/home-3.jpg"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:EdgeInsets.only(bottom: 14),
                            child: Text("用户李三",style: Theme.of(context).textTheme.headline),
                          ),
                          Text("部门部门",style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0)),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)))
                ),
                InkWell(
                  onTap: (){
                    print("expand");
                  },
                  child: MeItemMenu(bgColor: Colors.blueAccent, icon: 0xe75d, name: '个人词条'),
                ),
                Container(
                    margin: EdgeInsets.only(left: 70),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)))
                ),
                InkWell(
                    child: MeItemMenu(bgColor: Colors.deepPurpleAccent, icon: 0xe69b, name: '修改密码')
                ),
                Container(
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Theme.of(context).dividerColor),
                            bottom: BorderSide(color: Theme.of(context).dividerColor)
                        )
                    )
                ),
                InkWell(
                    child: MeItemMenu(bgColor: Colors.greenAccent, icon: 0xe699, name: '关于系统',)
                ),
                Container(
                    margin: EdgeInsets.only(left: 70),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)))
                ),
                InkWell(
                    child: MeItemMenu(bgColor: Colors.redAccent, icon: 0xe6c2, name: '下载缓存',other: Text("0 M",style: Theme.of(context).textTheme.subtitle,),)
                ),
                Container(
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Theme.of(context).dividerColor),
                            bottom: BorderSide(color: Theme.of(context).dividerColor)
                        )
                    )
                ),
                InkWell(
                    child: MeItemMenu(bgColor: Colors.orangeAccent, icon: 0xe69a, name: '重新登录',)
                ),
                Container(
                    margin: EdgeInsets.only(left: 70),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)))
                ),
                InkWell(
                    child: MeItemMenu(bgColor: Colors.blueAccent, icon: 0xe643, name: '退出登录',)
                ),
                Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)))
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}

class MeItemMenu extends StatelessWidget{

  final Color bgColor;
  final int icon;
  final String name;
  final Widget other;

  MeItemMenu({this.bgColor,this.icon,this.name,this.other});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6,bottom: 6,left: 12,right: 12),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                    color: bgColor??Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                width: 42,
                height: 42,
                child: Icon(
                  IconData(icon, fontFamily: 'iconfont'),
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Text(name,maxLines: 1,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.title,),
              ),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                child: other,
              ),
              Icon(
                IconData(0xe603, fontFamily: 'iconfont'),
                size: 20,
                color: Theme.of(context).cursorColor,
              )
            ],
          )
        ],
      ),
    );
  }

}