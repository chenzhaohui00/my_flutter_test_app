import 'package:flutter/material.dart';

class GestureDetectorSample extends StatelessWidget {
  const GestureDetectorSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GestureDetectorSample"),
      ),
      body: Center(
        child: Column(
          children: const [TapAndPressDetector(), _Drag(), _Scale()],
        ),
      ),
    );
  }
}

class TapAndPressDetector extends StatefulWidget {
  const TapAndPressDetector({super.key});

  @override
  State<StatefulWidget> createState() {
    return TapAndPressDetectorState();
  }
}

class TapAndPressDetectorState extends State<TapAndPressDetector> {
  String _text = "detect nothing";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _setText("onTap"),
      onDoubleTap: () => _setText("onDoubleTap"),
      onLongPress: () => _setText("onLongPress"),
      child: Container(
        width: 300,
        height: 120,
        color: Colors.yellow[800],
        alignment: Alignment.center,
        child: Text(
          _text,
          style: const TextStyle(color: Colors.teal),
        ),
      ),
    );
  }

  void _setText(String str) {
    setState(() {
      _text = str;
    });
  }
}

class _Drag extends StatefulWidget {
  const _Drag();

  @override
  State<StatefulWidget> createState() {
    return _DragState();
  }
}

class _DragState extends State<StatefulWidget> {
  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.tealAccent[100]),
      child: SizedBox(
        width: 300,
        height: 200,
        child: Stack(
          children: [
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                  onPanDown: (e) => debugPrint('滑动开始:${e.localPosition}'),
                  onPanUpdate: (e) {
                    setState(() {
                      _left += e.delta.dx;
                      _top += e.delta.dy;
                    });
                  },
                  onPanEnd: (e) => debugPrint('滑动结束，速度:${e.velocity}'),
                  child: const CircleAvatar(
                    child: Text('A'),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class _Scale extends StatefulWidget {
  const _Scale();

  @override
  State<StatefulWidget> createState() {
    return _ScaleState();
  }
  
}

class _ScaleState extends State<_Scale> {
  
  double _width = 0;
  
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(const Size(500, 500)),
      child: GestureDetector(
        onScaleUpdate: (details) {
          setState(() {
            _width = 200 * details.scale.clamp(.8, 10);
          });
        },
        child: Image.asset("images/sea.jpg", width: _width,),
      ),
    );
  }
  
}