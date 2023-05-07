import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class InheritedProvider<T> extends InheritedWidget {
  final T data;

  const InheritedProvider(
      {super.key, required this.data, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  const ChangeNotifierProvider(
      {super.key, required this.data, required this.child});

  final Widget child;
  final T data;

  @override
  State<StatefulWidget> createState() => _ChangeNotifierProviderState<T>();

  static T? of<T>(BuildContext context, {bool listen = true}) {
    final provider = listen? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>() :
      context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()?.widget as InheritedProvider<T>;
    return provider?.data;
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  update() {
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // logger.d('_ChangeNotifierProviderState build');
    return InheritedProvider<T>(data: widget.data, child: widget.child);
  }
}

class Consumer<T> extends StatelessWidget {

  final Widget Function(BuildContext context, T? value) builder;

  const Consumer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context)
    );
  }
}

//商品的bean类
class Item {
  Item(this.price, this.count);

  double price;
  int count;
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

class MyProviderRoute extends StatefulWidget {
  const MyProviderRoute({super.key});

  @override
  State<StatefulWidget> createState() => MyProviderRouteState();
}

class MyProviderRouteState extends State<MyProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<CartModel>(builder: (context, cart) {
                  return Text('合计：${cart?.totalPrice}');
                }),
                Builder(builder: (ctx) {
                  logger.d('build ElevatedButton');
                  final cart = ChangeNotifierProvider.of<CartModel>(context, listen: false);
                  return ElevatedButton(
                      onPressed: () { cart?.add(Item(10, 2)); },
                      child: const Text(
                        "添加商品",
                        textScaleFactor: 2,
                      ));
                })
              ],
            );
          })),
    );
  }
}
