import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class WillPopScopeRoute extends StatelessWidget {

  DateTime? _lastPressAt;

  final Logger _logger = Logger();

  WillPopScopeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          _logger.d('onWillPop');
          if (_lastPressAt == null || DateTime.now().difference(_lastPressAt!) > const Duration(seconds: 1)) {
            _lastPressAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('WillPopScopeRoute')),
          body: Container(
            alignment: Alignment.center,
            child: const Text('1秒内连续按两次返回键退出'),
          ),
        ));
  }
}
