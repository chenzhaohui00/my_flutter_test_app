import 'package:flutter/material.dart';

class EventListenAndIgnore extends StatelessWidget {
  const EventListenAndIgnore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventListenAndIgnore'),
      ),
      body: Center(
        child: Column(
          children: const [
            ListenerSample(),
            Padding(
                padding: EdgeInsets.only(top: 20), child: AbsorbPointerSample()),
            Padding(
                padding: EdgeInsets.only(top: 20), child: IgnorePointerSample())
          ],
        ),
      ),
    );
  }
}

class ListenerSample extends StatefulWidget {
  const ListenerSample({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListenerSampleState();
  }
}

class ListenerSampleState extends State<ListenerSample> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (ev) => setState(() {
        _event = ev;
      }),
      onPointerMove: (ev) => setState(() {
        _event = ev;
      }),
      onPointerUp: (ev) => setState(() {
        _event = ev;
      }),
      child: Container(
        width: 300,
        height: 120,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.orangeAccent),
        child: Text(
          "${_event?.localPosition ?? ""}",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class AbsorbPointerSample extends StatefulWidget {
  const AbsorbPointerSample({super.key});

  @override
  State<StatefulWidget> createState() {
    return AbsorbPointSampleState();
  }
}

class AbsorbPointSampleState extends State<AbsorbPointerSample> {
  Offset innerPosition = const Offset(0, 0);
  Offset outerPosition = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        onPointerDown: (ev) => setState(() {
          outerPosition = ev.localPosition;
        }),
        onPointerMove: (ev) => setState(() {
          outerPosition = ev.localPosition;
        }),
        onPointerUp: (ev) => setState(() {
          outerPosition = ev.localPosition;
        }),
        child: AbsorbPointer(
          child: Listener(
              onPointerDown: (ev) => setState(() {
                    innerPosition = ev.localPosition;
                  }),
              onPointerMove: (ev) => setState(() {
                    innerPosition = ev.localPosition;
                  }),
              onPointerUp: (ev) => setState(() {
                    innerPosition = ev.localPosition;
                  }),
              child: Container(
                width: 300,
                height: 120,
                decoration: BoxDecoration(color: Colors.blueAccent[100]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AbsorbPointer Position:$outerPosition'),
                    Text('inner Position:$innerPosition')
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class IgnorePointerSample extends StatefulWidget {
  const IgnorePointerSample({super.key});

  @override
  State<StatefulWidget> createState() {
    return IgnorePointerSampleState();
  }
}

class IgnorePointerSampleState extends State<IgnorePointerSample> {
  Offset innerPosition = const Offset(0, 0);
  Offset outerPosition = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        onPointerDown: (ev) => setState(() {
          outerPosition = ev.localPosition;
        }),
        onPointerMove: (ev) => setState(() {
          outerPosition = ev.localPosition;
        }),
        onPointerUp: (ev) => setState(() {
          outerPosition = ev.localPosition;
        }),
        child: IgnorePointer(
          child: Listener(
              onPointerDown: (ev) => setState(() {
                    innerPosition = ev.localPosition;
                  }),
              onPointerMove: (ev) => setState(() {
                    innerPosition = ev.localPosition;
                  }),
              onPointerUp: (ev) => setState(() {
                    innerPosition = ev.localPosition;
                  }),
              child: Container(
                width: 300,
                height: 120,
                decoration: BoxDecoration(color: Colors.blueAccent[100]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('IgnorePointer Position:$outerPosition'),
                    Text('inner Position:$innerPosition')
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
