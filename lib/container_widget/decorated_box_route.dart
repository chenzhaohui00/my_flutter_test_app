import 'package:flutter/material.dart';

class DecoratedBoxRoute extends StatelessWidget {
  const DecoratedBoxRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DecoratedBoxRoute'),),
      body: Center(
        heightFactor: 2,
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Colors.red, Colors.orange.shade700]),
              borderRadius: BorderRadius.circular(3),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2,2),
                    blurRadius: 4
                )
              ]
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            child: Text('click'),
          ),
        ),
      )
    );
  }
}