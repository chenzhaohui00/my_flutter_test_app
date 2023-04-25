import 'package:flutter/material.dart';

import 'clip_sample_route.dart';
import 'container_sample_route.dart';
import 'decorated_box_route.dart';
import 'fitted_box_route.dart';
import 'scaffold_sample_route.dart';
import 'transform_sample_route.dart';

class ContainerWidgetRoute extends StatelessWidget {
  const ContainerWidgetRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ContainerWidgetRoute"),
        ),
        body: Center(
            child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const DecoratedBoxRoute();
                  }));
                },
                child: const Text('DecoratedBoxRoute')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TransformSampleRoute();
                  }));
                },
                child: const Text('TransformSampleRoute')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ContainerSampleRoute();
                  }));
                },
                child: const Text('ContainerSampleRoute')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ClipSampleRoute();
                  }));
                },
                child: const Text('ClipSampleRoute')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FittedBoxRoute();
                  }));
                },
                child: const Text('FittedBoxRoute')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ScaffoldSampleRoute();
                  }));
                },
                child: const Text('ScaffoldSampleRoute'))
          ],
        )));
  }
}
