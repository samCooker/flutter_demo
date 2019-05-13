import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../utils/shared_preferences.dart';
import '../model/model_menu.dart';

class Application {
  static Router router;
  static SpUtil sharePreferences;

  ///我的菜单
  static List<MenuData> myMenuList;
  ///全部的菜单
  static Map<String,List<MenuData>> allMenuData;
}
