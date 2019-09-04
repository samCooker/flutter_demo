import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
//import 'package:flutter/services.dart';

import 'utils/provider.dart';
import 'utils/themes_bloc.dart';
import 'utils/shared_preferences.dart';
import 'views/index.dart';
import 'routers/app_routes.dart';
import 'routers/application.dart';

const int ThemeColor = 0xFFC91B3A;
SpUtil sp;
var db;

class MyApp extends StatelessWidget {

  MyApp()  {
    final router = new Router();
    AppRoutes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return ThemeBlocProvider(
      child: CustomThemeApp(),
    );
  }
}

///可自定义主题APP
class CustomThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemesBloc themesBloc = ThemeBlocProvider.of(context);
    return StreamBuilder<CustomTheme>(
      stream: themesBloc.items,
      initialData: new CustomTheme(),
      builder: (context,snapshot){
        return MaterialApp(
          theme: new ThemeData(
            primaryColor: snapshot.data.primaryColor,
            buttonColor: snapshot.data.primaryColor,
            accentColor: snapshot.data.primaryColor,
            backgroundColor: Color(0xFFFFFFFF),
            dividerColor:Color(0xFFF0F0F0),
            cursorColor: Color(0xFFC9C9C9),
            textTheme: TextTheme(
                title: TextStyle(color: Color(0xDD4E4E4E), fontSize: 18.0),
                subtitle: TextStyle(color: Color(0xDD4E4E4E), fontSize: 16.0),
                //首页头部标题
                headline: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20.0,fontWeight: FontWeight.bold),
                //设置Material的默认字体样式
                body1: TextStyle(color: Color(0xDD4E4E4E), fontSize: 18.0),
                //加粗的字体，（首页菜单标题样式）
                display1: TextStyle(color: Color(0xDD4E4E4E),fontSize: 16,fontWeight: FontWeight.bold),
                //(首页菜单项样式)
                display2: TextStyle(color: Color(0xDD4E4E4E),fontSize: 14,fontWeight: FontWeight.bold),
                button: TextStyle(color: snapshot.data.primaryColor,fontSize: 14.0,)
            ),
            iconTheme: IconThemeData(
              color: Colors.blueAccent,
              size: 35.0,
            ),
          ),
          home: MyHomePage(),
          onGenerateRoute: Application.router.generator,
        );
      },
    );
  }
}

void main() async{
//修改状态栏颜色
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//    systemNavigationBarColor: Colors.blueAccent,
//    statusBarColor: Colors.blueAccent,
//  ));
  final provider = new Provider();
  await provider.init(true);
  db = Provider.db;
  sp = await SpUtil.getInstance();
  runApp(MyApp());
}


