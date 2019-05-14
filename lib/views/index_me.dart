import 'package:flutter/material.dart';

class MePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Card(
            elevation: 0,
            margin: EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 120,
              child: Row(
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
                          child: Text("用户李三",style: Theme.of(context).textTheme.title),
                        ),
                        Text("部门部门",style: Theme.of(context).textTheme.subtitle),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            child: MeItemMenu(bgColor: Colors.blueAccent,icon: 0xe75d,name: '个人词条',),
          ),
          InkWell(
            child: MeItemMenu(bgColor: Colors.indigoAccent,icon: 0xe69b,name: '修改密码',)
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

  MeItemMenu({this.bgColor,this.icon,this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6,bottom: 6,left: 12,right: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: Theme.of(context).dividerColor),
              bottom: BorderSide(color: Theme.of(context).dividerColor)
          )
      ),
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
                child: Text(name,maxLines: 1,overflow: TextOverflow.ellipsis,),
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