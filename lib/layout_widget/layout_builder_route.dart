import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LayoutBuilderRoute extends StatelessWidget {
  const LayoutBuilderRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var children = List.filled(6, const Text("A"));
    return Scaffold(
        appBar: AppBar(title: const Text('LayoutBuilderRoute'),),
        body: Column(
          children: [
            // 限制宽度为190，小于 200
            SizedBox(width: 190, child: ResponsiveColumn(children: children)),
            // ResponsiveColumn(children: children),
            LayoutLogPrint(child: const Text("xx"))
          ],
        )
    );
  }
}

class ResponsiveColumn extends StatelessWidget {

  final List<Widget> children;

  const ResponsiveColumn({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 200) {
            return Column(children: children);
          } else {
            var tempChildren = <Widget>[];
            for (int i = 0; i < children.length; i + 2) {
              if (i == children.length - 1) {
                tempChildren.add(children[i + 1]);
              } else {
                tempChildren.add(Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [children[i], children[i + 1]]
                ));
              }
            }
            return Column(children: tempChildren);
          }
        });
  }

}

class LayoutLogPrint<T> extends StatelessWidget {
  LayoutLogPrint({
    Key? key,
    this.tag,
    required this.child,
  }) : super(key: key);

  // final logger = Logger();
  final Widget child;
  final T? tag; //指定日志tag

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert(() {
        // logger.v('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }
}