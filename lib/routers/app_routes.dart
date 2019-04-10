
import 'package:fluro/fluro.dart';
import 'app_routes_handler.dart';


class AppRoutes {

  static void configureRoutes(Router router){
    //首页
    router.define("/index", handler: homeHandler);
  }

}

