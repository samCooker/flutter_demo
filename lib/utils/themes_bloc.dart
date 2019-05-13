
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemesBloc {

  ThemeData currentTheme;

  StreamController<ThemeData> _controller;

  ThemesBloc(){
    _controller = StreamController<ThemeData>();
  }

  Stream<ThemeData> get items => _controller.stream;

  setThemeData(ThemeData themeData){
    currentTheme=themeData;
    _controller.sink.add(currentTheme);
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