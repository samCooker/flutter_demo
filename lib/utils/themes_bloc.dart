
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTheme{
  Color primaryColor = Colors.blueAccent;
  Color iconColor = Colors.blueAccent;
  Color backgroundColor = Color(0xFFEFEFEF);

  int commonSize = 18;
  int titleSize = 22;
  int subTitleSize = 20;

  CustomTheme({this.primaryColor,this.iconColor,this.backgroundColor,this.commonSize,this.titleSize,this.subTitleSize});

}

class ThemesBloc {

    CustomTheme currentTheme;

  StreamController<CustomTheme> _controller;

  ThemesBloc(){
    _controller = StreamController<CustomTheme>();
  }

  Stream<CustomTheme> get items => _controller.stream;

  setThemeData(CustomTheme themeData){
    currentTheme=themeData;
    _controller.sink.add(themeData);
  }

  dispose(){
    _controller.close();
  }

}

class ThemeBlocProvider extends InheritedWidget{

  final ThemesBloc themesBloc;

  ThemeBlocProvider({Key key,ThemesBloc themesBloc,Widget child}):themesBloc = themesBloc??ThemesBloc(),super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static ThemesBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(ThemeBlocProvider) as ThemeBlocProvider).themesBloc;

}