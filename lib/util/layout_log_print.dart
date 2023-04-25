import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class LayoutLogPrint<T> extends StatelessWidget {
  LayoutLogPrint({
    Key? key,
    this.tag,
    required this.child,
  }) : super(key: key);

  final logger = Logger();
  final Widget child;
  final T? tag; //指定日志tag

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert(() {
        logger.v('${tag ?? key ?? child}: $constraints');
        // debugPrint('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }
}