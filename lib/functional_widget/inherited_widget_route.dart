import 'package:flutter/material.dart';

class InheritedWidgetRoute extends StatefulWidget {
  const InheritedWidgetRoute({super.key});

  @override
  State<StatefulWidget> createState() => _InheritedWidgetRouteState();
}

class _InheritedWidgetRouteState extends State<InheritedWidgetRoute> {
  var _data = 5;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ShareIntDataWidget(data: _data, child: _TestWidget()),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _data++;
              });
            },
            child: const Text(
              'Add Data',
            )
        )
      ]),
    );
  }
}

class ShareIntDataWidget extends InheritedWidget {
  final int data;

  const ShareIntDataWidget(
      {super.key, required this.data, required super.child});

  @override
  bool updateShouldNotify(covariant ShareIntDataWidget oldWidget) {
    return data != oldWidget.data;
  }

  static ShareIntDataWidget of(BuildContext ctx) {
    // return ctx.dependOnInheritedWidgetOfExactType<ShareIntDataWidget>();
    return ctx.getElementForInheritedWidgetOfExactType<ShareIntDataWidget>()!.widget as ShareIntDataWidget;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareIntDataWidget.of(context)!.data.toString(), textScaleFactor: 3);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('didChangeDependencies');
  }
}
