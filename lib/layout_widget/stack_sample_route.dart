import 'package:flutter/material.dart';

class StackSampleRoute extends StatelessWidget {
  const StackSampleRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('StackSampleRoute'),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.expand,
            children: [
              const Positioned(left: 18, child: Text('left:18')),
              Container(
                color: Colors.red,
                child: const Text(
                  'text',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Positioned(top: 18, child: Text('top:18'))
            ],
          ),
        ));
  }
}
