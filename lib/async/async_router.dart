import 'package:flutter/material.dart';

import 'basic_async_test.dart';
import 'stream_sample.dart';

class AsyncRouter extends StatelessWidget {
  const AsyncRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("LayoutWidgetRoute"),
        ),
        body: Center(
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const BasicAsyncTestWidget();
                      }));
                    },
                    child: const Text('TextSampleWidget')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const StreamSample();
                      }));
                    },
                    child: const Text('StreamSample')),

              ],
            )));
  }

}