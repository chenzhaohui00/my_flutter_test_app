import 'package:flutter/material.dart';

class FittedBoxRoute extends StatelessWidget {
  const FittedBoxRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FittedBoxRoute'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            wContainer(BoxFit.none),
            const Text('BoxFit.none'),
            wContainer(BoxFit.contain),
            const Text('BoxFit.contain'),
            wRow(' 90000000000000000 '),
            SingleLineFittedBox(child: wRow(' 9000000000000000000 ')),
            wRow('8000'),
            SingleLineFittedBox(child: wRow('8000'),)
          ],
        ),
      )
    );
  }

  Widget wContainer(BoxFit boxFit) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        child: Container(
          width: 80,
          height: 60,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget wRow(String text) {
    Widget widget = Text(text);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [widget, widget, widget],
    );
  }

}

class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key,this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              //让 maxWidth 使用屏幕宽度
                minWidth: constraints.maxWidth,
                maxWidth: double.infinity
            ),
            child: child,
          ),
        );
      },
    );
  }
}