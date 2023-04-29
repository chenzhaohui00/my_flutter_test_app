import 'package:flutter/material.dart';

class PageViewRoute extends StatefulWidget {
  const PageViewRoute({super.key});

  @override
  State<StatefulWidget> createState() => PageViewRouteState();
}

class PageViewRouteState extends State<PageViewRoute> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (int i = 0; i < 6; i++) {
      children.add(Page(
        text: i.toString(),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageViewRoute'),
      ),
      body: PageView(
        // allowImplicitScrolling: true,
        // pageSnapping: true,
        children: children,
        onPageChanged: (index) {
          debugPrint('onPageChanged: $index');
        },
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key, required this.text});

  final String text;

  @override
  State<StatefulWidget> createState() => PageState();

}

class PageState extends State<Page> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    debugPrint("build ${widget.text}");
    return Center(
      child: Text(widget.text, textScaleFactor: 5),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
