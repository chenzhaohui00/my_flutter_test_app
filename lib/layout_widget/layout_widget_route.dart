import 'package:flutter/material.dart';
import 'package:my_app/layout_widget/wrap_flow_sample_route.dart';

import 'align_sample_route.dart';
import 'constraints_sample_route.dart';
import 'flex_sample_route.dart';
import 'layout_builder_route.dart';
import 'row_column_sample_route.dart';
import 'stack_sample_route.dart';

class LayoutWidgetRoute extends StatelessWidget {
  const LayoutWidgetRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LayoutWidgetRoute"),),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const ConstraintsSampleRoute();
                }));
              }, child: const Text('ConstraintsSampleRoute'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const RowColumnSampleRoute();
                  }));
                }, child: const Text("RowColumnSampleRoute")
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const FlexSampleRoute();
                  }));
                }, child: const Text("FlexSampleRoute")
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const WrapFlowSampleRoute();
                  }));
                }, child: const Text("WrapFlowSampleRoute")
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const StackSampleRoute();
                  }));
                }, child: const Text("StackSampleRoute")
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const AlignSampleRoute();
                  }));
                }, child: const Text("AlignSampleRoute")
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const LayoutBuilderRoute();
                  }));
                }, child: const Text("LayoutBuilderRoute")
            )
          ],
        ),
      )
    );
  }

}