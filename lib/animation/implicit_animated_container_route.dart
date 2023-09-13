import 'package:flutter/material.dart';

class ImplicitAnimatedContainerRoute extends StatefulWidget {
  const ImplicitAnimatedContainerRoute({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AnimatedContainerRouteState();
  }
}

class _AnimatedContainerRouteState
    extends State<ImplicitAnimatedContainerRoute> {
  double _height = 100;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit-AnimatedContainer"),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
                width: 300,
                height: 100,
                // color: _isSelected ? Colors.lightGreen : Colors.orangeAccent,
                color: Colors.orangeAccent,
                duration: const Duration(milliseconds: 1000),
                child: AnimatedSwitcher(
                  /*transitionBuilder: (child, animation) {
                    return RotationTransition(turns: animation, child: child);
                  },*/
                  duration: const Duration(seconds: 2),
                  child: _isSelected
                      ? const FlutterLogo(size: 150)
                      : const CircularProgressIndicator(),
                )),
            AnimatedOpacity(
              opacity: _isSelected ? 0.2 : 0.8,
              duration: const Duration(seconds: 2),
              curve: Curves.bounceOut,
              child: Container(
                width: 300,
                height: 100,
                color: Colors.green,
              ),
            ),
            AnimatedPadding(
              curve: Curves.bounceOut,
              padding: EdgeInsets.only(left: _isSelected ? 50 : 0),
              duration: const Duration(milliseconds: 1500),
              child: Container(
                width: 300,
                height: 100,
                color: Colors.blueAccent,
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 0.5),
              curve: Curves.ease,
              duration: const Duration(seconds: 1),
              builder: (BuildContext context, double value, Widget? child) {
                return Container(
                  width: 300,
                  height: 100,
                  color: Colors.yellow,
                  // child: Center(child: Text("Hi", style: TextStyle(fontSize: value))),
                  child: Center(
                      child: Transform.scale(
                    scale: value,
                    child: const Text(
                      "hi",
                      style: TextStyle(fontSize: 60),
                    ),
                  )),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // _height += 100;
            // if (_height >= 500) _height = 100;
            _isSelected = !_isSelected;
          });
        },
      ),
    );
  }
}
