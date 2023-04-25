import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressSampleRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgressSampleRoute'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: LinearProgressIndicator(
                  value: .8,
                  valueColor: const AlwaysStoppedAnimation(Colors.green),
                  backgroundColor: Colors.grey[200])),
          Padding(
              padding: const EdgeInsets.all(20),
              child: CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation(Colors.blue),
                  backgroundColor: Colors.grey[200])),
          Padding(
              padding: const EdgeInsets.all(20),
              child: CircularProgressIndicator(
                  value: 0.3,
                  valueColor: const AlwaysStoppedAnimation(Colors.blue),
                  backgroundColor: Colors.grey[200])),
        ],
      ),
    );
  }
}
