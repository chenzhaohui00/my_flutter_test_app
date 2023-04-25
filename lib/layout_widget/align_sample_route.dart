import 'package:flutter/material.dart';

class AlignSampleRoute extends StatelessWidget {
  const AlignSampleRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AlignSampleRoute'),),
      body: Column(
        children: [
          Container(
            color: Colors.blue.shade50,
            child: const Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment.center,
              child: FlutterLogo(size: 80,),
            )
          ),
          Container(
            color: Colors.blue.shade50,
            child: const Align(
              widthFactor: 3,
              heightFactor: 3,
              alignment: FractionalOffset(0.5, 0.5),
              child: FlutterLogo(size: 80,),
            )
          ),
        ],
      ),
    );
  }

}