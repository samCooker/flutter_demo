
import 'dart:async';
import 'package:flutter/widgets.dart';

import 'package:flutter_app/model/model_menu.dart';

class MyMenuBloc {

  Map _myMenuData;

  StreamController<Map> _controller;

  MyMenuBloc(){
    _controller = StreamController<Map>();
  }

  Stream<Map> get items => _controller.stream;

  saveMenuData(List<MenuData> data){
    _myMenuData = new Map();
    _myMenuData['data'] = data;
    _myMenuData['isLoading'] = false;
    _controller.sink.add(_myMenuData);
  }

  dispose(){
    print('MyMenuBloc dispose');
    _controller.close();
  }

}

class MyMenuProvider extends InheritedWidget{

  final MyMenuBloc myMenuBloc;

  MyMenuProvider({Key key, Widget child,MyMenuBloc myMenuBloc}) : myMenuBloc = myMenuBloc ?? MyMenuBloc(), super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static MyMenuBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MyMenuProvider) as MyMenuProvider).myMenuBloc;

}
