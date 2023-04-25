import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSampleWidget extends StatelessWidget {
  const ButtonSampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ButtonSampleWidget'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () => debugPrint('点了悬浮按钮'),
                label: const Text('悬浮按钮'),
                icon: const Icon(Icons.send),
              ),

              TextButton.icon(
                icon: const Icon(Icons.info),
                onPressed: () => debugPrint('点了文本按钮'),
                label: const Text('文本按钮')),

              OutlinedButton.icon(
                onPressed: () => debugPrint('点了边框按钮'),
                label: const Text('边框按钮'),
                icon: const Icon(Icons.add),),

              IconButton(
                onPressed: () => debugPrint('点了icon按钮'),
                icon: Image.asset('images/plus_icon.png')
              ),


            ],
          )
        )
    );
  }

}