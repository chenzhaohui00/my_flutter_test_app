import 'dart:ui';

import 'package:flutter/material.dart';

class ExplicitAnimatedRoute2 extends StatefulWidget {
  const ExplicitAnimatedRoute2({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExplicitAnimatedRoute2State();
  }
}

class _ExplicitAnimatedRoute2State extends State<ExplicitAnimatedRoute2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool refreshing = false;
  late Animation _animation1;
  late Animation _animation2;
  late Animation _animation3;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
    _controller.repeat();
    _animation1 = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: const Interval(0.0, 0.2)))
        .animate(_controller);
    _animation2 = Tween(begin: 0.2, end: 1.0)
        .chain(CurveTween(curve: const Interval(0.2, 0.55)))
        .animate(_controller);
    _animation3 = Tween(begin: 1.0, end: 0.0)
        .chain(CurveTween(curve: const Interval(0.55, 1.0)))
        .animate(_controller);
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
        title: const Text("交错动画"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SlideBox(
                  _controller, Colors.blue[100]!, const Interval(0.0, 0.2)),
              SlideBox(
                  _controller, Colors.blue[300]!, const Interval(0.2, 0.4)),
              SlideBox(
                  _controller, Colors.blue[500]!, const Interval(0.4, 0.6)),
              SlideBox(
                  _controller, Colors.blue[700]!, const Interval(0.6, 0.8)),
              SlideBox(
                  _controller, Colors.blue[900]!, const Interval(0.8, 1.0)),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: Tween(begin: 0.3, end: 1.0).evaluate(_controller),
                    child: Container(
                      width: 300,
                      height: Tween<double>(begin: 100, end: 150)
                          .evaluate(_controller),
                      color: Colors.green,
                      child: const Center(
                          child: Text(
                        "AnimatedBuilder",
                        style: TextStyle(fontSize: 40),
                      )),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return Opacity(
                      opacity: _animation2.value,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                            gradient: RadialGradient(
                                colors: [Colors.blue[600]!, Colors.blue[100]!],
                                stops:
                                    // _controller.value,
                                    // _controller.value + 0.1
                                    _controller.value < 0.55
                                        ? [
                                            _animation1.value,
                                            _animation1.value + 0.1
                                          ]
                                        : [
                                            _animation3.value,
                                            _animation3.value + 0.1
                                          ])),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
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

class SlideBox extends StatelessWidget {
  SlideBox(this.controller, this.color, this.interval, {Key? key})
      : super(key: key);

  AnimationController controller;
  Color color;
  Interval interval;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: Tween<Offset>(begin: Offset.zero, end: const Offset(0.1, 0.0))
            .chain(CurveTween(curve: Curves.bounceOut))
            .chain(CurveTween(curve: interval))
            .animate(controller),
        child: Container(width: 300, height: 100, color: color));
  }
}
