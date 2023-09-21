import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_painter_route.dart';
import 'explicit_animated_route.dart';
import 'explicit_animated_route2.dart';
import 'hero_animation.dart';
import 'implicit_animated_route.dart';

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
                        return const ImplicitAnimatedRoute();
                      }));
                    },
                    child: const Text('ImplicitAnimatedWidget')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const ExplicitAnimatedRoute();
                      }));
                    },
                    child: const Text('ExplicitAnimatedWidget')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const ExplicitAnimatedRoute2();
                      }));
                    },
                    child: const Text('ExplicitAnimatedWidget2')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return HeroAnimationRoute();
                      }));
                    },
                    child: const Text('HeroAnimationRoute')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CustomPainterRoute();
                      }));
                    },
                    child: const Text('CustomPainterRoute')),
              ],
            )));
  }

}