import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitAnimatedRoute extends StatefulWidget {
  const ExplicitAnimatedRoute({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExplicitAnimatedRouteState();
  }
}

class _ExplicitAnimatedRouteState extends State<ExplicitAnimatedRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool refreshing = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ExplicitAnimatedWidget"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                RotationTransition(
                  turns: _controller,
                  child: const Icon(
                    Icons.refresh,
                    size: 100,
                  ),
                ),
                FadeTransition(
                    opacity: _controller.drive(Tween(begin: 0.5, end: 1)),
                    child:
                        Container(width: 100, height: 100, color: Colors.red)),
                ScaleTransition(
                    scale: _controller.drive(Tween(begin: 0.5, end: 1.5)),
                    child: Container(
                        width: 100, height: 100, color: Colors.yellow)),
                SlideTransition(
                  position:
                      Tween(begin: const Offset(0, 0), end: const Offset(1, 0))
                          .chain(CurveTween(curve: Curves.bounceOut))
                          .animate(_controller),
                  child:
                      Container(width: 100, height: 100, color: Colors.green),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (refreshing) {
              _controller.reset();
            } else {
              _controller.repeat();
            }
            refreshing = !refreshing;
          });
        },
      ),
    );
  }
}
