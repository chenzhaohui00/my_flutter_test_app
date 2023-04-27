import 'package:flutter/material.dart';

class SingleChildScrollViewRoute extends StatelessWidget {
  const SingleChildScrollViewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollViewRoute'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: str
                .split("")
                .map((e) => Text(
                      e,
                      textScaleFactor: 2.0,
                    ))
                .toList(),
          )),
        ),
      ),
    );
  }
}
