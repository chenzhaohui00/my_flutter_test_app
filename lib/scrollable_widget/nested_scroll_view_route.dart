import 'package:flutter/material.dart';

class NestedScrollViewRoute extends StatelessWidget {
  const NestedScrollViewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // return Material(child: nestedTabView());
    // return Material(child: nestedList1());
    return Material(child: nestedList2());
  }
}

Widget nestedList1() {
  return NestedScrollView(
    headerSliverBuilder: (ctx, innerBoxIsScrolled) {
      return [
        SliverAppBar(
          floating: true,
          snap: true,
          expandedHeight: 200,
          forceElevated: innerBoxIsScrolled,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset('images/sea.jpg', fit: BoxFit.cover),
          ),
        )
      ];
    },
    body: ListView.builder(
      itemBuilder: (_, index) {
        return SizedBox(
          height: 50,
          child: Center(
            child: Text('Item $index'),
          ),
        );
      },
      itemCount: 50,
      itemExtent: 50,
    ),
  );
}

Widget nestedList2() {
  return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              floating: true,
              snap: true,
              expandedHeight: 200,
              forceElevated: innerBoxIsScrolled,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('images/sea.jpg', fit: BoxFit.cover),
              ),
            ),
          )
        ];
      },
      body: Builder(builder: (context) {
          return CustomScrollView(slivers: [
            SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)
            ),
            SliverFixedExtentList(
              delegate: SliverChildListDelegate(buildSliverNumList(50)),
              itemExtent: 50,
            )
          ]);
        })
      );
}

List<Widget> buildSliverNumList(int count) {
  if (count <= 0) throw Exception();
  var list = <Widget>[];
  for (int i = 0; i < count; i++) {
    list.add(Text('$i'));
  }
  return list;
}

Widget nestedTabView() {
  final tabs = <String>['猜你喜欢', '今日特价', '发现更多'];
  return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  floating: true,
                  snap: true,
                  title: const Text('商城'),
                  bottom: TabBar(
                    tabs: tabs
                        .map((e) => Tab(
                              text: e,
                            ))
                        .toList(),
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            children: tabs.map((e) {
              return Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context)),
                      SliverPadding(
                        padding: const EdgeInsets.all(8),
                        sliver: SliverFixedExtentList(
                          itemExtent: 50,
                          delegate: SliverChildBuilderDelegate((_, index) {
                            return Text('$index');
                          }),
                        ),
                      )
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
      ));
}
