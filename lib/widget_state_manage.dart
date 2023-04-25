import 'package:flutter/material.dart';

import 'package:my_app/random_words_widget.dart';

class WidgetStateManageSampleRoute extends StatelessWidget {

  const WidgetStateManageSampleRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WidgetStateManageSampleRoute"),
      ),
      body: Column(children: const [
        RandomWordsWidget(),
        TapboxA(),
      ],)
      // body: TapboxBParent(),
      // body: ParentWidgetC(),
    );
  }

}

class TapboxA extends StatefulWidget {

  const TapboxA({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TapboxAState();

}

class TapboxAState extends State<TapboxA> {

  var _active = true;

  _handleTap() {
    // debugDumpLayerTree();
    setState(() => _active = !_active);
  }

  @override
  Widget build(BuildContext context) {
    return TapboxWidget( () => _handleTap(), _active);
  }

}

class TapboxB extends StatelessWidget {

  TapboxB(this.active, this.onTap, {Key? key}) : super(key: key);

  bool active;
  ValueChanged<bool> onTap;

  @override
  Widget build(BuildContext context) {
    return TapboxWidget(() => onTap(!active), active, activeColor: Colors.lightBlue[600]);
  }
}

class TapboxBParent extends StatefulWidget {

  TapboxBParent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TapboxBParentState();
}

class TapboxBParentState extends State<TapboxBParent> {

  bool _active = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(_active, onTapboxBActiveChanged),
    );
  }

  onTapboxBActiveChanged(bool isActive) {
    setState(() {
      _active = isActive;
    });
  }

}

Widget TapboxWidget(GestureTapCallback handleTap, bool active, {Color? activeColor, Color? inactiveColor}) {
  var actColor = activeColor ?? Colors.lightGreen[700];
  var inactColor = inactiveColor ?? Colors.grey[600];
  return GestureDetector(
    onTap: handleTap,
    child: Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          color: active ? actColor : inactColor
      ),
      child: Center(
        child: Text(
          active ? 'Active' : 'Inactive',
          style: const TextStyle(fontSize: 32.0, color: Colors.white),
        ),
      ),
    ),
  );
}

//----------------------------- ParentWidgetC ------------------------------

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key? key, this.active: false, required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return GestureDetector(
      onTapDown: _handleTapDown, // 处理按下事件
      onTapUp: _handleTapUp, // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
            color: const Color(0xFF00796B),
            width: 10.0,
          )
              : null,
        ),
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}