import 'package:flutter/material.dart';

import '../util/keep_alive_wrapper.dart';

class TabBarViewRoute extends StatefulWidget {
  const TabBarViewRoute({super.key});

  @override
  State<StatefulWidget> createState() => TabBarViewRouteState();
}

class TabBarViewRouteState extends State<TabBarViewRoute>
    with SingleTickerProviderStateMixin {
  var tabs = ['首页', '视频', '音频'];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        title: const Text('TabBarViewRoute'),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs
            .map((e) => KeepAliveWrapper(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(e, textScaleFactor: 5,),
                  ),
                ))
            .toList(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class TabViewRoute2 extends StatelessWidget {
  const TabViewRoute2({super.key});

  @override
  Widget build(BuildContext context) {
    List tabs = ["新闻", "历史", "图片"];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TabViewRoute2"),
          bottom: TabBar(
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: TabBarView( //构建
          children: tabs.map((e) {
            return KeepAliveWrapper(
              child: Container(
                alignment: Alignment.center,
                child: Text(e, textScaleFactor: 5),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}