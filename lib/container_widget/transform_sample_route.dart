import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformSampleRoute extends StatelessWidget {
  const TransformSampleRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransformSampleRoute'),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.3), //3d倾斜
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              color: Colors.red,
              // 平移
              child: Transform.translate(
                offset: const Offset(-20, -5),
                child: const Text('translated'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              color: Colors.red,
              // 缩放
              child: Transform.scale(
                scale: 1.5,
                child: const Text('scaled'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              color: Colors.red,
              // 旋转
              child: Transform.rotate(
                angle: math.pi/2,
                child: const Text('rotate'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              color: Colors.red,
              // 旋转
              child: const RotatedBox(
                quarterTurns: 1,
                child: Text('RotatedBox'),
              ),
            ),
          )
        ],
      )),
    );
  }
}
