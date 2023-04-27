import 'package:flutter/material.dart';

import 'animated_list_route.dart';
import 'list_view_route.dart';
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
              ),
            ],
          ),
        )
    );
  }

}