import 'package:flutter/material.dart';

import 'custom_scroll_view_and_sliver_route.dart';
import 'nested_scroll_view_route.dart';
import 'tab_bar_view_route.dart';
import 'animated_list_route.dart';
import 'grid_view_route.dart';
import 'list_view_route.dart';
import 'page_view_route.dart';
import 'scroll_controller_route.dart';
import 'single_child_scroll_view_route.dart';

class ScrollableWidgetRoute extends StatelessWidget {
  const ScrollableWidgetRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("LayoutWidgetRoute"),),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const SingleChildScrollViewRoute();
                  }));
                }, child: const Text('SingleChildScrollViewRoute'),
              ),TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const ListViewRoute();
                  }));
                }, child: const Text('ListViewRoute'),
              ),TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const ScrollControllerRoute();
                  }));
                }, child: const Text('ScrollControllerRoute'),
              ),TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const AnimatedListRoute();
                  }));
                }, child: const Text('AnimatedListRoute'),
              ),TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const GridViewRoute();
                  }));
                }, child: const Text('GridViewRoute'),
              ),TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const PageViewRoute();
                  }));
                }, child: const Text('PageViewRoute'),
              ),TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const TabViewRoute2();
                  }));
                }, child: const Text('TabBarViewRoute'),
              ),TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const CustomScrollViewAndSliverRoute();
                  }));
                }, child: const Text('CustomScrollViewAndSliverRoute'),
              ),TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const NestedScrollViewRoute();
                  }));
                }, child: const Text('NestedScrollViewRoute'),
              ),
            ],
          ),
        )
    );
  }

}