import 'dart:async';

import 'package:flutter/material.dart';

class StreamSample extends StatefulWidget {
  const StreamSample({super.key});

  @override
  State<StreamSample> createState() {
    return StreamSampleState();
  }
}

class StreamSampleState
    extends State<StreamSample> {
  final _stream = Stream.periodic(const Duration(seconds: 1), (i) => i);
  final _controller = StreamController.broadcast();

  @override
  void initState() {
    // _stream.listen((event) {
    //   print(event);
    // });
    _controller.stream.listen((event) {
      debugPrint("receive: $event");
    }, onError:  (error, stackTrace){
      debugPrint("receive error: $error");
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FutureBuilderAndStreamBuilder",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 32, color: Colors.black),
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    _controller.sink.add(10);
                  },
                  child: const Text("10")),
              TextButton(
                  onPressed: () {
                    _controller.sink.add("hei");
                  },
                  child: const Text("hei")),
              TextButton(
                  onPressed: () {
                    _controller.sink.addError("oops");
                  },
                  child: const Text("error")),
              TextButton(
                  onPressed: () {
                    _controller.sink.close();
                  },
                  child: const Text("close")),
              StreamBuilder(
                stream: _controller.stream
                    .where((event) => event is int)
                    .map((event) => event * 2)
                    .distinct(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  debugPrint("build");
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text("none: 无数据流");
                    case ConnectionState.waiting:
                      return const Text("waiting：等待数据流");
                    case ConnectionState.active:
                      if (snapshot.hasError) {
                        return Text("active，error：${snapshot.error}");
                      } else {
                        return Text("active，data：${snapshot.data}");
                      }
                    case ConnectionState.done:
                      return const Text("done：数据流已关闭");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
