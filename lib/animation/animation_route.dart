import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'implicit_animated_container_route.dart';

class AnimationRoute extends StatelessWidget {
  const AnimationRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("LayoutWidgetRoute"),
        ),
        body: Center(
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const ImplicitAnimatedContainerRoute();
                      }));
                    },
                    child: const Text('TextSampleWidget')),
              ],
            )));
  }

}