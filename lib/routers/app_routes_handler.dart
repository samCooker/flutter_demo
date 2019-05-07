import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../views/index.dart';
import '../components/search_input.dart';

var homeHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new MyHomePage();
});

var searchHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new MaterialSearch();
});