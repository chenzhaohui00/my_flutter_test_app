import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ScrollControllerRoute extends StatefulWidget {
  const ScrollControllerRoute({super.key});

  @override
  State<StatefulWidget> createState() {
    // return _ScrollControllerState();
    return ScrollNotificationState();
  }
}

class _ScrollControllerState extends State<ScrollControllerRoute> {
  var showBottomBtn = false;
  final _logger = Logger();

  @override
  Widget build(BuildContext context) {
    final controller =
        ScrollController(initialScrollOffset: 90, keepScrollOffset: true);
    controller.addListener(() {
      setState(() {
        showBottomBtn = controller.offset >= 1000;
      });
      // _logger.d("offset: ${controller.offset}, showBtn: $showBottomBtn");
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('ScrollControllerRoute'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text('$index'),
        ),
        controller: controller,
      ),
      floatingActionButton: showBottomBtn
          ? FloatingActionButton(
              onPressed: () {
                //通过controller返回顶部
                controller.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              child: const Icon(Icons.arrow_upward))
          : null,
    );
  }
}

class ScrollNotificationState extends State<ScrollControllerRoute> {
  var progress = 0;
  final _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScrollControllerRoute'),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            setState(() {
              progress = (notification.metrics.pixels /
                      notification.metrics.maxScrollExtent *
                      100)
                  .toInt();
            });
            return false;
          },
          child: Stack(
            children: [
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 30,
                  itemBuilder: (_, index) => ListTile(
                        title: Text("$index"),
                      )),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: Text('$progress'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
