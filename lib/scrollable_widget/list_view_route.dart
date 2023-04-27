import 'package:flutter/material.dart';
import 'package:my_app/util/layout_log_print.dart';
import 'package:english_words/english_words.dart';
import 'package:logger/logger.dart';

class ListViewRoute extends StatelessWidget {
  const ListViewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      // body: normalBuilder(),
      // body: separatorBuilder(),
      // body: prototypeItemBuilder(),
      // body: const InfiniteListView(),
      body: withHeaderBuilder(),
    );
  }

  Widget normalBuilder() {
    return ListView.builder(
        itemExtent: 50,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(title: Text('$index')));
        });
  }

  Widget separatorBuilder() {
    var dividerBlue = const Divider(color: Colors.blue);
    var dividerGreen = const Divider(color: Colors.green);
    return ListView.separated(
        itemCount: 100,
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? dividerGreen : dividerBlue;
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        });
  }

  Widget prototypeItemBuilder() {
    return ListView.builder(
        prototypeItem: const ListTile(
          title: Text('2023'),
        ),
        itemBuilder: (context, index) {
          return LayoutLogPrint(child: ListTile(title: Text('$index')));
        });
  }

  Widget withHeaderBuilder() {
    return Column(children: [
      const ListTile(
        title: Text('表头'),
      ),
      Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                    title: Text("$index"),
                  )))
    ]);
  }
}

class InfiniteListView extends StatefulWidget {
  const InfiniteListView({super.key});

  @override
  State<StatefulWidget> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##";
  final _words = <String>[loadingTag];
  final _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            if (_words.length >= 100) {
              //没有更多了
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  '没有更多了',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            } else {
              //加载更多
              _retrieveData();
              return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                  ));
            }
          }
          return ListTile(
            title: Text(_words[index]),
          );
        },
        separatorBuilder: (context, index) => const Divider(
              height: .1,
            ),
        itemCount: _words.length);
  }

  @override
  initState() {
    super.initState();
    _retrieveData();
  }

  _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        _words.insertAll(_words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}
