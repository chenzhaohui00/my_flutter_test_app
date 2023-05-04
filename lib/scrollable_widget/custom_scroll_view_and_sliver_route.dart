import 'package:flutter/material.dart';

class CustomScrollViewAndSliverRoute extends StatelessWidget {
  const CustomScrollViewAndSliverRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // return buildSliverList();
    return buildSliverList2();
    // return buildSliverList3();
    // return buildSliverList4();
  }
}

Widget buildSliverList() {
  //新建两个sliver
  var listView = SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate((context, index) {
        return ListTile(
          title: Text('$index'),
        );
      }, childCount: 50));
  return Scaffold(
    appBar: AppBar(
      title: const Text('SliverList'),
    ),
    body: CustomScrollView(
      slivers: [listView, listView],
    ),
  );
}

Widget buildSliverList2() {
  return Material(
    child: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text("SliverList2"),
          floating: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'images/sea.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((_, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 10)],
                  child: Text('grid item $index'),
                );
              }, childCount: 49),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5)),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((_, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 10)],
                child: Text("list item $index"),
              );
            }, childCount: 30),
            itemExtent: 50)
      ],
    ),
  );
}

Widget buildSliverList3() {
  return Scaffold(
    appBar: AppBar(
      title: const Text("buildSliverList3"),
    ),
    body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: PageView(
            children: const [
              Center(
                child: Text(
                  "Page 1",
                  textScaleFactor: 5,
                ),
              ),
              Center(
                child: Text(
                  "Page 2",
                  textScaleFactor: 5,
                ),
              ),
              Center(
                child: Text(
                  "Page 3",
                  textScaleFactor: 5,
                ),
              )
            ],
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((_, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 10)],
                child: Text("list item $index"),
              );
            }, childCount: 30),
            itemExtent: 50)
      ],
    ),
  );
}

Widget buildSliverList4() {
  return Material(
      child: CustomScrollView(
    slivers: [
      buildNumSliverList(),
      SliverPersistentHeader(
        floating: true,
          delegate: SliverHeaderDelegate(
              child: buildHeader(0), maxHeight: 80, minHeight: 40)),
      buildNumSliverList(),
      SliverPersistentHeader(
          pinned: true,
          delegate:
              SliverHeaderDelegate.fixHeight(height: 60, child: buildHeader(1))),
      buildNumSliverList(count: 20),
    ],
  ));
}

Widget buildNumSliverList({int count = 5}) {
  return SliverFixedExtentList(
    delegate: SliverChildBuilderDelegate((_, index) {
      return ListTile(
        title: Text(
          '$index',
          textScaleFactor: 2,
        ),
      );
    }, childCount: count),
    itemExtent: 50,
  );
}

Widget buildHeader(int i) {
  return Container(
    key: GlobalKey(),
    color: Colors.lightBlue.shade200,
    alignment: Alignment.centerLeft,
    child: Text('Header $i'),
  );
}

typedef SliverHeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final SliverHeaderBuilder builder;

  SliverHeaderDelegate({
    required this.maxHeight,
    this.minHeight = 0,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        assert(minHeight <= maxHeight && minHeight >= 0);

  SliverHeaderDelegate.fixHeight(
      {required double height, required Widget child})
      : builder = ((a, b, c) => child),
        minHeight = height,
        maxHeight = height;

  SliverHeaderDelegate.builder(
      {required this.maxHeight, this.minHeight = 0, required this.builder});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    assert(() {
      if (child.key != null) {
        debugPrint(
            '${child.key}: shrink: $shrinkOffset, overlaps: $overlapsContent');
      }
      return true;
    }.call());
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxHeight ||
        oldDelegate.minExtent != minHeight;
  }
}
