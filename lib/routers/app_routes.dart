
import 'package:fluro/fluro.dart';
import 'app_routes_handler.dart';


class AppRoutes {

  static void configureRoutes(Router router){
    //首页
    router.define("/", handler: homeHandler);
    router.define("/search", handler: searchHandler);

    //菜单编辑
    router.define("/edit-menu", handler: editMenuHandler);
  }

}

