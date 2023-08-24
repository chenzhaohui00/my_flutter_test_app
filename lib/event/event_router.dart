import 'package:flutter/material.dart';
import 'package:my_app/event/listener_and_absorb_pointer.dart';

import 'gesture_detector.dart';

class EventRoute extends StatelessWidget {
  const EventRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EventRoute"),),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const EventListenAndIgnore();
                  }));
                },
                child: const Text("EventListenAndIgnore")),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const GestureDetectorSample();
                  }));
                },
                child: const Text("GestureDetectorSample")),
          ],
        ),
      ),
    );
  }

}