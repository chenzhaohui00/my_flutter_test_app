import 'package:flutter/material.dart';

class ContainerSampleRoute extends StatelessWidget {
  const ContainerSampleRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContainerSampleRoute'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 80,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red, Colors.orange]),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 1)
                  ]),
              transform: Matrix4.rotationZ(.2),
              child: const Text(
                '5.20',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
