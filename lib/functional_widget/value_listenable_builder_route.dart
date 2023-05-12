import 'package:flutter/material.dart';

class ValueListenableBuilderRoute extends StatelessWidget {

  final ValueNotifier<int> notifier = ValueNotifier(0);

  ValueListenableBuilderRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(''),),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (_, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child!,
                Text('$value 次')
              ]
            );
          },
          child: const Text('点击了 '),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          notifier.value++;
        },
      ),
    );
  }

}