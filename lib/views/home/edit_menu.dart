import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_menu.dart';
import 'package:flutter_app/routers/application.dart';
import '../../components/draggable_gridview.dart';

class EditMenuPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('菜单编辑'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:Container(
        child: DraggableMenu(),
      ),
    );
  }

}

class DraggableMenu extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Application.myMenuList = [];
    Application.myMenuList.add(MenuData('1', '22'));
    Application.myMenuList.add(MenuData('2', '22'));
    Application.myMenuList.add(MenuData('3', '22'));
    Application.myMenuList.add(MenuData('4', '22'));
    Application.myMenuList.add(MenuData('5', '22'));
    Application.myMenuList.add(MenuData('6', '22'));
    Application.myMenuList.add(MenuData('7', '22'));
    Application.myMenuList.add(MenuData('8', '22'));
    Application.myMenuList.add(MenuData('9', '22'));
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          child: SortableGridView(
            Application.myMenuList,
            childAspectRatio: 1.0, //宽高比
            crossAxisCount: 4, //3列
            scrollDirection: Axis.vertical, //竖向滑动
            canAccept: (oldIndex, newIndex) {
              return true;
            },
            itemBuilder: (context, data) {
              MenuData item = data;
              return Column(
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
              );
            },
          ),
        ),
        Text('1111')
      ],
    );
  }
}