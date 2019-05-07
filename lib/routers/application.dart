import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../utils/shared_preferences.dart';
import '../model/model_menu.dart';

class Application {
  static Router router;
  static SpUtil sharePreferences;
  static List<MenuData> menuList;
}
