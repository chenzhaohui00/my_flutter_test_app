import 'package:flutter/material.dart';
import 'package:my_app/util/layout_log_print.dart';

class GridViewRoute extends StatefulWidget {
  const GridViewRoute({super.key});

  @override
  State<StatefulWidget> createState() => GridViewRouteState();
}

class GridViewRouteState extends State<GridViewRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('GridViewRoute'),),
        // body: count()
        // body: extent()
        body: builder()
    );
  }

  Widget count() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: getIconChildren(),
    );
  }

  Widget extent() {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      childAspectRatio: 2,
      children: getIconChildren(),
    );
  }

  Widget builder() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 2),
      itemBuilder: (context, index) {
        return Container(
            decoration: BoxDecoration(
                border: Border.all()
            ), child: ListTile(title: Text('$index'))
        );
      },
    );
  }

  List<Widget> getIconChildren() {
    return [
      LayoutLogPrint(child: Container(
        decoration: BoxDecoration(
            border: Border.all()
        ),
        child: const Icon(Icons.ac_unit),
      ))
      , Container(
        decoration: BoxDecoration(
            border: Border.all()
        ),
        child: const Icon(Icons.airport_shuttle),
      ), Container(
        decoration: BoxDecoration(
            border: Border.all()
        ),
        child: const Icon(Icons.all_inclusive),
      ), Container(
        decoration: BoxDecoration(
            border: Border.all()
        ),
        child: const Icon(Icons.beach_access),
      ), Container(
        decoration: BoxDecoration(
            border: Border.all()
        ),
        child: const Icon(Icons.cake),
      ), Container(
        decoration: BoxDecoration(
            border: Border.all()
        ),
        child: const Icon(Icons.free_breakfast),
      )
    ];
  }
}