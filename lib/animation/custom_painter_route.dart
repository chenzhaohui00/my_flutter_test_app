import 'dart:math';

import 'package:flutter/material.dart';

class CustomPainterRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomPainterState();
  }
}

class CustomPainterState extends State<CustomPainterRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Snowflake> _snowflakes = [];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat();
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
        title: const Text("CustomPainterRoute"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue[300]!, Colors.white],
                  stops: const [0.4, 0.9])),
          constraints: const BoxConstraints.expand(),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return CustomPaint(
                painter: _MyPainter(_snowflakes),
              );
            },
          ),
          // decoration: ,
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {

  final List<_Snowflake> _snowflakes;

  _MyPainter(this._snowflakes);

  final Paint _paint = Paint()..color = Colors.white;

  @override
  void paint(Canvas canvas, Size size) {
    //处理所有❄️
    if(_snowflakes.isEmpty) {
      debugPrint("生成新的SnowFlake");
      for (var i = 0; i < 100; i++) {
        _snowflakes.add(_Snowflake(size));
      }
    }
    //画☃️
    canvas.drawCircle(size.center(const Offset(0, 80)), 40, _paint);
    canvas.drawOval(
        Rect.fromCenter(
            center: size.center(const Offset(0, 250)), width: 150, height: 300),
        _paint);
    // 画❄️
    for (var snowflake in _snowflakes) {
      canvas.drawCircle(Offset(snowflake.x, snowflake.y),
          snowflake.radius.toDouble(), _paint);
      snowflake.fall();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _Snowflake {
  double x, y, speed = Random().nextDouble() * 4 + 2;
  double radius = Random().nextDouble() * 2 + 2;
  Size maxSize;

  _Snowflake(this.maxSize)
      : x = Random().nextDouble() * maxSize.width,
        y = Random().nextDouble() * maxSize.height;

  fall() {
    y += speed;
    if (y > maxSize.height.toInt()) {
      y = 0;
    }
    // debugPrint("snowflake:${toString()}");
  }

  @override
  String toString() {
    return '_Snowflake{x: $x, y: $y, speed: $speed, radius: $radius}';
  }
}
