import 'package:flutter/material.dart';

class RowColumnSampleRoute extends StatelessWidget {
  const RowColumnSampleRoute({super.key});

  final redDecoration = const BoxDecoration(color: Colors.red);
  final blueDecoration = const BoxDecoration(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("RowColumnSampleRoute"),
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.grey),
          child: Column(
            children: [
              DecoratedBox(
                decoration: redDecoration,
                child: Row(
                  children: const [Text("default")],
                ),
              ),
              DecoratedBox(
                  decoration: redDecoration,
                  child: Row(textDirection: TextDirection.rtl, children: const [
                    Text(
                      'textDirection: rtl,text1',
                    ),
                    Text('text2   ')
                  ])),
              DecoratedBox(
                decoration: redDecoration,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [Text("mainAxisSize: min")],
                ),
              ),
              DecoratedBox(
                decoration: redDecoration,
                child: Row(
                  verticalDirection: VerticalDirection.up, //向上
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "verticalDirection up",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text("crossAxisAlignment start"),
                  ],
                ),
              ),
              DecoratedBox(
                decoration: blueDecoration,
                child: Column(children: const [
                  Text('default text1'),
                  Text('default text2')
                ]),
              )
            ],
          ),
        ));
  }
}
