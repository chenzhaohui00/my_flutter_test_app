import 'package:flutter/material.dart';

class ConstraintsSampleRoute extends StatelessWidget {
  final _redBox =
  const DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  const ConstraintsSampleRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ConstraintsSampleRoute"),),
      body: Column(children: [
        ConstrainedBox(
          constraints:
          const BoxConstraints(minWidth: double.infinity, minHeight: 50),
          child: Container(
            height: 5, //指定高度5，但是无法生效
            child: _redBox,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: 80,
            width: 80,
            child: _redBox,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 60, minHeight: 90),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 90, minHeight: 20),
              child: _redBox,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 60, minHeight: 90),
            child: UnconstrainedBox(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 90, minHeight: 20),
                child: _redBox,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
