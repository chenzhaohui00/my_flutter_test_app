import 'package:flutter/material.dart';
import 'form_sample_route.dart';
import 'progress_sample_route.dart';
import 'text_field_sample.dart';
import 'text_sample_widget.dart';
import 'button_sample_widget.dart';
import 'switch_checkbox_sample.dart';

class BasicWidgetRoute extends StatelessWidget {
  const BasicWidgetRoute({super.key});

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
                    return const TextSampleWidget();
                  }));
                },
                child: const Text('TextSampleWidget')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ButtonSampleWidget();
                  }));
                },
                child: const Text('ButtonSampleWidget')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SwitchAndCheckBoxTestRoute();
                  }));
                },
                child: const Text('SwitchAndCheckBoxTestRoute')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TextFieldTestRoute();
                  }));
                },
                child: const Text('TextFieldTestRoute')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FormSampleRoute();
                  }));
                },
                child: const Text('FormSampleRoute')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProgressSampleRoute();
                  }));
                },
                child: const Text('ProgressSampleRoute'))
          ],
        )));
  }
}
