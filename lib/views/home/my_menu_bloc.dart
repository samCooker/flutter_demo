
import 'dart:async';
import 'package:flutter/widgets.dart';

import 'package:flutter_app/model/model_menu.dart';
import 'package:flutter_app/routers/application.dart';

class MyMenuBloc {

  List<MenuData> _myMenuList;

  StreamController<List<MenuData>> _controller;

  MyMenuBloc(){
    _controller = StreamController<List<MenuData>>();
    print("new MyMenuBloc");
    Application.menuList = [
      MenuData('待办待办待办','fordoList'),
      MenuData('经办经','doList'),
    ];
  }

  Stream<List<MenuData>> get items => _controller.stream;

  saveMenuData(List<MenuData> data){
    _myMenuList = data;
    _controller.sink.add(_myMenuList);
  }

  dispose(){
    print('MyMenuBloc dispose');
    _controller.close();
  }

}

class MyMenuProvider extends InheritedWidget{

  final MyMenuBloc myMenuBloc;

  MyMenuProvider({Key key, Widget child,MyMenuBloc myMenuBloc}) : myMenuBloc = MyMenuBloc(), super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static MyMenuBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MyMenuProvider) as MyMenuProvider).myMenuBloc;

}
