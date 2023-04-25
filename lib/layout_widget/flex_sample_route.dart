import 'package:flutter/material.dart';

class FlexSampleRoute extends StatelessWidget {
  const FlexSampleRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlexSampleRoute"),
      ),
      body: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 1, child: Container(height: 30, color: Colors.red)),
              Expanded(
                  flex: 2, child: Container(height: 30, color: Colors.green))
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Expanded(flex: 2, child: Container(height: 50, color: Colors.red)),
                  const Spacer(flex: 1),
                  Expanded(child: Container(height: 50, color: Colors.green)),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
