import 'package:flutter/material.dart';

class ClipSampleRoute extends StatelessWidget {
  const ClipSampleRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var avatar = Image.asset(
      'images/hacker_avatar.png',
      width: 60,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('ClipSampleRoute'),
      ),
      body: Center(
        child: Column(
          children: [
            avatar,
            ClipOval(
              child: avatar,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: avatar,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: .5,
                  child: avatar,
                ),
                const Text(
                  'Hello world！',
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: .5,
                    child: avatar,
                  ),
                ),
                const Text(
                  'Hello world！',
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: ClipRect(
                clipper: MyClipper(),
                child: avatar,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(10, 10, 40, 40);

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
