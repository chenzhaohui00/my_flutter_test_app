import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimatedRoute extends StatefulWidget {
  const ImplicitAnimatedRoute({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImplicitAnimatedRouteState();
  }
}

class _ImplicitAnimatedRouteState
    extends State<ImplicitAnimatedRoute> {
  double _height = 70;
  bool _isSelected = false;
  int _counter = 5;
  int _numUp = 5;
  int _numDown = 6;
  final int _numFontHeight = 85;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImplicitAnimatedWidget"),
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
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 300,
                  height: _height,
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
            ),
            Container(
                width: 300,
                height: 100,
                color: Colors.blueGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GestureDetector(
                          onTap: () => {
                                setState(() {
                                  _numDown = _counter;
                                  _counter = max(0, _counter-1);
                                  _numUp = _counter;
                                })
                              },
                          child: const Text("-",
                              style:
                                  TextStyle(fontSize: 60, color: Colors.yellow))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(end: _counter.toDouble()),
                        duration: const Duration(milliseconds: 500),
                        builder: (BuildContext context, double value, Widget? child) {
                          var whole = value ~/ 1;
                          var decimal = value - whole;
                          if (decimal == 0 && value - _counter == 1.0) {
                            decimal = 1.0;
                          }
                          if (value == _counter) {
                            if (_numUp == _counter) {
                              decimal = 0;
                            } else if(_numDown == _counter) {
                              decimal = 1.0;
                            }
                          }
                          debugPrint("decimal:$decimal");
                          return SizedBox(
                            width: 100,
                            child: Stack(children: [
                              Positioned(
                                top: -_numFontHeight * decimal, // 0 -> -_numFontHeight
                                child: Text(
                                  "$_numUp",
                                  style: const TextStyle(fontSize: 80),
                                ),
                              ),
                              Positioned(
                                top: _numFontHeight - _numFontHeight * decimal, // _numFontHeight -> 0
                                child: Text("$_numDown",
                                    style: const TextStyle(fontSize: 80)
                                ),
                              )
                            ]),
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        setState((){
                          _numUp = _counter;
                          _counter = min(99, _counter+1);
                          _numDown = _counter;
                        })
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("+",
                            style: TextStyle(fontSize: 60, color: Colors.yellow)),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _height += 20;
            if (_height >= 500) _height = 70;
            _isSelected = !_isSelected;
          });
        },
      ),
    );
  }
}
