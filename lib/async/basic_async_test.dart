import 'dart:async';

import 'package:flutter/material.dart';

class BasicAsyncTestWidget extends StatefulWidget {
  const BasicAsyncTestWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return BasicAsyncTestState();
  }

}

class BasicAsyncTestState extends State<BasicAsyncTestWidget> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LayoutWidgetRoute"),
      ),
      body: Center(
          child: Column(
            children: [
              Text(_counter.toString(),
                style: TextStyle(fontSize: 40, color: Colors.blue[300]),),
            ],
          )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        test();
        // test1();
        // test2();
        // test3();
        test4();
        // test5();
      }),
    );
  }

  test5() async {
    debugPrint("errorFuture");
    errorFuture()
        .then((value) => debugPrint("success"))
        .catchError((error) => debugPrint("error"))
        .whenComplete(() => debugPrint("complete"));

    // debugPrint("then写法");
    intFuture()
        .then((value) {
          debugPrint("then value:$value");
          return value+1;
        })
        .then((value) => debugPrint("then2 value:$value"))
        .catchError((err) => debugPrint("catchError:$err"))
        .whenComplete(() => debugPrint("whenComplete"));

    try {
      int then1 = await intFuture();
      debugPrint("then1:$then1");
      then1++;
      debugPrint("after add:$then1");
    } catch (e) {
      print(e);
    }
  }

  errorFuture() {
    return Future.error(Exception("something went wrong"));
  }

  intFuture() {
    return Future.error(Exception("opps"));
    // return Future.delayed(const Duration(milliseconds: 100), () => 1);
  }

  test() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _counter++;
      });
    });
  }

  test4() {
    Future.delayed(const Duration(milliseconds: 500), () => debugPrint("delay"))
        .then((value) {
      scheduleMicrotask(() => debugPrint("microtask"));
      debugPrint("then1");
    }).then((value) => debugPrint("then2"));
  }

  test3() {
    scheduleMicrotask(() => debugPrint("microtask1"));
    Future.microtask(() => debugPrint("microtask2"));
    Future.value(1).then((_) => debugPrint("microtask3"));
    debugPrint("1");
  }

  test1() {
    getFuture().then((value) => debugPrint(value)); //event queue
    debugPrint("hi");
  }

  test2() {
    debugPrint("1");
    Future.sync(() => debugPrint("sync1"));
    Future.value(getName());
    debugPrint("2");
  }

  String getName() {
    debugPrint("get name");
    return "bob";
  }

  Future<String> getFuture() => Future(() => "alice");

}