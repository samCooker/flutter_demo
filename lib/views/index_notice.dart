import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NoticePage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return new NoticePageState();
  }
  
}

class NoticePageState extends State<NoticePage> with AutomaticKeepAliveClientMixin{

  List<Widget> items = [];
  RefreshController _refreshController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _init();
    _refreshController  = RefreshController();
    super.initState();
  }

  void _init() {
    for (int i = 0; i < 14; i++) {
      items.add(Text("这是一个公告$i"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("通知公告"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          isNestWrapped: true,
          header: ClassicHeader(
            idleIcon: Container(),
            idleText: "Load more...",
          ),
          enablePullUp: true,
          onRefresh: () {
            Future.delayed(const Duration(milliseconds: 2009))
                .then((val) {
              items = [];
              items.add(Text("11111111"));

              setState(() {
                _refreshController.refreshCompleted();
              });
            });
          },
          onLoading: (){
            Future.delayed(const Duration(milliseconds: 2009))
                .then((val) {
              setState(() {
                items.add(Text("11111111"));
                items.add(Text("11111111"));
                items.add(Text("11111111"));
                items.add(Text("11111111"));
                items.add(Text("11111111"));
                _refreshController.loadComplete();
              });
            });
          },
          child: ListView.builder(
            itemExtent: 100.0,
            itemCount: items.length,
            itemBuilder: (context, index) => items[index],
          )),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

}
