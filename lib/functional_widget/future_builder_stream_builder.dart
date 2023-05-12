import 'package:flutter/material.dart';

class FutureBuilderAndStreamBuilderRoute extends StatelessWidget {
  const FutureBuilderAndStreamBuilderRoute({super.key});

  Future<String> mockNetRequest() {
    return Future.delayed(const Duration(seconds: 3), () => '网络请求完成');
  }

  Stream<int> streamCounter() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilderAndStreamBuilderRoute'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: mockNetRequest(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text(
                      'error:${snapshot.error}',
                      textScaleFactor: 2,
                    );
                  } else {
                    return Text(
                      'result: ${snapshot.data}',
                      textScaleFactor: 2,
                    );
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            StreamBuilder(stream: streamCounter(), builder: (ctx, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('none', textScaleFactor: 2,);
                case ConnectionState.waiting:
                  return const Text('waiting', textScaleFactor: 2,);
                case ConnectionState.active:
                  return Text('${snapshot.data}', textScaleFactor: 2);
                default:
                  return const Text('done', textScaleFactor: 2,);
              }
            })
          ],
        ),)
      ,
    );
  }
}
